//[this] execVM "scripts\sniper.sqf";
params ["_sniper"];
waitUntil {time > 10};
//systemChat ("sniper: " + str _sniper);
_handle = [_sniper] spawn {
    params ["_sniper"];
    //create marker
    _marker = createMarker ["sniper" + str time + str random 1000,getPos _sniper];
    _marker setMarkerType "hd_dot";
    //update pos
    while {alive _sniper} do {
        sleep 5;
        _marker setMarkerPos getPos _sniper;
        _marker setMarkerText "sniper " + (_sniper getVariable ["sn_status","nill"]);
    };
    _marker setMarkerText "dead sniper";
    sleep 60;
    deleteMarker _marker;
};


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
        _hasLOS = (((getPos _sniper distance getPos _x) < 1000) && (count _lineBlocked == 0));//&& !(terrainIntersect [_snPos, eyePos _x]) && !(lineIntersects [_snPos, eyePos _x, _x, _sniper]));
        systemChat "no terrain intersect";
        diag_log ["terrain:",terrainIntersect [eyePos _sniper, eyePos _x],"objects:",lineIntersects [eyePos _sniper, eyePos _x, _x, _sniper],"hasLOS:",_hasLOS, " snpos ", _snPos];
        if (_hasLOS) exitWith {
            _sniper doTarget _x;
            _sniper disableAI "path";
            _sniper setUnitPos "auto";
            _sniper setVariable ["sn_status","direct LOS"];
            systemChat "direct LOS, stopping";
            sleep 120;
        }
    } forEach allPlayers;
    if (!_hasLOS) then {
        systemChat "no LOS";
        
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
           systemChat "moving closer to player";
           _sniper setVariable ["sn_status","stalking"];
           _sniper setUnitPos "middle";
        } else {
            _sniper setVariable ["sn_status","waiting"];
            _sniper setUnitPos "down";
            systemChat "no close players, waiting";
        };
    };
    sleep 10;
};
//systemChat "rip snep boi :(";




if (true) exitWith {
   // systemChat "finished sniper"
    };
//---------------------------------------------------------
//JUNKYARD
/*
_this reveal [player,4];
_wp = (group _this) addWaypoint [position player, 0];
_wp setWaypointType "destroy";
_wp waypointAttachVehicle vehicle player;

//MP
systemChat "sniper: " + str _this;
_handle = [_this] spawn {
    systemChat "spawned."
    params ["_sniper"];
    systemChat ("sniper: " + str _sniper);
    while {alive _sniper} do {
        {
            group _sniper forgetTarget _x;
            _sniper reveal [_x,4];
        } forEach allPlayers
        _sniper doTarget (selectRandom allPlayers);
        sleep 5;
        systemChat ("revealing players to sniper at " + str time);
    };
    systemChat "rip snep boi :(";
};


systemChat "sniper: " + str _this;
_handle = [_this] spawn {
    systemChat "spawned."
    params ["_sniper"];
    systemChat ("sniper: " + str _sniper);
    while {alive _sniper} do {
        _sniper doTarget (selectRandom allPlayers);
        sleep 5;
        systemChat ("revealing players to sniper at " + str time);
    };
    systemChat "rip snep boi :(";
};



//requirements:
//freshly placed sniper unit, direct line of sight to target
_this reveal [player,4]; 
_this doTarget player;  //doFire works equally well
_this disableAI "path";
_this setSkill 1;

//AI helicopter gunner target player
//only seems to target Vehicles

//push target vheicle to global var

missionnamespace setVariable ["target",_this,true];
_var = missionnamespace getVariable ["target", 50];
hint str _var;

//tell gunner to fire at target
_var = missionnamespace getVariable ["target", 50];
_this reveal [_var,4]; 
_this doFire _var;  
_this setSkill 1;

//editor init file with suspension:
//target init:
_handle = this spawn {
sleep 1;
player globalChat "setting target";
missionnamespace setVariable ["target",this,true];
_var = missionnamespace getVariable ["target", 50]; 
player globalChat( "target: " + str _var);
};

//init sniper
//code to reveal all nato forces to sniper
_handle = [this] spawn { 
    params ["_sniper"];
    _sniper globalChat ("target acquired for " + str _sniper); 

    _sniper setSkill 1; 
    while {alive _sniper} do {
        private _closest = selectRandom (allUnits select {
         side _x == east
        });
        _sniper globalChat str (allUnits select {
         side _x == east
        });
        { 
            if ((_x distance _sniper) < (_closest distance _sniper)) then {
                _closest = _x;
            };
           _sniper reveal [_x,4]; 
        
           sleep 0.1;
        }foreach (allUnits select {
           side _x == east
        });
        _sniper doFire _closest;  
        _sniper doTarget _closest;  
        _sniper globalChat ("i am: " + str _sniper + "| target: " + str _closest + str side _closest);
        sleep 2;
    };
    _this globalChat "i died :(";
}


//advanced knowledge sniper
//init sniper
_handle = this spawn {   
 hint ("handle has: " + str _this);  
 private _slep = 2;
 sleep _slep;   
 _var = missionnamespace getVariable ["target", 50];    
 _this globalChat "target acquired(?)";   
 _this doFire _var;      
 _this setSkill 1;  
 private _k = 0;  
 for "_i" from 0 to 400 do {  
 _k = _this knowsAbout _var;  
 if (_k >= 4) then { 
 hint "bye"; 
 _slep = 5;
 }; 
 
  _this reveal [_var,_k + 0.1];  
  _this globalChat str _k;  
  sleep _slep;     
 }  
}


