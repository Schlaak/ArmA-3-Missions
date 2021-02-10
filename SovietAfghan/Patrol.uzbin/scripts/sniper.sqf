//[this] execVM "scripts\sniper.sqf";
params ["_sniper"];
if (!isServer) exitWith {};

_sniper setUnitPos "down";
waitUntil {sleep 10; 
((time > 1200) OR missionnamespace getVariable ["sn_go",false])
};
missionNamespace setVariable ["sn_go",true,true];
systemChat "sniper go!";
//debug marker
_handle = [_sniper] spawn {
    params ["_sniper"];
    //create marker
    _marker = createMarker ["sniper" + str time + str random 1000,getPos _sniper];
    _marker setMarkerType "hd_dot";
    //update pos
    while {alive _sniper} do {
        sleep 5;
        if (missionNamespace getVariable ["sn_debug",false]) then {
            _marker setMarkerAlpha 1;
        } else {
            _marker setMarkerAlpha 0;
        };
        _marker setMarkerPos getPos _sniper;
        _displayText = ("sniper " + (_sniper getVariable ["sn_status","nill"]));
        if (!simulationEnabled _sniper) then {
            _displayText = _displayText + "/frozen";
        };
        if (!(_sniper checkAIFeature "MOVE")) then {
            _displayText = _displayText + "/noMove";
        };
        _marker setMarkerText _displayText
    };
    _marker setMarkerText "dead sniper";
    sleep 60;
    deleteMarker _marker;
};
//call for messages to be logged and displayed. auto checks sn_debug
_debugMssg = {
    params["_mssg"];
    if (missionNamespace getVariable ["sn_debug",false]) then {
        diag_log _mssg;
        systemChat str _mssg;
    };
};
[["sniper script is running for ",_sniper]] call _debugMssg;
while {alive _sniper} do {
    doStop _sniper;
    _sniper setSkill 1;
    _sniper setAmmo [primaryWeapon _sniper,1];
    _hasLOS = false;
    {
        (group _sniper) forgetTarget _x;
        _sniper reveal [_x,4];
        _snPos = getPosATL _sniper;
        _snPos = [_snPos select 0, _snPos select 1, 1];
        _snPos = AGLToASL _snPos;
        _lineBlocked = lineIntersectsSurfaces [_snPos,eyePos _x,_sniper,_x];
        _hasLOS = (((getPos _sniper distance getPos _x) < 800) && (count _lineBlocked == 0));
        if (_hasLOS) exitWith {
            _sniper doTarget _x;
            _sniper disableAI "path";
            _sniper setUnitPos "auto";
            _sniper setVariable ["sn_status","direct LOS"];
            ["direct LOS, stopping"] call _debugMssg;
            sleep 120;
        }
    } forEach allPlayers;
    if (!_hasLOS) then {
        ["no LOS"] call _debugMssg;
        _sniper enableAI "path";
        //move closer
        _closestPlayer = selectRandom allPlayers;
        {
            if ((_x distance _sniper) < (_closestPlayer distance _sniper)) then {
                _closestPlayer = _x;
            }
        } forEach allPlayers;
        if ((_closestPlayer distance _sniper) < 3000) then {
           _sniper doMove getPos _closestPlayer;
            [["stalking player ",str _closestPlayer]] call _debugMssg;
           _sniper setVariable ["sn_status","stalking: " + str (50 * (round ((_sniper distance _closestPlayer)/50)))];
           _sniper setUnitPos "middle";
        } else {
            _sniper setVariable ["sn_status","waiting"];
            _sniper setUnitPos "down";
            ["no close players, waiting"] call _debugMssg;
        };
    };
    sleep 10;
};




