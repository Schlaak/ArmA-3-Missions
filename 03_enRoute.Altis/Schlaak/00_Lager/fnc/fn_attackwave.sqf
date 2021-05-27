//   if ({_x distance jeep1 < 500} count allPlayers > 0) then

//     _nObject = getPos player nearestObject "StreetLamp"; 

//[_pos1,_direction,_distance,_waves,_grpType,_wpDistance] call Schlaak_fnc_Counterattack;
//[getpos player,90,1500,2,O_grpMech1,250] call Schlaak_fnc_Counterattack;


// [west,getmarkerpos "spawner_w",getmarkerpos "battlecenter",B_grp_arr_Mech] spawn Schlaak_fnc_attackwave;
// [east,getmarkerpos "spawner_e",getmarkerpos "battlecenter",O_grp_arr_Mech] spawn Schlaak_fnc_attackwave;

/*
_battle = [west,getmarkerpos "spawner_w",getmarkerpos "battlecenter",B_grp_arr_Mech] spawn Schlaak_fnc_attackwave; 
_battle = [east,getmarkerpos "spawner_e",getmarkerpos "battlecenter",O_grp_arr_Mech] spawn Schlaak_fnc_attackwave;
*/
params ["_side","_pos1","_grpType"]; 
//_pos2
if !(isserver) exitWith {};






_objDist = 15;
sleep 15;


while {(missionNamespace getVariable "Schlaak_spawn_waves") == true} do {



	//find position _distance in meters from center in given direction
	//_pos2 = [ _pos1, _distance, _direction ] call BIS_fnc_relPos; 
	//find a safe pos from pos2 to spawn units at
	_safepos = [_pos1, 1, 200, 15, 0, 0.1, 0] call BIS_fnc_findSafePos; 
	
	
	// check if player too near.
	if ({isPlayer _x} count (nearestObjects [_safepos,[],250]) == 0) then {



	//_WPpos = [_pos2, 1, 200, 15, 0, 0.1, 0] call BIS_fnc_findSafePos;
	

	_troops = selectrandom _grpType;
	//spawn the group
	_EnemyGroup = [[((_safepos select 0) + random 10),((_safepos select 1) + random 10),0], _side, _troops] call BIS_fnc_spawnGroup;
	_WPpos = getpos leader _EnemyGroup;
	(leader _EnemyGroup) setVariable ["lambs_danger_dangerRadio",true];

	[_enemyGroup,_WPpos] spawn {
		sleep 3;
		{[_x] call Schlaak_fnc_combatModeVehicle} forEach units (_this select 0);
		sleep 3;
		//Waypoint
		_WP =  (_this select 0) addWaypoint [ (_this select 1), 0];	//give wp
		_WP setWaypointType "GUARD";
		
		// lambs wp
		//[leader (_this select 0), (_this select 1)] spawn lambs_wp_fnc_taskAssault;
		
		
		sleep 600;


		// enable dynamic simulation after 10 minutes.
		{_x enableDynamicSimulation true;} foreach (units (_this select 0));
		(_this select 0) enableDynamicSimulation true;
	};
	_EnemyGroup deleteGroupWhenEmpty true;
	waitUntil {( {alive _x} count units _EnemyGroup) == 0;};


	} else {
		//systemchat "player is too near to the position. will not spawn"
		};
	sleep 30;
	
};