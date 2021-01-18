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

Patrouillenaufgabe = false;
waitUntil {Patrouillenaufgabe};
_chooseroute = selectrandom [1,2,3,4,5]; // wähle route aus
_event = selectrandom [1,2,3,4,5];
_grpsize1 = selectrandom [1,2,3];
_grpsize2 = selectrandom [1,2,3];
_grpsize3 = selectrandom [1,2,3];
_route1mrks = ["WProute1", "WProute1_1", "WProute1_2","WProute1_3","WProute1_4","WProute1_5","WProute1_6","WProute1_7","WProute1_8","WProute1_9","WProute1_10","WProute1_11","WProute1_12","WProute1_13"];
_route2mrks = ["WProute2", "WProute2_1", "WProute2_2","WProute2_3","WProute2_4","WProute2_5","WProute2_6","WProute2_7","WProute2_8","WProute2_9","WProute2_10","WProute2_11","WProute2_12","WProute2_13"];
_route3mrks = ["WProute3", "WProute3_1", "WProute3_2","WProute3_3","WProute3_4","WProute3_5","WProute3_6","WProute3_7","WProute3_8","WProute3_9","WProute3_10","WProute3_11","WProute3_12","WProute3_13"];
_route4mrks = ["WProute4", "WProute4_1", "WProute4_2","WProute4_3","WProute4_4","WProute4_5","WProute4_6","WProute4_7","WProute4_8","WProute4_9","WProute4_10","WProute4_11","WProute4_12","WProute4_13"];
_route5mrks = ["WProute5","WProute5_1","WProute5_2","WProute5_3","WProute5_4","WProute5_5","WProute5_6","WProute5_7","WProute5_8","WProute5_9","WProute5_10","WProute5_11","WProute5_12","WProute5_13"];


switch (_chooseroute) do
{
	case 1:
	{
		{ _x setmarkeralpha 1; } foreach _route1mrks;
		Route1 = true;
		_Hostilegrpdest1mrk = getmarkerpos (selectrandom _route1mrks);
		_Hostilegrpdest2mrk = getmarkerpos (selectrandom _route1mrks);
		_Hostilegrpdest3mrk = getmarkerpos (selectrandom _route1mrks);
		Hostilegrpdest3 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest3mrk;
		Hostilegrpdest3 hideObjectGlobal true;
		Hostilegrpdest2 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest2mrk;
		Hostilegrpdest2 hideObjectGlobal true;
		Hostilegrpdest1 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest1mrk;
		Hostilegrpdest1 hideObjectGlobal true;
	};
	case 2:
	{
		{ _x setmarkeralpha 1; } foreach _route2mrks;
		Route2 = true;
		_Hostilegrpdest1mrk = getmarkerpos (selectrandom _route2mrks);
		_Hostilegrpdest2mrk = getmarkerpos (selectrandom _route2mrks);
		_Hostilegrpdest3mrk = getmarkerpos (selectrandom _route2mrks);
		Hostilegrpdest3 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest3mrk;
		Hostilegrpdest3 hideObjectGlobal true;
		Hostilegrpdest2 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest2mrk;
		Hostilegrpdest2 hideObjectGlobal true;
		Hostilegrpdest1 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest1mrk;
		Hostilegrpdest1 hideObjectGlobal true;
	};
	case 3:
	{
		{ _x setmarkeralpha 1; } foreach _route3mrks;
		Route3 = true;
		_Hostilegrpdest1mrk = getmarkerpos (selectrandom _route3mrks);
		_Hostilegrpdest2mrk = getmarkerpos (selectrandom _route3mrks);
		_Hostilegrpdest3mrk = getmarkerpos (selectrandom _route3mrks);
		Hostilegrpdest3 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest3mrk;
		Hostilegrpdest3 hideObjectGlobal true;
		Hostilegrpdest2 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest2mrk;
		Hostilegrpdest2 hideObjectGlobal true;
		Hostilegrpdest1 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest1mrk;
		Hostilegrpdest1 hideObjectGlobal true;
	};
	case 4:
	{
		{ _x setmarkeralpha 1; } foreach _route4mrks;
		Route4 = true;
		_Hostilegrpdest1mrk = getmarkerpos (selectrandom _route4mrks);
		_Hostilegrpdest2mrk = getmarkerpos (selectrandom _route4mrks);
		_Hostilegrpdest3mrk = getmarkerpos (selectrandom _route4mrks);
		Hostilegrpdest3 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest3mrk;
		Hostilegrpdest3 hideObjectGlobal true;
		Hostilegrpdest2 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest2mrk;
		Hostilegrpdest2 hideObjectGlobal true;
		Hostilegrpdest1 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest1mrk;
		Hostilegrpdest1 hideObjectGlobal true;
	};
	case 5:
	{
		{ _x setmarkeralpha 1; } foreach _route5mrks;
		Route5 = true;
		_Hostilegrpdest1mrk = getmarkerpos (selectrandom _route5mrks);
		_Hostilegrpdest2mrk = getmarkerpos (selectrandom _route5mrks);
		_Hostilegrpdest3mrk = getmarkerpos (selectrandom _route5mrks);
		Hostilegrpdest3 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest3mrk;
		Hostilegrpdest3 hideObjectGlobal true;
		Hostilegrpdest2 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest2mrk;
		Hostilegrpdest2 hideObjectGlobal true;
		Hostilegrpdest1 = "Sign_Sphere200cm_F" createVehicleLocal _Hostilegrpdest1mrk;
		Hostilegrpdest1 hideObjectGlobal true;
	};

};


