[] execVM "01_Schlaak\antioffroad.sqf";
offroad_debug = false;
[] execVM "01_Schlaak\burn.sqf";
[] execVM "01_Schlaak\Postprocessing.sqf";
[] execVM "01_Schlaak\Briefinggenerator.sqf";

sleep 30;
if (true) exitwith {};
//[] execVM "02_cripts\amb_combat_sound.sqf";
//[] execVM "01_Schlaak\introtext.sqf";
//[] execVM "01_Schlaak\burn.sqf";
//[] execVM "initPlayerActions.sqf";