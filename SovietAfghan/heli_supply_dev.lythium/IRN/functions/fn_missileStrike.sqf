/*
	Author: IR0NSIGHT

	Description:
	Will spawn a missile at defined air unit's position, locking in on either callers laser (if laser was detected at call) or
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

_target = objNull;
if (!(isNull (laserTarget _caller))) then {
	systemChat "Laserziel erkannt";
	_target = laserTarget _caller;
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
	systemChat "Roter Rauch erkannt.";
};

sleep 3;
systemChat "Rakete los.";
[getPos _drone,_target] call IRN_fnc_spawnMissile;
