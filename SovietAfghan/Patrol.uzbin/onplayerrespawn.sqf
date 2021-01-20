if (player isKindOf "") then
{

// "Exported from Arsenal by Schlaak";

// "[!] UNIT MUST BE LOCAL [!]";
if (!local player) exitWith {};

// "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

// "Add weapons";
player addWeapon "CUP_arifle_AK74";
player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

// "Add containers";
player forceAddUniform "cwr3_o_uniform_m1983_coverall_kzs";
player addVest "cwr3_o_vest_harness_officer";

// "Add items to containers";
player addItemToUniform "FirstAidKit";
for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
player addItemToVest "CUP_30Rnd_545x39_AK_M";
for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addHeadgear "cwr3_o_ushanka";

// "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

// "Set identity";
//[player,"LivonianHead_6","male02rus"] call BIS_fnc_setIdentity;

} else {

// "Exported from Arsenal by Schlaak";

// "[!] UNIT MUST BE LOCAL [!]";
if (!local player) exitWith {};

// "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

// "Add weapons";
player addWeapon "CUP_arifle_AK74";
player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

// "Add containers";
player forceAddUniform "cwr3_o_uniform_m1982_lacers";
player addVest "cwr3_o_vest_harness_ak74";

// "Add items to containers";
player addItemToUniform "FirstAidKit";
for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
player addItemToVest "CUP_30Rnd_545x39_AK_M";
for "_i" from 1 to 4 do {player addItemToVest "CUP_HandGrenade_RGD5";};
player addHeadgear "cwr3_o_headgear_ssh68";

// "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

// "Set identity";
//[player,"WhiteHead_04","male01rus"] call BIS_fnc_setIdentity;

};