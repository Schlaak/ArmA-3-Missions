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
RndEvent = false;
Event1 = false;
Event2 = false;
Event3 = false;
Event4 = false;
Event5 = false;
Patrouillenaufgabe = false;
waitUntil {Patrouillenaufgabe};
_chooseroute = selectrandom [1,2,3,4,5]; // wähle route aus
_event = selectrandom [1,2,3,4,5];

//route definitions
_route1mrks = ["Route1to3start","WProute1", "WProute1_1", "WProute1_2","WProute1_3","WProute1_4","WProute1_5","WProute1_6","WProute1_7","WProute1_8","WProute1_9","WProute1_10","WProute1_11","WProute1_12","WProute1_13"];
_route2mrks = ["Route1to3start","WProute2", "WProute2_1", "WProute2_2","WProute2_3","WProute2_4","WProute2_5","WProute2_6","WProute2_7","WProute2_8","WProute2_9","WProute2_10","WProute2_11","WProute2_12","WProute2_13"];
_route3mrks = ["Route1to3start","WProute3", "WProute3_1", "WProute3_2","WProute3_3","WProute3_4","WProute3_5","WProute3_6","WProute3_7","WProute3_8","WProute3_9","WProute3_10","WProute3_11","WProute3_12","WProute3_13"];
_route4mrks = ["Route4to5start","WProute4", "WProute4_1", "WProute4_2","WProute4_3","WProute4_4","WProute4_5","WProute4_6","WProute4_7","WProute4_8","WProute4_9","WProute4_10","WProute4_11","WProute4_12","WProute4_13"];
_route5mrks = ["Route4to5start","WProute5", "WProute5_1", "WProute5_2", "WProute5_3" ,"WProute5_4" ,"WProute5_5" ,"WProute5_6" ,"WProute5_7" ,"WProute5_8" ,"WProute5_9" ,"WProute5_10" ,"WProute5_11" ,"WProute5_12","WProute5_13"];

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
			[(leader _thisGroup), getPos (leader _thisGroup), 100, true, true] call lambs_wp_fnc_taskCamp;
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
	{
		if (_dude isKindOf "CUP_I_TK_GUE_Soldier") then
		{
			[_x] execvm "scripts\dushman.sqf";
		}
	} forEach units _thisGroup;
};
//comment
//preplaced events usage: on trigger condition: Route1 && event3 //FIXME
switch (_event) do
{
	case 1:
	{
		event1 = true;
	};
		case 2:
	{
		event2 = true;
	};
		case 3:
	{
		event3 = true;
	};
		case 4:
	{
		event4 = true;
	};
		case 5:
	{
		event5 = true;
	};
	default
	{
		event1 = true;
	};
};
_rndeventcalc = selectrandom [1,2];
switch (_rndeventcalc) do
{
	case 1:
	{
		RndEvent = true;
	};

	case 2:
	{
		RndEvent = false;
	};
};


_getcachePos = {
	params ["_centerPos","_2Param"];
	diag_log [_centerPos];
	_pos = [
		_centerPos, //position
		1,	//min distance
		150, //max distance
		5, //min object distance
		0, //water mode 0 = not in water
		0.7, //max gradient, 0.5 ca 30°
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
//position of templates to be teleported to desired pos.
_cacheTemplates = [[11749.2,12240.7,0],[11851.4,12243.7,0],[11954,12246.8,0],[11750.6,12145,0],[11852.9,12133.3,0],[11951.2,12146.3,0],[11952.3,12052.3,0],[11850.9,12049,0],[11750.8,12048.8,0]];
_cacheAmount = 3 + random 9;
diag_log ["placing",_cacheAmount,"caches"];

for "_i" from 0 to _cacheAmount do {
	//template
	if (count _cacheTemplates == 0) exitWith {
		diag_log ["weapon cache placement failed, no available templates left"];
	};
	_cache = selectrandom _cacheTemplates;
	_cacheTemplates = _cacheTemplates - [_cache];

	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getcachePos;
	[_cache,_spawnPos,50] execvm "scripts\shk_moveobjects.sqf";

	diag_log ["placed cache from ",_cache," remaining templates: ",_cacheTemplates, " at spawnpos ",_spawnPos];

	_marker1 = createMarker ["cache" + str time, _spawnPos];
	_marker1 setMarkerType "hd_warning";
	_marker1 setMarkerText "Cache!!!";
};









// Spawn goats;
_amountHostileGoatGroups = (random 8) + 5;
_goatpos = selectrandom [[158.656,11690.2,0],[187.046,11693.9,0],[217.538,11696.9,0],[245.625,11698.6,0],[164.926,11657.4,0],[193.316,11661.1,0],[223.808,11664,3.05176e-005],[251.895,11665.8,6.10352e-005],[170.463,11621.1,0],[198.853,11624.8,0],[229.345,11627.8,-3.05176e-005],[257.432,11629.5,0]];
for "_i" from 0 to _amountHostileGoatGroups do {
_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getcachePos;
[_goatpos,_spawnPos,10] execvm "scripts\shk_moveobjects.sqf";
};

/*
_GoatGroup = [_spawnPos, civilian, _GoatComposition,[],[],[],[],[],180] call BIS_fnc_spawnGroup;

diag_log [_GoatComposition,_spawnPos,_goatgroup];


{0 = [_x] spawn {
 	while {alive (_this select 0)} do {
 		sleep 15 + (random 20);
 		_gopos = [(_this select 0), (random 25)+10,random 360] call BIS_fnc_relPos;
 		(_this select 0) doMove _gopos;
 	};
 }} foreach units _GoatGroup;


};