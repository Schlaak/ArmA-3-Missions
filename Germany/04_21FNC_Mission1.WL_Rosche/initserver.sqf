#include "01_Schlaak\Schlaak_vars.sqf";
#include "01_Schlaak\Schlaak_spawn_EH.sqf";



[] execvm "01_Schlaak\Missionscripts\ambienteflyby.sqf";

//3rd party winter scripts by GF
if ((paramsArray select 21) == 1 ) then {
	[] execVM "02_scripts\GF_Breath\GF_Breath.sqf";
	[] execVM "02_scripts\GF_AEW_Snow\GF_AEW_Snow.sqf";
};
//the scripts above are bad and cause framedrop

[east, 10] call BIS_fnc_respawnTickets;
[west, 10] call BIS_fnc_respawnTickets;

_lead = 2;
_AT = 2;
_MG = 2;
_Med = 2;


[west,"B_CWR_AMG",-1,-1] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_M47",-1,-1] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_ATcarl",-1,2] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_AA",-1,-1] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_ar",-1,2] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_crew",-1,-1] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_MG",-1,2] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_medic",-1,2] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_ATlaw",-1,2] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_SL",-1,2] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_TL",-1,2] call BIS_fnc_addRespawnInventory;
[west,"B_CWR_Rifleman",-1,-1] call BIS_fnc_addRespawnInventory;



[east,"O_CWR_TL",-1,2] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_SL",-1,2] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_ATrpg18",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_RMbckpck",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_RM",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_Medic",-1,2] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_DMR",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_MG",-1,2] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_crew",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_crewAPC",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_strela",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_igla",-1,-1] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_RPG7",-1,2] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_AT4",-1,2] call BIS_fnc_addRespawnInventory;
[east,"O_CWR_AR",-1,2] call BIS_fnc_addRespawnInventory;

systemchat "=====================";
systemChat "respawntemplates done";
systemchat "=====================";
//[east, "WEST1"] call BIS_fnc_addRespawnInventory;
//0 setfog 0;

//skiptime -12;


sleep 30;
systemchat "=============";
systemchat "spawning endless battle";
_battle = [west,getmarkerpos (selectrandom ["MSR","SSR1","SSR2"]),B_grp_arr_Mech] spawn Schlaak_fnc_attackwave; 
sleep 3;
_battle = [west,getmarkerpos (selectrandom ["MSR","SSR1","SSR2"]),B_grp_arr_Mech] spawn Schlaak_fnc_attackwave; 
sleep 3;
_battle = [west,getmarkerpos (selectrandom ["MSR","SSR1","SSR2"]),B_grp_arr_Mech] spawn Schlaak_fnc_attackwave; 
sleep 3;
_battle = [west,getmarkerpos (selectrandom ["MSR","SSR1","SSR2"]),B_grp_arr_Tank] spawn Schlaak_fnc_attackwave; 
sleep 3;

_battle = [east,getmarkerpos (selectrandom ["SovietSpawn_0","SovietSpawn_1","SovietSpawn_2"]),O_grp_arr_Mech] spawn Schlaak_fnc_attackwave;
sleep 3;
_battle = [east,getmarkerpos (selectrandom ["SovietSpawn_0","SovietSpawn_1","SovietSpawn_2"]),O_grp_arr_Mech] spawn Schlaak_fnc_attackwave;
sleep 3;
_battle = [east,getmarkerpos (selectrandom ["SovietSpawn_0","SovietSpawn_1","SovietSpawn_2"]),O_grp_arr_Mech] spawn Schlaak_fnc_attackwave;
sleep 3;
_battle = [east,getmarkerpos (selectrandom ["SovietSpawn_0","SovietSpawn_1","SovietSpawn_2"]),O_grp_arr_Tank] spawn Schlaak_fnc_attackwave;
sleep 3;
_battle = [east,getmarkerpos (selectrandom ["SovietSpawn_0","SovietSpawn_1","SovietSpawn_2"]),O_grp_arr_Tank] spawn Schlaak_fnc_attackwave;
systemchat "=============";
systemchat "endless battle spawned - KHORNE is proud of you!";
if (true) exitwith {

};
//forceWeatherChange;


//[west, 10] call BIS_fnc_respawnTickets;


/*
_wind = selectrandom [1,2,3,4];
switch (_wind) do
{
	case 1:
	{
		setWind [0, 0, true];
	};
	case 2:
	{
		setWind [1, 1, true];
	};
	case 3:
	{
		setWind [3, 3, true];
	};
	case 4:
	{
		setWind [4, 4, true];
	};
};

sleep 5;

// Schlaak Variablen ausführen

