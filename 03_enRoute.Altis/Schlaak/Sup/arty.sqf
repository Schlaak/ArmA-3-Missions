///params ["_firebase","_caller","_rnds"];

//[arty1, leader black0, 3] execvm "arty.sqf";
_firebase = _this select 0;		//Firebase for sidechat
_caller = _this select 1;		//Caller for sidechat
_rnds = _this select 2;			//Number of rounds


sleep 3;
_markerName = selectRandom [( (selectrandom ["S-S-0","O-11","H-S"]) + "-A-FFE-" + (str _rnds))];
	[_markerName,_firebase,_rnds, _caller] spawn {
		params ["_markerName","_firebase","_rnds","_caller"];

		sleep 4;
		_firebase sidechat ("Artillerieschlaak Position markieren mit: " + _markerName);
		_firebase sideradio "Radio1";
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

		_eta = ceil (((getpos _firebase) distance2d (getmarkerpos _marker))/200);
		
		sleep 3;
		_firebase sidechat "Markierung erhalten. FFE." + (str _rnds) + ".";
		_firebase sideradio "Radio3";
		sleep 1;
		_firebase sidechat "Coords:";
		sleep 2;
		_firebase sidechat (str mapGridPosition (getMarkerPos _marker));
		sleep 1;
		_firebase sidechat ("ETA: " + (str _eta) + " Sec.");
		sleep 6;
		/*
		//_firebase commandArtilleryFire [(getMarkerPos _marker), (currentMagazine _firebase), _rnds];

		[_firebase,[(getMarkerPos _marker),(currentMagazine _firebase),_rnds]] remoteExec ["commandArtilleryFire", 0, true];
		sleep 2;
		[_firebase,[(getMarkerPos _marker),(currentMagazine _firebase),_rnds]] remoteExec ["doArtilleryFire", 0, true];
		*/
		_firebase sidechat "Feuern!";
		_impmrk = createmarker ["strike" + str (floor random 52),getMarkerPos _marker];
		_impmrk setMarkerType "mil_destroy";
		_impmrk setMarkerAlpha 0.5;
		_time = [daytime, "HH:MM"] call BIS_fnc_timeToString;
		_impmrk setMarkerText (_time + " Strike:"  + " " + str _rnds + "rnd.");
		_firebase sideradio "Radio1";

		[[[_impmrk, 25, false, 1, 1, _eta, 300,"R_230mm_HE",_firebase], "02_scripts\arty.sqf"], "BIS_fnc_execVM", false] call BIS_fnc_MP;
		//null = [_impmrk, 25, false, 1, _rnds, _eta, 300,"R_230mm_HE",_firebase] execVM "02_scripts\arty.sqf";
		_firebase sidechat (str _impmrk) + " | " + (str _rnds) + " | " + (str _eta) +  " | " + (str _firebase);
		//_firebase sidechat "Impact!";
		//_firebase sideradio "Radio2";
		//sleep 40;


		//deleteMarker _marker;
		//_firebase enableSimulationGlobal false;
};