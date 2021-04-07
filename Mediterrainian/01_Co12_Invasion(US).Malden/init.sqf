//Basic setup
enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 1800;
"Vehicle" setDynamicSimulationDistance 1800;
"EmptyVehicle" setDynamicSimulationDistance 300;
"Prop" setDynamicSimulationDistance 300;


offroad_debug = false;

//3rd Party JBOY scripts
JBOY_createFire = compile (preprocessFileLineNumbers "02_scripts\JBOY\JBOY_createFire.sqf");
JBOY_scream = compile (preprocessFileLineNumbers "02_scripts\JBOY\JBOY_scream.sqf");
JBOY_moduleEffectsFire = compile (preprocessFileLineNumbers "02_scripts\JBOY\JBOY_moduleEffectsFire.sqf");
PV_createFire = compile preprocessFileLineNumbers "02_scripts\JBOY\PV_createFire.sqf";
SET_GLOBALVAR = compile preprocessFileLineNumbers "02_scripts\JBOY\SET_GLOBALVAR.sqf";
PV_switchmove = compile preprocessFileLineNumbers "02_scripts\JBOY\PV_switchmove.sqf";







//Enable disable goon dust
//[] execVM "scripts\goon_dust.sqf";

//injured script
//_null = [true, false, true, 45, 70] execvm "injuredai_simplescript\injured.sqf";

//shoters idle animations
//call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";

//load Schlaak_Functions
//execvm "Schlaak_library.sqf";

// activate spawn eh
//[] execVM "scripts\spawn_EH.sqf";

/*
{
	diag_log ["adding inventory: ",_x];
	[west,_x] call BIS_fnc_addRespawnInventory;
} forEach ["RIFLEMAN1","ATHEAVY1","ATASSIST1","AUTORIFLE1","MEDIC1"];