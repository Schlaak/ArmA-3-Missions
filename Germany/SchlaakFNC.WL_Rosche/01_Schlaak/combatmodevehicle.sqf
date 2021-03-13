//[this] execvm schlaak\combatmodevehicle.sqf

	//_Threshhold 0-1 percentile threshold when to flee/surrender
	//_captive BOOL is captive yes or no.
	private ["_dude"];
	_dude = _this select 0;


	if (vehicle _dude != _dude) then
	{
		_dude limitSpeed 15; (vehicle _dude) limitSpeed 15; (vehicle _dude) setVehicleLock "LOCKED";
		(vehicle _dude) allowCrewInImmobile true;
		(vehicle _dude) lockDriver true;
		(vehicle _dude) lockturret [[0],true];
		(vehicle _dude) setVehicleLock "LOCKED";

	};
