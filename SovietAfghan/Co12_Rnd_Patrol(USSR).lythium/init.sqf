enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 1800;
"Vehicle" setDynamicSimulationDistance 1800;
"EmptyVehicle" setDynamicSimulationDistance 300;
"Prop" setDynamicSimulationDistance 300;
[] execVM "irn_library.sqf";
sleep 3;
[player] call IRN_fnc_noLoot;
[] execVM "bon_recruit_units\init.sqf";
//[] execVM "JWC_CASFS\initCAS.sqf";
[] execVM "scripts\goon_dust.sqf";
_null = [true, false, true, 45, 70] execvm "injuredai_simplescript\injured.sqf";


//setDate [1986, 4, 25, 16, 40];
call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";