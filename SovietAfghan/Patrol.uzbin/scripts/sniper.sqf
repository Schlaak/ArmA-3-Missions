_this reveal [player,4];
_wp = (group _this) addWaypoint [position player, 0];
_wp setWaypointType "destroy";
_wp waypointAttachVehicle vehicle player;

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


