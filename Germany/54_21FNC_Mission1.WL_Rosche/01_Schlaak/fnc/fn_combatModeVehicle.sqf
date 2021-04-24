//[this] call Schlaak_fnc_combatModeVehicle
/*
Function applies mechanized infantry mode to vehicle
*/
params ["_dude"];


if (vehicle _dude != _dude) then
	{
		_dude limitSpeed 15; (vehicle _dude) limitSpeed 15; (vehicle _dude) setVehicleLock "LOCKED";
		(vehicle _dude) allowCrewInImmobile true;
		(vehicle _dude) lockDriver true;
		(vehicle _dude) lockturret [[0],true];
		(vehicle _dude) setVehicleLock "LOCKED";

	};
