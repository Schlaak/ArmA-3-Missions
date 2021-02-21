/*
SETUP
1
Place WP markers named like "WProute1", "WProute1_1" ... "WProute1_13". set the marker alpha to 0%.
script will choose one of five patrol routes and set the makers visible.
script will also give you a global var named like Route1, Route3, Route5 etc.

2
Script will choose one of five random events to happen. use the global variable to create custom events like in ontriggeract: event1 AND route3
this would activate event1 on route3

3
script will choose 3 positions to create squads with WP´s.
Into the init of these objects (gamelogics or so) goes:
_arr = missionNamespace getVariable ["Route1dest",[]];
_arr pushback this;
missionNamespace setVariable ["Route1dest",_arr,true];
...
so do these positions for all 3 routes. can be as many as needed.


4
Goto line 111 and define hostile side and units
*/
if (!isserver) exitwith {};

//Patrouillenaufgabe = false;
//waitUntil {Patrouillenaufgabe};
_chooseroute = _this select 0; // wähle route aus per param


//route definitions

// SCHLAAK 
// TODO - 2021-01-27:
// Hardcoded markerlist ersetzen durch:
/*for "X" from 0 to 10 do {
format ["R1_%1", X] setmarkeralpha 0;

oder pushback.
}*/
//_route1mrks = ["Route1to3start","WProute1", "WProute1_1", "WProute1_2","WProute1_3","WProute1_4","WProute1_5","WProute1_6","WProute1_7","WProute1_8","WProute1_9","WProute1_10","WProute1_11","WProute1_12","WProute1_13"];
//_route2mrks = ["Route1to3start","WProute2", "WProute2_1", "WProute2_2","WProute2_3","WProute2_4","WProute2_5","WProute2_6","WProute2_7","WProute2_8","WProute2_9","WProute2_10","WProute2_11","WProute2_12","WProute2_13"];
//_route3mrks = ["Route1to3start","WProute3", "WProute3_1", "WProute3_2","WProute3_3","WProute3_4","WProute3_5","WProute3_6","WProute3_7","WProute3_8","WProute3_9","WProute3_10","WProute3_11","WProute3_12","WProute3_13"];
//_route4mrks = ["Route4to5start","WProute4", "WProute4_1", "WProute4_2","WProute4_3","WProute4_4","WProute4_5","WProute4_6","WProute4_7","WProute4_8","WProute4_9","WProute4_10","WProute4_11","WProute4_12","WProute4_13"];
//_route5mrks = ["Route4to5start","WProute5", "WProute5_1", "WProute5_2", "WProute5_3" ,"WProute5_4" ,"WProute5_5" ,"WProute5_6" ,"WProute5_7" ,"WProute5_8" ,"WProute5_9" ,"WProute5_10" ,"WProute5_11" ,"WProute5_12","WProute5_13"];
_route1mrks = [];
_route2mrks = [];
_route3mrks = [];
_route4mrks = [];
_route5mrks = [];
_route6mrks = [];
_route7mrks = [];
_route8mrks = [];
_route9mrks = [];
for "X" from 1 to 20 do {
				_route1mrks pushBack ("Route1");
				_route1mrks pushBack (format ["Route1_%1", X]);
				};
for "X" from 1 to 20 do {
				_route2mrks pushBack ("Route2");
				_route2mrks pushBack (format ["Route2_%1", X]);
				};
for "X" from 1 to 20 do {
				_route3mrks pushBack ("Route3");
				_route3mrks pushBack (format ["Route3_%1", X]);
				};
for "X" from 1 to 20 do {
				_route4mrks pushBack ("Route4");
				_route4mrks pushBack (format ["Route4_%1", X]);
				};
for "X" from 1 to 20 do {
				_route5mrks pushBack ("Route5");
				_route5mrks pushBack (format ["Route5_%1", X]);
				};
for "X" from 1 to 20 do {
				_route6mrks pushBack ("Route6");
				_route6mrks pushBack (format ["Route6_%1", X]);
				};
for "X" from 1 to 20 do {
				_route7mrks pushBack ("Route7");
				_route7mrks pushBack (format ["Route7_%1", X]);
				};
for "X" from 1 to 20 do {
				_route8mrks pushBack ("Route8");
				_route8mrks pushBack (format ["Route8_%1", X]);
				};
for "X" from 1 to 20 do {
				_route9mrks pushBack ("Route9");
				_route9mrks pushBack (format ["Route9_%1", X]);
				};
