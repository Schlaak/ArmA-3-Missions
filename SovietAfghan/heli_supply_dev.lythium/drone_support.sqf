params ["_caller"];
_caller = player;
_drone = drone_01;

//init stuff
_pilot = currentPilot _drone;
_grp = group currentPilot _drone;
_loiter = _grp addWaypoint [getPos player, 0, 1, "loiter"];
_loiter setWaypointType "LOITER";
_loiter setWaypointLoiterRadius 500;
_drone flyInHeight 2500;

//check for colored smoke
//base type "1Rnd_Smoke_Grenade_shell"
_id = [player, "fired", {
	//systemChat "drone fired";
	 diag_log ["this",_this,"thisARgs",_thisArgs,"type bullet:",typeOf (_this select 6)];
	 (_this select 0) removeEventHandler ["fired", _thisID];
	 
	}, _loiter] call CBA_fnc_addBISEventHandler;


_i = 0;
_laser = objNull;
if (laserTarget _caller != objNull) then {
	systemChat "laser erkannt";
	_laser = laserTarget _caller;
} else {
	_list = [];
	waitUntil {
		_i = _i + 1;
		sleep 2;
		systemChat str ("waiting " + str _i);
		_list = ((getPos _caller nearObjects ["G_40mm_SmokeRed", 400]) + (getPos _caller nearObjects ["SmokeShellRed", 400])) - (_drone getVariable ["smokeBlackList",[]]);
		(count _list > 0)
	};
	diag_log ["list",_list];
	_target = selectRandom _list;
	_blackList = _drone getVariable ["smokeBlackList",[]];
	_blackList pushBack _target;
	_drone setVariable ["smokeBlackList",_blackList,true];
	_laser = "LaserTargetC" createVehicle getPos _target;
	//TODO kill latertarget obj
};


//sleep 10;
systemChat "missile away";
[getPos _laser,"smokered"] call IRN_fnc_createMarker;
_turret = allTurrets _drone select 0;
_weapons = _drone weaponsTurret _turret;
_missilePod = _weapons select 1;

west reportRemoteTarget [_laser, 3600];  
_laser confirmSensorTarget [west, true];  
//_handle = _drone fireAtTarget [_laser,_missilePod];

//spawn missile:
//"CUP_M_AGM_114K_Hellfire_II_AT""CUP_M_AGM_114K_Hellfire_II_AT"
_missile = createVehicle ["CUP_M_AGM_114K_Hellfire_II_AT",(_drone modelToWorld [0,0,-100]),[],0,"CAN_COLLIDE"];
_dir = [getPosASL _missile,getPosASL player] call IRN_fnc_getDir;
_missile setVectorDir _dir;
_missile setVelocity (_dir vectorMultiply 100);

_missile setMissileTarget _laser;

/**

_handle = _drone fireAtTarget [player,_missilePod];
//_turret doTarget player;
//_turret doFire player;
_handle = false;
diag_log str ["fired:",_handle,"turrets",allTurrets _drone,"weapons",_weapons,"missiles:",_missilePod];