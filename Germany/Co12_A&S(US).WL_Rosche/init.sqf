enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 1800;
"Vehicle" setDynamicSimulationDistance 1800;
"EmptyVehicle" setDynamicSimulationDistance 300;
"Prop" setDynamicSimulationDistance 300;


//[] execVM "scripts\goon_dust.sqf";
_null = [true, false, true, 45, 70] execvm "injuredai_simplescript\injured.sqf";
call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";

//setDate [1986, 4, 25, 16, 40];