_tl = "CUP_I_TK_GUE_Soldier_TL"; // WIP
_grunt = "CUP_I_TK_GUE_Soldier"; // WIP
_soldier1 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_soldier2 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_soldier3 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_side = west;
sleep 10;
/*
		Hostilegrpdest1 = selectrandom (missionnamespace getvariable "Route1dest");
		Hostilegrpdest2 = selectrandom (missionnamespace getvariable "Route1dest2");
		Hostilegrpdest3 = selectrandom (missionnamespace getvariable "Route1dest3");
*/
switch (_grpsize1) do
{
	case 1:
	{
		_centerPos1 = (Hostilegrpdest1 getPos [(random 500), (random 360)]);
		_pos1 = [_centerPos1, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp1 = [_pos1, _side, [_tl, _grunt, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	};
	case 2:
	{
		_centerPos1 = (Hostilegrpdest1 getPos [(random 500), (random 360)]);
		_pos1 = [_centerPos1, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp1 = [_pos1, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	};
	case 3:
	{
		_centerPos1 = (Hostilegrpdest1 getPos [(random 500), (random 360)]);
		_pos1 = [_centerPos1, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp1 = [_pos1, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	};
};
switch (_grpsize2) do
{
	case 1:
	{
		_centerPos2 = (Hostilegrpdest2 getPos [(random 500), (random 360)]);
		_pos2 = [_centerPos2, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp2 = [_pos2, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	};
	case 2:
	{
		_centerPos2 = (Hostilegrpdest2 getPos [(random 500), (random 360)]);
		_pos2 = [_centerPos2, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp2 = [_pos2, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	};
	case 3:
	{
		_centerPos2 = (Hostilegrpdest2 getPos [(random 500), (random 360)]);
		_pos2 = [_centerPos2, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp2 = [_pos, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	};
};
switch (_grpsize3) do
{
	case 1:
	{
		_centerPos3 = (Hostilegrpdest3 getPos [(random 500), (random 360)]);
		_pos3 = [_centerPos3, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp3 = [_pos3, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

	};
	case 2:
	{
		_centerPos3 = (Hostilegrpdest3 getPos [(random 500), (random 360)]);
		_pos3 = [_centerPos3, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp3 = [_pos3, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

	};
	case 3:
	{
		_centerPos3 = (Hostilegrpdest3 getPos [(random 500), (random 360)]);
		_pos3 = [_centerPos3, 1, 100, 20, 0, 0.5, 0] call BIS_fnc_findSafePos;
		hostilesgrp3 = [_pos3, _side, [_tl, _grunt, _grunt, _soldier1, _grunt, _grunt, _soldier2, _soldier3, _grunt, _soldier1],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

	};
};



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

// Define soldiers here
/*
_tl = "CUP_I_TK_GUE_Soldier_TL"; // WIP
_grunt = "CUP_I_TK_GUE_Soldier"; // WIP
_soldier1 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_soldier2 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_soldier3 = selectrandom ["CUP_I_TK_GUE_Demo","CUP_I_TK_GUE_Soldier_AA","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Mechanic","CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Commander","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_LAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AAT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Soldier_AT"]; // WIP
_side = west;
*/

 {[_x] execvm "scripts\dushman.sqf";} forEach units (hostilesgrp1);
 {[_x] execvm "scripts\dushman.sqf";} forEach units (hostilesgrp2);
 {[_x] execvm "scripts\dushman.sqf";} forEach units (hostilesgrp3);

_LambsTskZuweisung1 = selectrandom [1,2,3,4];
_LambsTskZuweisung2 = selectrandom [1,2,3,4];
_LambsTskZuweisung3 = selectrandom [1,2,3,4];



switch (_LambsTskZuweisung1) do
{
	case 1:
	{
		[(leader hostilesgrp1), getPos (leader hostilesgrp1), 100, true, true] call lambs_wp_fnc_taskCamp;
	};
	case 2:
	{
		[(leader hostilesgrp1), (leader hostilesgrp1), 1000] spawn lambs_wp_fnc_taskPatrol;
	};
	case 3:
	{
		[group (leader hostilesgrp1), 1000] spawn lambs_wp_fnc_taskHunt;
	};
	case 4:
	{
		[(leader hostilesgrp1), 1500] spawn lambs_wp_fnc_taskCreep;
	};
};
switch (_LambsTskZuweisung2) do
{
	case 1:
	{
		[(leader hostilesgrp2), getPos (leader hostilesgrp2), 100, true, true] call lambs_wp_fnc_taskCamp;
	};
	case 2:
	{
		[(leader hostilesgrp2), (leader hostilesgrp2), 1000] spawn lambs_wp_fnc_taskPatrol;
	};
	case 3:
	{
		[group (leader hostilesgrp2), 1000] spawn lambs_wp_fnc_taskHunt;
	};
	case 4:
	{
		[(leader hostilesgrp2), 1500] spawn lambs_wp_fnc_taskCreep;
	};
};
switch (_LambsTskZuweisung3) do
{
	case 1:
	{
		[(leader hostilesgrp3), getPos (leader hostilesgrp3), 100, true, true] call lambs_wp_fnc_taskCamp;
	};
	case 2:
	{
		[(leader hostilesgrp3), (leader hostilesgrp3), 1000] spawn lambs_wp_fnc_taskPatrol;
	};
	case 3:
	{
		[group (leader hostilesgrp3), 1000] spawn lambs_wp_fnc_taskHunt;
	};
	case 4:
	{
		[(leader hostilesgrp3), 1500] spawn lambs_wp_fnc_taskCreep;
	};
};