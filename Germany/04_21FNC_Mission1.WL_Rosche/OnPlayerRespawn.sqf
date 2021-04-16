player setUnitLoadout (player getVariable ["TAG_LoadoutStart", []]);
[] execVM "02_scripts\amb_combat_sound.sqf";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "Binocular";