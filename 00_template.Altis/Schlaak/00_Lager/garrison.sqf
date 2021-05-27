//[getpos this, (1+random 3)] execVM "Schlaak\garrison.sqf";
if (!isserver) exitWith {};
//private [_pos1];
_pos1 = _this select 0;
_waves = _this select 1;

_O_grpATteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_at_team");
_O_grpFTeam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_fire_team");
_O_grpMGteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_mg_team");
_O_grpRFsqd = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_rifle_squad");
_O_grpSupportteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_support_team");
_O_grpInfRnd = selectrandom [_O_grpATteam,_O_grpATteam,_O_grpATteam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpRFsqd,_O_grpRFsqd,_O_grpSupportteam];

_fleethreshold = selectRandom [0.45,0.5,0.3,0.2];
_fleecaptive = selectRandom [true,False];
_troopsside = east;
for "_i" from 0 to _waves do {
	_O_grpInfRnd = selectrandom [_O_grpATteam,_O_grpATteam,_O_grpATteam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpFTeam,_O_grpRFsqd,_O_grpRFsqd,_O_grpSupportteam];
	_safepos = [_pos1, 1, 200, 12, 0, 0.1, 0] call BIS_fnc_findSafePos; //find a safe pos from pos2 to spawn units at
	sleep 2;
	_EnemyGroup = [[((_safepos select 0) + random 2),((_safepos select 1) + random 2),0], _troopsside, _O_grpInfRnd] call BIS_fnc_spawnGroup; //spawn em
	sleep 3;
	[leader _EnemyGroup, leader _EnemyGroup, 250] call lambs_wp_fnc_taskGarrison;
	sleep 3;
	[(leader _EnemyGroup),_fleethreshold,_fleecaptive] execvm "Schlaak\surrenderflee.sqf";
	{_x enableDynamicSimulation true;} foreach (units _EnemyGroup);
	_EnemyGroup enableDynamicSimulation true;
};