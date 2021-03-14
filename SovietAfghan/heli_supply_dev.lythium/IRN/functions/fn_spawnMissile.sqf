/*
	Author: IR0NSIGHT

	Description:
	Will spawn a missile at defined position, locking in on given target or laser.

	Parameter(s):
		0 :
			position - spawn position of missile.
		1 :
			OBJECT/position - object/position to target, if laser is given, laser is used.
		2 (optional):
			STRING - missile classname (needs to be laser guided), defaults to "CUP_M_AGM_114K_Hellfire_II_AT".
	Returns:
	[missile,targetLaser]
*/
params [
	["_pos",[],[[]],[3]],
	["_target",objNull,[objNull,[]],[3]],
	["_missileType","CUP_M_AGM_114K_Hellfire_II_AT",["donaudampfschifffahrtsgesellschaft"]]
];

private "_localLaser";
if (!(_target isEqualType []) && isNull _target) exitWith { //target not given
	["target for missile not given."] call BIS_fnc_error;
};
if (_target isEqualType [] OR !("LaserTargetC" isEqualTo typeOf _target)) then { //position given
	_target = "LaserTargetC" createVehicle getPos _target;
	_localLaser = true;
} else {
	_localLaser = false;
};

_missile = createVehicle [_missileType,_pos,[],0,"CAN_COLLIDE"];
_dir = [getPosASL _missile,getPosASL player] call IRN_fnc_getDir;
_missile setVectorDir _dir;
_missile setVelocity (_dir vectorMultiply 100);
_missile setMissileTarget _target;
diag_log ["missile",_missile,"target",_target];
if (_localLaser) then {
	[_missile,_target] spawn {
		params ["_missile","_laser"];
		waitUntil {
			sleep 2;
			(isNull _missile)
		};
		deleteVehicle _laser;
	};
};
//return
[_missile,_target]

