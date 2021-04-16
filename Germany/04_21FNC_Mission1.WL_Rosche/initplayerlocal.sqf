[] execVM "01_Schlaak\antioffroad.sqf";
offroad_debug = false;
[] execVM "01_Schlaak\burn.sqf";
[] execVM "01_Schlaak\Postprocessing.sqf";
//[] execVM "01_Schlaak\Briefinggenerator.sqf";
[] execVM "briefing.sqf";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "Binocular";
player setVariable ["TAG_LoadoutStart", getUnitLoadout player];
player addEventHandler ["Respawn",{ player setUnitLoadout (player getVariable ["TAG_LoadoutStart", []]); }];

[] execVM "02_scripts\amb_combat_sound.sqf";
[] execVM "01_Schlaak\introtext.sqf";
sleep 30;
if (true) exitwith {};

//[] execVM "01_Schlaak\introtext.sqf";
//[] execVM "01_Schlaak\burn.sqf";
//[] execVM "initPlayerActions.sqf";