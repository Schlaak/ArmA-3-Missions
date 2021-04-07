//[this,O_grpInfRnd,1,1+(floor random 3)] call Schlaak_fnc_garrison;
params ["_position","_grpType","_minGrp","_maxGrp"]; 

if (!isserver) exitWith {};



        _troopsside = Schlaak_Hostiles;

//[getpos player,90,1200,2,O_grpMech1,250] call Schlaak_fnc_Counterattack;


for "_i" from 0 to (_minGrp + (floor random _maxGrp)) do {
	//find a savepos
_safepos = [_position, 1, 200, 12, 0, 0.1, 0] call BIS_fnc_findSafePos;


_troops = selectrandom _grpType;
//spawn em
_EnemyGroup = [[((_safepos select 0) + random 2),((_safepos select 1) + random 2),0], Schlaak_Hostiles, _troops] call BIS_fnc_spawnGroup; 

[leader _EnemyGroup, leader _EnemyGroup, 250] call lambs_wp_fnc_taskGarrison;

	{_x enableDynamicSimulation true;} foreach (units _EnemyGroup);
	_EnemyGroup enableDynamicSimulation true;
};