//[this] execvm scripts\combatmodevehicle.sqf
_dude = _this select 0;

if (vehicle _dude != _dude) then
{
	_dude limitSpeed 15; (vehicle _dude) limitSpeed 15; (vehicle _dude) setVehicleLock "LOCKED";
	(vehicle _dude) allowCrewInImmobile true;
	(vehicle _dude) lockDriver true;
	(vehicle _dude) lockturret [[0],true];

};