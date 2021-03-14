
//params: talker (unit receiving sound), index: 0 = player talking, 1 opz first (long) answer, 2 opz second (short) answer
IRN_fnc_sayRandom = {
	params ["_talker","_index"]; //TODO allow language
	////diag_log  str [ "sayRandom:",_talker,_index];
	_sound = nil;
	switch (_index) do {
		case 0: {
			_sound = selectrandom ["Call1","Call2","Call3","Call4","Call5"];
		};
		case 1: {
			_sound = selectrandom ["CP1","CP2","CP7","CP8","cp3","cp4","CP5","CP6","CP9","CP10","CP11"];
		};
		case 2: {
			_sound = selectRandom ["CPu1","CPu2","CPu7","cpu3","cpu4","CPu5","CPu6"];
		};
		default {};
	};
	_talker say3D [_sound,50,1,true];
};


//will init a loop for given drone
IRN_fnc_droneCycle = {
	params ["_drone","_type"];
	diag_log ["this",_this];
	if (isNil "_type") then {
		_type = "init";
		_hasCycle = _drone getVariable ["irn_dronecyle",false];
		if (_hasCycle) exitWith {
			systemChat "drone has cylce already, exitting"
		};
	};
	_drone setVariable ["irn_dronecyle",true,true];

	//delete all old waypoints
	_grp = group currentPilot _drone;
	for "_i" from count waypoints _grp - 1 to 0 step -1 do
	{
		deleteWaypoint [_grp, _i];
	};
	_drone flyInHeightASL [2500,2500,4000];

	if (_type == "init") then {
		_drone setVariable ["irn_droneAmmo",6];
		_drone setFuel 1;

		_loiter = _grp addWaypoint [getPos player, 0, 1, "loiter"];
		_loiter setWaypointType "LOITER";
		_loiter setWaypointLoiterRadius 1000;
		_loiter waypointAttachVehicle player;
		waitUntil {
			sleep 10;
			(_drone getVariable ['irn_droneAmmo',6] <= 0 || (fuel _drone < 0.2))
		};
		systemChat "drone out of ammo or fuel, calling RTB";
		[_drone,"RTB"] call IRN_fnc_droneCycle;
	};

	if (_type == "RTB") then {
		_rtb = _grp addWaypoint [[0,0,0], 0, 1, "RTB"];
		_rtb setWaypointCompletionRadius 1000;
		_rtb setWaypointStatements ["true", "[(vehicle this),'init'] spawn IRN_fnc_droneCycle; systemChat 'RTB successful'"];
	};





	


};

