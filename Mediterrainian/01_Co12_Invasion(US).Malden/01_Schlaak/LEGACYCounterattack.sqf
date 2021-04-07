/*
Spawns waves of attackers

params
0	center position to be attacked by spawned troops [POSITION / OBJECT]
1	direction from the center	[NUMBER]
2	distance from the center [NUMBER]
3	Number of waves [NUMBER]

[getmarkerpos "town", 0, 1200,1] execvm "Schlaak\counterattack.sqf";
*/
if (!isserver) exitWith {};


_pos1 = _this select 0; //center of point to be attacked
_direction = _this select 1; //direction
_distance = _this select 2; //distance

_troopsside = east;
_waves = _this select 3;

O_grpBMP1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
O_grpBMP2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
O_grpBTR = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
O_grpMTLB = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
O_grpRND = selectrandom [O_grpBMP1,O_grpBMP2,O_grpBTR,O_grpMTLB];

_Troops = O_grpRND;	// could not make this dynamic.... so choose rnd grp from definetroops.sqf


_mindistance = 1200;
_maxdistance = 1500;
_objDist = 15;
_WPdistance = 50+ random 200; //distance for Troops to stop before pos1

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
sleep 2;
{
	[_x] execvm "schlaak\combatmodevehicle.sqf"; //call Schlaak_fnc_combatmodevehicle;
	
} forEach units _EnemyGroup;
sleep 5;
//[(leader _EnemyGroup),_fleethreshold,_fleecaptive] call Schlaak_fnc_surrenderflee;
[(leader _EnemyGroup),_fleethreshold,_fleecaptive] execvm "Schlaak\surrenderflee.sqf";	// enable surrender script

sleep 5;
_WP = _EnemyGroup addWaypoint [_WPpos, 0];	//give wp
[leader _EnemyGroup, _pos1] spawn lambs_wp_fnc_taskAssault;	//give assault lambs wp

sleep 4;

sleep 30;
};


["Benachrichtigung",[format ["Feindtruppen kommen auf %2 aus %1°.",round _direction, text nearestLocation [_pos1, ""]]]] remoteExec ["BIS_fnc_showNotification", 0, true]; //show notification


/*
//[_x] execvm "scripts\combatmodevehicle.sqf";