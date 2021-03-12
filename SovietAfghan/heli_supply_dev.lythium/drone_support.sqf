/*
	Author: IR0NSIGHT

	Description:
	Will spawn a cup-hellfire missile at defined air unit's position, locking in on either callers laser (if laser was detected at call) or
	at red smoke near player, randomly selected if multiple ones. Smoke gets blacklisted after targetted.

	Parameter(s):
		0 :
			OBJECT - caller who requested strike, his laser and position (for red smoke )will be used.
		1 (optional):
			OBJECT - drone/air asset which fires missile, defaults to "irn_reaper_01".
		2 (optional):
			STRING - missile classname (needs to be laser guided), defaults to "CUP_M_AGM_114K_Hellfire_II_AT".
		3 (optional):
			INTEGER - missile count the air asset should have before firing.
	Returns:
	none
*/
params [
	["_caller",objNull,[objNull]],
	["_drone",objNull,[objNull]],
	["_missileType","CUP_M_AGM_114K_Hellfire_II_AT",["donaudampfschifffahrtsgesellschaft"]]
];

if (isNull _drone) then {
	if (isNil "irn_reaper_01") exitWith {
		["given drone is nil and default 'irn_reaper_01' does not exist."] call BIS_fnc_error;
	};
	_drone = irn_reaper_01;
};

_ammo = _drone getVariable ["irn_droneAmmo",6];
if (_ammo == 0) exitWith {
	systemChat "Drone hat keine Raketen mehr, RTB für refuel/rearm."
};
if (_drone distance _caller > 3000) exitWith {
	systemChat "Drone ausser Reichweite.";
};

_drone setVariable ["irn_droneAmmo",(_ammo - 1),true];

_laser = objNull;
if (!(isNull (laserTarget _caller))) then {
	systemChat "Laserziel erkannt";
	_laser = laserTarget _caller;
} else {
	_list = [];
	waitUntil { //TODO make loop search for laser too
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

_turret = allTurrets _drone select 0;
_weapons = _drone weaponsTurret _turret;
_missilePod = _weapons select 1;

west reportRemoteTarget [_laser, 3600];  
_laser confirmSensorTarget [west, true];  

_missile = createVehicle [_missileType,(_drone modelToWorld [0,0,-100]),[],0,"CAN_COLLIDE"];
_dir = [getPosASL _missile,getPosASL player] call IRN_fnc_getDir;
_missile setVectorDir _dir;
_missile setVelocity (_dir vectorMultiply 100);
_missile setMissileTarget _laser;
