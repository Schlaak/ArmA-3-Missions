//Basic setup
enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 1800;
"Vehicle" setDynamicSimulationDistance 1800;
"EmptyVehicle" setDynamicSimulationDistance 300;
"Prop" setDynamicSimulationDistance 300;


offroad_debug = false;

//Enable disable goon dust
//[] execVM "scripts\goon_dust.sqf";

//injured script
_null = [true, false, true, 45, 70] execvm "injuredai_simplescript\injured.sqf";

//shoters idle animations
call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";

//load Schlaak_Functions
//execvm "Schlaak_library.sqf";

// activate spawn eh
[] execVM "scripts\spawn_EH.sqf";