/*
O_grpMech3
O_grp_arr_Inf

*/
if !(isserver) exitwith {};


/*==============================
// Define Vars
==============================*/
systemChat "==============";
systemChat "SpawnHostiles.sqf:";
systemChat "Initializing";
systemChat "==============";

_amountEnemyGroups = 3 + (floor random 3); //3 to 6
//_enemyGroups = [];


_TypePoi1 = "LocationFOB_F";
_TypePoi2 = "LocationCamp_F";
_TypePoi3 = "LocationResupplyPoint_F";
_TypePoi4 = "LocationOutpost_F";


_LocationObj = entities [[_TypePoi4,_TypePoi3,_TypePoi2,_TypePoi1], [], true, true];


/*==============================
// LOOP FOR CREATION OF 3 GROUPS TO random 6 GROUPS
==============================*/
for "_i" from 0 to _amountEnemyGroups do {

	_groupTypeInf = selectrandom O_grp_arr_Inf;
	_groupTypeMech = selectrandom O_grp_arr_Mech;
	_groupType = selectrandom [_groupTypeInf,_groupTypeInf,_groupTypeInf,_groupTypeInf,_groupTypeMech];


	_spawnPos = getpos selectRandom _LocationObj;

	systemChat "==============";
	systemChat "SpawnHostiles.sqf:";
	systemchat str (mapGridPosition _spawnpos);
	//systemchat str _groupType;
	systemChat "==============";


	_thisGroup = [_spawnPos, Schlaak_Hostiles, _groupType] call BIS_fnc_spawnGroup;
	_thisGroup enableDynamicSimulation true;



	//_enemyGroups pushBack _thisGroup;

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
			[(leader _thisGroup), (leader _thisGroup), 1000] spawn lambs_wp_fnc_taskPatrol;
			//[(leader _thisGroup), 1500] spawn lambs_wp_fnc_taskCreep;
		};
	};

		//AUTO APPLY StalkerFSM.sqf TO SNIPERS
	{
		if (_x isKindOf "CUP_I_TK_GUE_Sniper") then
		{
			[_x] execvm "01_ir0nsight\stalkerFSM.sqf";
		}
	} forEach units _thisGroup;
	_thisGroup enableDynamicSimulation true;
	sleep 2;

	_marker = floor random 4;
	if (_marker == 2) then {
		[[((getpos leader _thisGroup) select 0) + random 200,((getpos leader _thisGroup) select 1) + random 200,0],str name (leader _thisGroup),200 + random 100,200 + random 100,"ColorRed","FDiagonal"] call Schlaak_fnc_markArea
	};

};
sleep 2;
systemChat "==============";
systemChat "SpawnHostiles.sqf:";
systemChat "Done!";
systemChat "==============";
if (true) exitwith {};