///params ["_exfil","_caller","_exfildest"];

//[Exfilhelo, thislist select 0, "exfilpos"] execvm "exfil.sqf";
_exfil = _this select 0;		//helo
_caller = _this select 1;		//obj
_exfildest = _this select 2;	//marker
_exfil enableSimulationGlobal true;
group _exfil setVariable ["lambs_danger_disableGroupAI",true];
group _exfil setBehaviour "CARELESS";
group _exfil setSpeedMode "FULL";
_markerName = ("Black-0" + "-Exfil");
	[_markerName,_exfil,_exfildest, _caller] spawn {
		params ["_markerName","_exfil","_exfildest","_caller"];
		sleep 4;
		_exfil sidechat ("Exfil markieren mit: " + _markerName);
		_exfil sideradio "Radio1";
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
		_eta = ceil ((ceil (_exfil distance2d (getMarkerPos _marker)) / 1666) *0.6);
		_exfil sidechat ("Markierung erhalten, Inbound. ETA: " + (str _eta) + " Min.");
		_exfil sideradio "Radio3";

		_impmrk = createmarker ["Exfil" + str (floor random 52),getMarkerPos _marker];
		_impmrk setMarkerType "mil_destroy";
		_impmrk setMarkerAlpha 0.5;
		_time = [daytime, "HH:MM"] call BIS_fnc_timeToString;
		_impmrk setMarkerText (_time + " Exfil:"  + (str _caller) + ".");


		sleep 6;
		_wp0 = (group _exfil) addWaypoint [getMarkerPos _marker,200];

		waitUntil {sleep 3;(_exfil distance2d (getmarkerpos _marker)) < 300};
		_exfil sidechat "Zone mit orangem Rauch markieren!";
		_exfil sideradio "Radio2";
		waituntil {sleep 3; //(count (nearestObjects [_exfil, ["SmokeShellOrange"], 200])) > 0;
		count ((getpos _exfil) nearObjects ["SmokeShellOrange",250]) != 0;
		};
		_exfil sidechat "Gesichtet!";
		_exfil sideradio "Radio1";
		
		
		
		
		
		
		
		
		
		//_lz = getpos (  nearestobject [position (_exfil),"SmokeShellOrange"]) ;

		//_wp1 = (group _exfil) addWaypoint [_lz,100];
		//_wp1 setWaypointType "TR UNLOAD";	//(({alive _x} count (group _caller) == {_x in vehicle this} count (group _caller)) )"  
		/*
		_wp1 setWaypointStatements ["

			units (group _caller) findIf {(_x in vehicle this) && alive _x} >= 5;" 

			
			,"_exfil sidechat 'Exfil liftoff!';"
			];

		//_exfil land "GET IN";
		*/
		sleep 3;
		while { (alive _exfil) && !unitReady _exfil } do
		{
			sleep 1;
		};

		if (alive _exfil) then
		{
			_exfil land "GET IN";
		};
		_exfil land "GET IN";

		[_exfil,"GET IN"] remoteExec ["land",0,false];

		_crewCount0 = [typeOf _exfil, true] call BIS_fnc_crewCount; 
		_crewCount = _crewCount0  - (count crew _exfil);
		_exfilliftof = false;
		while {! _exfilliftof} do {
			sleep 2;
		
		//_crewCount = [_exfil, true] call BIS_fnc_crewCount; 
		if (({_x in _exfil} count allPlayers) isEqualTo  ({alive _x } count allPlayers)) then {_exfilliftof = true};
		if (({_x in _exfil} count allPlayers) isEqualTo (_crewCount))  then {_exfilliftof = true};
		sleep 2;
		_exfil land "GET IN";
		};


		

		_exfil sidechat "Exfil liftoff!";
		_exfil domove (getmarkerpos _exfildest);
		[_exfil,"NONE"] remoteExec ["land",0,false];
		_exfil sideradio "Radio1";
		_exfil domove (getmarkerpos _exfildest);
		[_exfil,getmarkerpos _exfildest] remoteExec ["domove",0,false];
		_wp2 = (group _exfil) addWaypoint [getMarkerPos _exfildest,0];
		_wp2 setWaypointType "GETOUT";
		_wp2 setWaypointStatements ["true","this land 'LAND'"];
		_wp3 = (group _exfil) addWaypoint [getMarkerPos _exfildest,0];
		_wp3 setWaypointType "DISMISS";
	 };


//_eta = _exfil getArtilleryETA [(getMarkerPos _marker), (currentMagazine _exfil)];
/*
_exfil sidechat ("ETA beträgt:" + (str  (floor _eta)) + " Sekunden.");
_exfil sidechat "Erwarte Feuerbefehl.";
FireConfirm = false;
waituntil {
	sleep 1;
	FireConfirm;
};

//_exfil sidechat "Feuern!";
//_eta = _exfil getArtilleryETA [(getMarkerPos _marker), (currentMagazine _exfil)];

_exfil sidechat ("ETA:" + (str  (floor _eta)) + " Sekunden.");
_exfil sidechat (str currentMagazine _exfil);
_exfil commandArtilleryFire [(getMarkerPos _marker), (currentMagazine _exfil), 1];
*/