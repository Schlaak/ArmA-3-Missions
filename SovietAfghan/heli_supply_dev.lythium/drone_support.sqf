params ["_caller"];
_caller = player; //TODO
_drone = drone_01;

_ammo = _drone getVariable ["irn_droneAmmo",6];
if (_ammo == 0) exitWith {
	systemChat "Drone hat keine Raketen mehr, RTB für refuel/rearm."
};
_drone setVariable ["irn_droneAmmo",(_ammo - 1),true];

_laser = objNull;
if (!(isNull (laserTarget _caller))) then {
	systemChat "Laserziel erkannt";
	_laser = laserTarget _caller;
} else {
	_list = [];
	waitUntil {
		sleep 2;
		_list = ((getPos _caller nearObjects ["G_40mm_SmokeRed", 400]) + (getPos _caller nearObjects ["SmokeShellRed", 400])) - (_drone getVariable ["smokeBlackList",[]]);
		(count _list > 0)
	};
	_target = selectRandom _list;
	_blackList = _drone getVariable ["smokeBlackList",[]];
	_blackList pushBack _target;
	_drone setVariable ["smokeBlackList",_blackList,true];
	_laser = "LaserTargetC" createVehicle getPos _target;
	systemChat "Roter Rauch erkannt.";
	//TODO kill latertarget obj
};


sleep 3;
systemChat "Rakete los.";
//[getPos _laser,"smokered"] call IRN_fnc_createMarker;
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