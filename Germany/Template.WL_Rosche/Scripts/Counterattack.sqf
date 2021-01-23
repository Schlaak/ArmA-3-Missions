/*
Spawns waves of attackers

params
0	center position to be attacked by spawned troops [POSITION / OBJECT]
1	direction from the center	[NUMBER]
2	distance from the center [NUMBER]
3	Number of waves [NUMBER]

[getmarkerpos "town", 0, 1200,1] execvm "scripts\counterattack.sqf";
*/
if (!isserver) exitWith {};


_pos1 = _this select 0; //center of point to be attacked
_direction = _this select 1; //direction
_distance = _this select 2; //distance
#include "defineTroops.sqf"
_Troops = O_grpRND;	// could not make this dynamic.... so choose rnd grp from definetroops.sqf
_troopsside = east;
_waves = _this select 3;

_mindistance = 1200;
_maxdistance = 1500;
_objDist = 15;
_WPdistance = 250; //distance for Troops to stop before pos1

_fleethreshold = selectRandom [0.45,0.5,0.3,0.2];
_fleecaptive = selectRandom [true,False];

for "_i" from 0 to _waves do {
_pos2 = [ _pos1, _distance, _direction ] call BIS_fnc_relPos; //find position 1200m from center
_safepos = [_pos2, 1, 200, _objDist, 0, 0.1, 0] call BIS_fnc_findSafePos; //find a safe pos from pos2 to spawn units at

// find position for vehicles
//_distance = [_pos1,_pos2] call BIS_fnc_distance2D;
//_direction = [_pos1,_pos2] call BIS_fnc_dirTo;
_WPpos = [_pos1, _WPdistance ,_direction] call BIS_fnc_relPos; // position for Troops WP and vehicles to stop.

_EnemyGroup = [[((_safepos select 0) + random 10),((_safepos select 1) + random 10),0], _troopsside, _Troops] call BIS_fnc_spawnGroup; //spawn em
sleep 5;
[(leader _EnemyGroup),_fleethreshold,_fleecaptive] execvm "scripts\surrenderflee.sqf";	// enable surrender script


_WP = _EnemyGroup addWaypoint [_WPpos, 0];	//give wp
[leader _EnemyGroup, (getmarkerpos "uniform")] spawn lambs_wp_fnc_taskAssault;	//give assault lambs wp


{[_x] execvm "scripts\combatmodevehicle.sqf";
} forEach units _EnemyGroup;
sleep 30;
};



["Benachrichtigung",[format ["Feindtruppen auf %2 aus %1°.",round _direction, mapGridPosition _pos1]]] remoteExec ["BIS_fnc_showNotification", 0, true]; //show notification