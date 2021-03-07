//create actions for the players to use during gameplay.
// --------------------------------------------------------- hilfsfunktionen
diag_log "initPlayerActions called.";


// --------------------------------------------------------- Bomber anfordern
_action = [
	"Request CAS",
	"Bomber anfordern",
	"",
	{ 	//action code
		//[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
		//[player,2] call IRN_fnc_sayRandom; //player ordering (babble)
		//[player,0] call IRN_fnc_sayRandom; //player ordering (babble)
		//[player,1] call IRN_fnc_sayRandom; //opz answers long
		if (!(missionNamespace getVariable ['IRN_bool_casDone',true])) exitWith {
			sleep 4;
			systemChat "Keine Bomber verfügbar.";
		};
		missionNamespace setVariable ['IRN_bool_casDone',false,true];
		_markerName = selectRandom ["CAS_A_12","CAS_B_131","CAS_F_129","CAS_G_959","CAS_H_298","CAS_J_917","CAS_T_743","CAS_R_210","CAS_E_332"];
		[_markerName] spawn {
			params ["_markerName"];
			sleep 4;
			systemChat ("Markieren Sie die Abwurfzone auf der Karte mit " + _markerName);
			_marker = nil;
			waitUntil {
				sleep 1;
				{
					if (markerText _x isEqualTo _markerName) exitWith {
						_marker = _x;
					};
				} forEach allMapMarkers;
				(!(isNil "_marker"))
			};
			//[player,2] call IRN_fnc_sayRandom; 
			//[player,1] call IRN_fnc_sayRandom;
			[player,"9liner",20] call Schlaak_fnc_Schlaaksay;
			systemChat "9-Liner durchgabe.";
			sleep 30;
			systemChat "Markierung erhalten, Bomber werden instruiert.";
			sleep 10;
			_casconf = selectrandom ["US_Cas_1","US_Cas_2","US_Cas_3","US_Cas_4"];
			[player,_casconf,20] call Schlaak_fnc_Schlaaksay;

			sleep 10;
			[getMarkerPos _marker,markerDir _marker,2] execVM "Ir0n\bombrun.sqf";
			sleep (80+ random 20);
			_bombconf = selectrandom ["US_conf_1","US_conf_2","US_conf_3","US_conf_4","US_conf_5","US_conf_6","US_conf_7","US_conf_8"];
			[player,_bombconf,20] call Schlaak_fnc_Schlaaksay;
			waitUntil {
				sleep 10;
				_done = missionNamespace getVariable ['IRN_bool_casDone',false];
				_done
			};
			deleteMarker _marker;
			//[player,1] call IRN_fnc_sayRandom;
			sleep 1;
			systemChat "Bomber einsatzbereit.";
		};
  	}, 
	{
		[player, "ACE_MapTools"] call BIS_fnc_hasItem && player iskindof "cwr3_b_soldier_tl" OR player iskindof "cwr3_b_soldier_sl" OR player iskindof "cwr3_b_soldier_spotter" OR player iskindof "cwr3_b_officer" OR player iskindof "cwr3_b_blackop_day_xms"
   	}
] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
/*
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
		[player,crate_01,false,_markerName] execVM "order_supply.sqf";
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
/*
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */


/*
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

/*
Долина (1314)
respawn_east_2
Flag1314
ставка (HQ)
respawn_east
FlagHQ

Михаил (3020)
respawn_east_3
Flag3020

холм (2232)
respawn_east_1
Flag2232