//local function:
//find safe position in 150m radius
_getSafePos = {
	params ["_centerPos","_2Param"];
	diag_log [_centerPos];
	_pos = [
		_centerPos, //position
		1,	//min distance
		150, //max distance
		20, //min object distance
		0, //water mode 0 = not in water
		0.5, //max gradient, 0.5 ca 30°
		0, //shoreMode does not have to be shore
		[], //blackList
		[0,0,0] //default pos, returned if fails
	] call BIS_fnc_findSafePos;
	if (_pos isEqualTo [0,0,0]) then {
		systemChat "failed to find position";
		diag_log ["failed to find position for ", _centerPos];
	};
	//isNil
	_pos //return
};

//_mySafePos = [[1,2,3],"mein stringt"] call _getSafePos;
_availableSpawnPosMarkers = [];

switch (_chooseroute) do
{
	case 1:
	{
		//route anzeigen/sichtbar
		{ _x setmarkeralpha 1; } foreach _route1mrks;
		//globale var auf true
		Route1 = true;
		//routeneigene spawn pos finden
		_availableSpawnPosMarkers = _route1mrks;
	};
	case 2:
	{
		{ _x setmarkeralpha 1; } foreach _route2mrks;
		Route2 = true;
		_availableSpawnPosMarkers = _route2mrks;
	};
	case 3:
	{
		{ _x setmarkeralpha 1; } foreach _route3mrks;
		Route3 = true;
		_availableSpawnPosMarkers = _route3mrks;
	};
	case 4:
	{
		{ _x setmarkeralpha 1; } foreach _route4mrks;
		Route4 = true;
		_availableSpawnPosMarkers = _route4mrks;
	};
	case 5:
	{
		{ _x setmarkeralpha 1; } foreach _route5mrks;
		Route5 = true;
		_availableSpawnPosMarkers = _route5mrks;
	};

};

//gegner konfigurieren
// TODO
// FÜR DIE ZUKUNFT: Sobald das counterattack.sqf hinenbezogen wird können wir die Troopabfragen aus der definetroops.sqf beziehen.
_tl = "CUP_I_TK_GUE_Soldier_TL"; // WIP
_grunt = "CUP_I_TK_GUE_Soldier"; // WIP
//spezialisten wählen CHOOSE YOUR FIGHTER
_soldier1 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_soldier2 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_soldier3 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_side = west;
sleep 10;

//create enemy groups
_amountEnemyGroups = random 3 + 3; //3..6
_enemyGroups = [];
for "_i" from 0 to _amountEnemyGroups do {
	//define group size
	_grpSize = selectRandom [1,2,3]; //predefine size indentifier
	//get position
	//select random from available positions along route (predefined, hardcoded)
	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getSafePos;

	if (isNil "_spawnPos") then 	{
		hint "get safe spawnpos failed";
	};
	//spawn group with random size
	_grpComposition = [];
	switch (_grpSize) do {
		case 1:
		{
			_grpComposition = [_tl, _grunt, _grunt, _soldier1];
		};
		case 2:
		{
			_grpComposition = [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt];
		};
		case 3:
		{
			_grpComposition = [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1];
		};
		default
		{
			diag_log ["encountered unknow group size:",_grpsize];
		};
	};
	_thisGroup = [_spawnPos, _side, _grpComposition,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	_enemyGroups pushBack _thisGroup;

	//set lambs task/group beschäftigung
	_lambsTsk = selectrandom [1,2,3,4];
	switch (_lambsTsk) do
	{
		case 1:
		{
			[(leader _thisGroup), getPos (leader _thisGroup), 100,[], true, true] call lambs_wp_fnc_taskCamp;
		};
		case 2:
		{
			[(leader _thisGroup), (leader _thisGroup), 1000] spawn lambs_wp_fnc_taskPatrol;
		};
		case 3:
		{
			[group (leader _thisGroup), 1000] spawn lambs_wp_fnc_taskHunt;
		};
		case 4:
		{
			[(leader _thisGroup), 1500] spawn lambs_wp_fnc_taskCreep;
		};
	};

	//for all groups execute dushman scripts on units
	// TODO
	// Fucking low priority... dushman per parameter (sollen gegner umgerüstet werden? ja nein?)
	{
		if (_x isKindOf "CUP_I_TK_GUE_Soldier") then
		{
			[_x] execvm "scripts\dushman.sqf";
		}
	} forEach units _thisGroup;
};
//comment
//preplaced events usage: on trigger condition: Route1 && event3 //FIXME


// TODO
// #include scripts vielleicht per if abfrage für andere Szenarien modularisieren | EIN- / AUSSCHALTBAR machen.
#include "routeevents.sqf" // Script will spawn preplaced events along the route.
#include "RouteCaches.sqf" // Script will move the weaponcaches along the route.
#include "RouteGoats.sqf" // Script will spawn goats along the route.
#include "RouteMuell.sqf"
#include "RouteInspectZone.sqf"
#include "RouteSnipers.sqf"
#include "RouteStatics.sqf"