//create actions for the players to use during gameplay.
// --------------------------------------------------------- hilfsfunktionen
diag_log "initPlayerActions called.";


// --------------------------------------------------------- Bomber anfordern
_action = [
	"Request CAS",
	"Bomber anfordern",
	"",
	{ 	//action code
		[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
		[player,2] call IRN_fnc_sayRandom; //player ordering (babble)
		[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
		[player,1] call IRN_fnc_sayRandom; //opz answers long
		if (!(missionNamespace getVariable ['IRN_bool_casDone',true])) exitWith {
			sleep 4;
			systemChat "Keine Bomber verfügbar.";
		};
		missionNamespace setVariable ['IRN_bool_casDone',false,true];
		_markerName = selectRandom ["Anastasia","Annika","Galina","Irina","Katina","Katerine","Khristina","Lada","Lelyah"];
		[_markerName] spawn {
			params ["_markerName"];
			sleep 4;
			systemChat ("Markieren Sie die Abwurfzone auf der Karte mit " + _markerName);
			_marker = nil; _counter = 0;
			waitUntil {
				sleep 1;
				_counter = _counter + 1;
				{
					if (markerText _x isEqualTo _markerName) exitWith {
						_marker = _x;
					};
				} forEach allMapMarkers;
				(!(isNil "_marker") || _counter >= 60)
			};
			[player,2] call IRN_fnc_sayRandom; 
			[player,1] call IRN_fnc_sayRandom;
			if (_counter >= 60) exitWith {
				systemChat "Keine Markierung gefunden, Abbruch.";
			};

			sleep 3;
			systemChat "Markierung erhalten, Bomber werden instruiert.";
			[getMarkerPos _marker,markerDir _marker,2] execVM "bombrun.sqf";
			waitUntil {
				sleep 10;
				_done = missionNamespace getVariable ['IRN_bool_casDone',false];
				_done
			};
			deleteMarker _marker;
			[player,1] call IRN_fnc_sayRandom;
			sleep 1;
			systemChat "Bomber einsatzbereit.";
		};
  	}, 
	{
		[player, "itemmap"] call BIS_fnc_hasItem 
   	}
] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;

// --------------------------------------------------------- supplydrop anfordern
_action = [
	"Request supply",
	"Versorgung (Helikopter) anfordern",
	"",
	{ 	//action code
		[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
		[player,2] call IRN_fnc_sayRandom; //player ordering (babble)
		[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
		[player,1] call IRN_fnc_sayRandom; //opz answers long

		_markerName = ("Unterstützung " + selectRandom ["Anastasia","Annika","Galina","Irina","Katina","Katerine","Khristina","Lada","Lelyah"]);		
		{[player,crate_01,false,"uwu"] call IRN_fnc_orderSupply} remoteExec ["bis_fnc_call",2,false];
		//[player,crate_01,false,_markerName] execVM "order_supply.sqf";
		if (supply_helo_01 getVariable ["RTB",true]) then {
			[] spawn {
			waitUntil {
				sleep 10;
				_done = supply_helo_01 getVariable ["RTB",true];
				_done
			};
			[player,1] call IRN_fnc_sayRandom;
			sleep 1;
			systemChat "Hubschrauber wieder einsatzbereit.";
		};
		};

  	}, 
	{
		[player, "itemmap"] call BIS_fnc_hasItem 
   	}
] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;

// --------------------------------------------------------- reaper schlag anfordern
//[drone_01] spawn IRN_fnc_droneCycle;
//_action = [
//	"Request reaper",
//	"Dronenschlag anfordern",
//	"",
//	{ 	//action code
//		[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
//		[player,2] call IRN_fnc_sayRandom; //player ordering (babble)
//		[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
//		[player,1] call IRN_fnc_sayRandom; //opz answers long
//		diag_log ["ace action params",_this];
//		_this spawn {
//			sleep 5;
//			[_this select 0] execVM "drone_support.sqf";
//		};
//  	}, 
//	{
//		true //[player, "itemmap"] call BIS_fnc_hasItem 
//   	}
//] call ace_interact_menu_fnc_createAction;
//[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;


diag_log ["init drone and added action"];
/*
//TODO fix non moving groups

// --------------------------------------------------------- Nachhut rufen hinzufügen , braucht karte dafür
Call_Supportgroupaction = [
	"Call_Supportgroup",
	"Nachhut Rufen",
	"",
	{
		Nachhut addWaypoint [position player, 80]; {_x domove getpos _x} foreach units Nachhut;
		[player, selectrandom ["Call1","Call2","Call3","Call4","Call5"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["CP1","CP2","CP7","CP8","cp3","cp4","CP5","CP6","CP9","CP10","CP11"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["Call1","Call2","Call3","Call4","Call5"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["CPu1","CPu2","CPu7","cpu3","cpu4","CPu5","CPu6"], 100] call CBA_fnc_globalSay3d; 
  	}, 
	{
	 [player, "itemmap"] call BIS_fnc_hasItem 
   	}
] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], Call_Supportgroupaction] call ace_interact_menu_fnc_addActionToClass;

// --------------------------------------------------------- transport rufen, braucht Karte dafür
Call_Transportaction = [
	"Call_Transport",
	"Transport Rufen",
	"",
	{
		transportgruppe addWaypoint [position player, 80]; {_x domove getpos _x} foreach units transportgruppe;
		[player, selectrandom ["Call1","Call2","Call3","Call4","Call5"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["CP1","CP2","CP7","CP8","cp3","cp4","CP5","CP6","CP9","CP10","CP11"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["Call1","Call2","Call3","Call4","Call5"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["CPu1","CPu2","CPu7","cpu3","cpu4","CPu5","CPu6"], 100] call CBA_fnc_globalSay3d; 
  	}, 
	{
		[player, "itemmap"] call BIS_fnc_hasItem 
	}
] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], Call_Transportaction] call ace_interact_menu_fnc_addActionToClass;

// --------------------------------------------------------- transport zur base schicken
Call_Transportaction2 = [
	"Call_Transport",
	"Transport zur Base",
	"",
	{ 
		for "_i" from count waypoints transportgruppe - 1 to 0 step -1 do
		{
			deleteWaypoint [transportgruppe, _i];
		};
		[player, selectrandom ["Call1","Call2","Call3","Call4","Call5"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["CP1","CP2","CP7","CP8","cp3","cp4","CP5","CP6","CP9","CP10","CP11"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["Call1","Call2","Call3","Call4","Call5"], 100] call CBA_fnc_globalSay3d; 
		[player, selectrandom ["CPu1","CPu2","CPu7","cpu3","cpu4","CPu5","CPu6"], 100] call CBA_fnc_globalSay3d; 
		transportgruppe addWaypoint [position baseOBJ, 15]; {_x domove getpos _x} foreach units transportgruppe;
  	}, 
	{
		[player, "itemmap"] call BIS_fnc_hasItem 
   	}
] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], Call_Transportaction2] call ace_interact_menu_fnc_addActionToClass;



// TELEPORTERACTIONS
actionTP1 = [
	"Teleport",
	"Verlege nach 1314 Долина",
	"",
	{ 	//action code
		_player setpos (getmarkerpos "respawn_east_2");
  	}, 
	{
		//CONDITION
		//_player distance _target <= 3;
		true
   	},{},[],[],6,[],{}
] call ace_interact_menu_fnc_createAction;

actionTP2 = [
	"Teleport",
	"Verlege nach HQ ставка",
	"",
	{ 	//action code
		_player setpos (getmarkerpos "respawn_east");
  	}, 
	{
		//CONDITION
		//_player distance _target <= 3;
		true
   	},{},[],[],6,[],{}
] call ace_interact_menu_fnc_createAction;

actionTP3 = [
	"Teleport",
	"Verlege nach 3020 Михаил",
	"",
	{ 	//action code
		_player setpos (getmarkerpos "respawn_east_3");
  	}, 
	{
		//CONDITION
		//_player distance _target <= 3;
		true
   	},{},[],[],6,[],{}
] call ace_interact_menu_fnc_createAction;

actionTP4 = [
	"Teleport",
	"Verlege nach 2232 холм",
	"",
	{ 	//action code
		_player setpos (getmarkerpos "respawn_east_1");
  	}, 
	{
		//CONDITION
		//_player distance _target <= 3;
		true
   	},{},[],[],6,[],{}
] call ace_interact_menu_fnc_createAction;


//TODO put in foreach loop
[Flag1314,0,["ACE_MainActions"],actionTP2] call ace_interact_menu_fnc_addActionToObject;
[Flag1314,0,["ACE_MainActions"],actionTP3] call ace_interact_menu_fnc_addActionToObject;
[Flag1314,0,["ACE_MainActions"],actionTP4] call ace_interact_menu_fnc_addActionToObject;

[FlagHQ,0,["ACE_MainActions"],actionTP1] call ace_interact_menu_fnc_addActionToObject;
[FlagHQ,0,["ACE_MainActions"],actionTP3] call ace_interact_menu_fnc_addActionToObject;
[FlagHQ,0,["ACE_MainActions"],actionTP4] call ace_interact_menu_fnc_addActionToObject;

[Flag3020,0,["ACE_MainActions"],actionTP1] call ace_interact_menu_fnc_addActionToObject;
[Flag3020,0,["ACE_MainActions"],actionTP2] call ace_interact_menu_fnc_addActionToObject;
[Flag3020,0,["ACE_MainActions"],actionTP4] call ace_interact_menu_fnc_addActionToObject;

[Flag2232,0,["ACE_MainActions"],actionTP1] call ace_interact_menu_fnc_addActionToObject;
[Flag2232,0,["ACE_MainActions"],actionTP2] call ace_interact_menu_fnc_addActionToObject;
[Flag2232,0,["ACE_MainActions"],actionTP3] call ace_interact_menu_fnc_addActionToObject;


