//3 states: waiting/sleeping, stalking, shooting
//will set state of sniper to given state. input: state 0,1,2
params ["_unit"];
//diag_log ["#################### stalker script active for ",_unit];
//TODO make global array of snipers
_state = 0;
_target = objNull;
_lastCheck = 0;
//set state of FSM to specified state: 0, 1, 2
_setState = {
    params ["_stateL"];
    if (!(_stateL isEqualType 1)) exitWith { //check if input type is valid
        ["bad input parameter for setstate: ",_stateL] call _debugMssg;
    };

    if (_state != _stateL) then {
        ["changed state from ",_state," to ",_stateL] call _debugMssg;
    };
    _state = _stateL;
    _unit setVariable ["slk_state",_state,true];
};

_debugMssg = {
    _mssg = _this;
    _debugMode = missionNamespace getVariable ["slk_db",0]; //0: none, 1: silent, only diaglog, 2: loud, systemchat.
    if (!(_debugMode isEqualType 420)) exitWith {diag_log ["bad value for stalker debug mode: ",_debugMode]};
    switch (_debugMode) do {
        case 0: {};
        case 1: {diag_log _this;};
        case 2: {diag_log _this; systemChat str _this;};
        default {};
    };
};

//will check if target is allowed.
_isAvailableTarget = {
    params ["_target"];
    _validTarget = true;
    //check distance
    if (((getPos _target) distance (getPos _unit)) >= 2000) exitWith {
        _validTarget = false;
        _validTarget
    };
    //check exclusion zones
    _exclusionZones = missionNamespace getVariable ["slk_exZ",[]];
    {
        if ((getPos _target) in _x) exitWith {
            _validTarget = false;
        };
    } forEach _exclusionZones;
    _validTarget
};

//check if unit has direkt Line of sight to target and is closer than 800m
_hasLOSto = {
    params ["_target"];
    if (isNull _target) exitWith {
        false
    };
    _lineBlocked = lineIntersectsSurfaces [eyePos _unit,eyePos _target,_unit,_target];
    _hasLOS = (((getPos _unit distance getPos _target) < 800) && (count _lineBlocked == 0));
    ["unit has LOS to: ",_target," :",_hasLOS," blocking objects: ",_lineBlocked] call _debugMssg;
    _hasLOS
};

//will return the closest player to the unit which satisfies _isAvailableTarget.
_findClosestAvailableTarget = {
    params ["_targets"];
    if (!(_targets isEqualType [])) exitWith {
        ["bad input type for findClosestAvailableTargets",_targets] call _debugMssg;
        objNull
    };
    _targets = [_targets, [], {getPos _unit distance getPos _x}, "ASCEND"] call BIS_fnc_sortBy;  
    _t = objNull;     
    //search for available targets
    {
        if ([_x] call _isAvailableTarget) exitWith {
            _t = _x;
        }
    } forEach _targets;
    _t
};

//find a target from given array which unit is in firing range and has direct LOS to
_getAimTarget = {
    params ["_targets"];
    if (!(_targets isEqualType [])) exitWith {
        ["bad input type to getAimTargets: ",_targets] call _debugMssg;
        objNull
    };
    _aimTarget = objNull;
    {
        if ([_x] call _hasLOSto) exitWith {
            _aimTarget = _x;
        };
    } foreach (_targets call BIS_fnc_arrayShuffle);
    _aimTarget
};

//creates a debugmarker that periodically gets set to units position, text is value of given variable name.
_debugMarker = {
    //diag_log ["##############","trying to spawn debug marker for",_unit];
    _handle = _this spawn {
        sleep 3;
        params ["_unit","_variableName"];
        _marker = createMarker [str _unit + str time,getPos _unit];
        _marker setMarkerType "hd_dot";
        while {true} do {
            if (alive _unit) then {
                _marker setMarkerText str (_unit getVariable [_variableName,"/"]);
                _marker setMarkerPos (getPos _unit);
            } else {
                _marker setMarkerText "dead";
            };

            if (missionNamespace getVariable ["slk_db",0] == 2) then {
                _marker setMarkerAlpha 1;
            } else {
                _marker setMarkerAlpha 0;
            };
            sleep 5;
        };
        
    };
};

//returns any units of same side nearby a target.
_getBystanders = {
    params ["_target"];
    _bystanders = ASLToAGL getPosASL _target nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"], 50];
    _bystanders = _bystanders select {side _x == side _target};
    _bystanders = _bystanders select {[_x] call _hasLOSto};
    ["bystanders near target are: ", _bystanders] call _debugMssg;
    _bystanders
};
//main loop for units FSM
[_unit,"slk_state"] call _debugMarker;
_unit setSkill 1;
while {alive _unit} do {
   // diag_log ["##############","FSM is looping for ",_unit," time",time," state: ",_state];

    //update state
    switch _state do {
        //waiting/sleeping
        case 0: {
            //search for available targets
            _target = [allPlayers] call _findClosestAvailableTarget;
            if (isNull _target) then {
                [0] call _setState; //stay in sleep mode
            } else {
                [1] call _setState; //go into stalking state
            }
        };

        //stalking
        case 1: {
            //check for LOS to all targets
            _target = [allPlayers] call _getAimTarget;

            if (isNull _target) then { //no LOS to any target
                _target = [allPlayers] call _findClosestAvailableTarget;
                if (isNull _target) then {
                    [0] call _setState;
                } else {
                    [1] call _setState;
                }
            } else { //has LOS to a target || note!!: does not check for exclusionZones or anything related to isValidTarget!!
                [2] call _setState;
            };
        };

        //shooting
        case 2: {
            _target = [allPlayers] call _getAimTarget;

            if (isNull _target) then { //no target to shoot at
                _target = [allPlayers] call _findClosestAvailableTarget;
                if (isNull _target) then { //no LOS targets, no nearby targets -> sleep state
                    [0] call _setState;
                } else { //no LOS targets to shoot at, but nearby ones -> stalk state
                    [1] call _setState;
                }
            } else { //has target to shoot at
                [2] call _setState;
            };
        };
    };
    
    //act according to state:
    switch (_state) do {
        case 0: { //sleepmode
            _unit disableAI "path";
            //_unit setUnitPos "down";
            //TODO add scanning horizon with binocular
        }; 
        case 1: { //stalking
            if (time + 30 > _lastCheck) then {
                            _unit doMove getPos _target;
                _unit enableAI "path";
            };
        };
        case 2: {
            _unit disableAI "path";
            _targets = ([_target] call _getBystanders) + [_target]; //get close units of same side
            if (time + 30 > _lastCheck) then { //every 30 seconds
                {
                    _unit forgetTarget _x;
                    _unit reveal [_x,4]; 
                } foreach _targets;
            };
            _t = selectRandom _targets;
            _unit doTarget _t;
            ["unit has LOS to: ",_targets] call _debugMssg;   
            ["unit is targetting: ",_t] call _debugMssg;     
        };
    };
    _lastCheck = time;
    sleep 15;
};
_unit setVariable ["slk_state","dead",true];

