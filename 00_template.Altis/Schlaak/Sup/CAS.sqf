///params ["_cas","_caller","_stay"];

//[_cas, , 3] execvm "CAS.sqf";
_cas = _this select 0;		//Firebase for sidechat
_unit = _this select 1;
_caller = _this select 2;		//Caller for sidechat
_stay = _this select 3;			//Number of seconds to stay


sleep 3;
_markerName = selectRandom [( (selectrandom ["CAS","S-13","H-CAS"]) + "-Z-9-" + (str _stay))];
	[_markerName,_cas,_unit, _caller,_stay] spawn {
		params ["_markerName","_cas","_unit","_caller","_stay"];

		sleep 4;
		_cas sidechat ("CAS-Call dest. markieren mit: " + _markerName);
		_cas sideradio "Radio1";
		_marker = nil;

		waitUntil {
			sleep 1;
			{
				if (markerText _x isEqualTo _markerName) exitWith {
					_marker = _x;
				};
			} forEach allMapMarkers;
		(!(isNil "_marker"));

		};

		_eta = ceil ((ceil (_cas distance2d (getMarkerPos _marker)) / 1666) *0.6);

		sleep 3;
		_cas sidechat str _stay;
		_cas sidechat "Pos erhalten. Cas auf Route. Verbleib:" + str ((_stay) / 60) + "Min.";// + (str (ceil ((_stay) / 60))) + ".";
		_cas sideradio "Radio3";
		sleep 1;
		_cas sidechat "Coords:";
		sleep 2;
		_cas sidechat (str mapGridPosition (getMarkerPos _marker));
		sleep 1;
		_cas sidechat ("ETA: " + (str _eta) + " Min.");
		sleep 20;

		_cas sidechat "Liftoff!";
		_impmrk = createmarker ["CAS" + str (floor random 52),getMarkerPos _marker];
		_impmrk setMarkerType "mil_destroy";
		_impmrk setMarkerAlpha 0.5;
		_time = [daytime, "HH:MM"] call BIS_fnc_timeToString;
		_impmrk setMarkerText (_time + " CAS:"  + " " + str (_stay ) + "Min.");
		_cas sideradio "Radio1";

		// [[[_impmrk, 25, false, 1, 1, _eta, 300,"R_230mm_HE",_cas], "02_scripts\arty.sqf"], "BIS_fnc_execVM", false] call BIS_fnc_MP;
		//null = [_impmrk, 25, false, 1, _stay, _eta, 300,"R_230mm_HE",_cas] execVM "02_scripts\arty.sqf";
		_cas sidechat (str _impmrk) + " | " + (str _stay) + " | " + (str _eta) +  " | " + (str _cas);
		_casorigin = getpos _unit;
		_unit domove getMarkerPos _marker;
		waitUntil {
			sleep 3;
			_unit distance2d (getMarkerPos _marker) < 250;
		};
		_cas sideradio "Radio1";
		_cas sidechat "In position!";
		_wp1 = (group _cas) addWaypoint [position _cas, 120];
		_wp1 setWaypointType "SAD";
		sleep (_stay * 0.7);
		_cas sideradio "Radio2";
		_cas sidechat ("Zur Info! Verlassen das Zielgebiet in " +  str (floor (_stay * 0.3)) + " sec." );
		sleep (_stay * 0.3);
		_cas sideradio "Radio3";
		_cas sidechat "Verlassen einsatzgebiet! Zur Info!";
		for "_i" from count waypoints _cas - 1 to 0 step -1 do
		{
			deleteWaypoint [_cas, _i];
		};
		//_cas sidechat "Impact!";
		//_cas sideradio "Radio2";
		//sleep 40;
		sleep 3;
		_unit domove _casorigin;
		//deleteMarker _marker;
		//_cas enableSimulationGlobal false;
};