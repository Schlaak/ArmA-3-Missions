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
			[player,2] call IRN_fnc_sayRandom; 
			[player,1] call IRN_fnc_sayRandom;
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