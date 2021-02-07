if (isDedicated) exitWith {};
_SL = "cwr3_o_soldier_sl";
_MG =  "cwr3_o_soldier_mg";
_MED = "cwr3_o_soldier_medic";
_AT = "cwr3_o_soldier_at_rpg7";
_AR = "cwr3_o_soldier_ar";
_RM = "cwr3_o_soldier";
_MGA = "cwr3_o_soldier_amg";
_GL =  "cwr3_o_soldier_gl";
if (player isKindOf _RM) then
{

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	comment "Add weapons";
	player addWeaponglobal "CUP_arifle_AK74";
	player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

	player forceAddUniform "cwr3_o_uniform_m1982_lacers";
	player addVest "cwr3_o_vest_harness_ak74";

	player addItemToUniform "FirstAidKit";
	for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
	player addItemToVest "CUP_30Rnd_545x39_AK_M";
	for "_i" from 1 to 4 do {player addItemToVest "CUP_HandGrenade_RGD5";};
	player addHeadgear "cwr3_o_headgear_ssh68";

	player linkItem "ItemCompass";
	player linkItem "ItemWatch";

	 player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};


if (player isKindOf _SL) then
{
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	comment "Add weapons";
	player addWeaponGlobal "CUP_arifle_AK74_GL";
	player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

	comment "Add containers";
	player forceAddUniform "cwr3_o_uniform_m1982";
	player addVest "cwr3_o_vest_harness_officer";

	comment "Add binoculars";
	player addWeaponGlobal "Binocular";

	comment "Add items to containers";
	player addItemToUniform "FirstAidKit";
	for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
	player addItemToVest "CUP_30Rnd_545x39_AK_M";
	for "_i" from 1 to 2 do {player addItemToVest "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 3 do {player addItemToVest "CUP_1Rnd_HE_GP25_M";};
	for "_i" from 1 to 2 do {player addItemToVest "CUP_1Rnd_SMOKE_GP25_M";};
	player addItemToVest "CUP_1Rnd_SmokeGreen_GP25_M";
	player addItemToVest "CUP_1Rnd_SmokeRed_GP25_M";
	player addHeadgear "cwr3_o_headgear_fieldcap_m1982";


	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player additem "ACRE_PRC148";

	 player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};
if (player isKindOf _MG) then
{

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addWeaponGlobal "CUP_lmg_PKMN";
	player addPrimaryWeaponItem "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";

	player forceAddUniform "cwr3_o_uniform_m1982_lacers_rolled";
	player addVest "cwr3_o_vest_harness_mg";
	player addBackpack "cwr3_o_backpack_rd54_pk";

	player addItemToUniform "FirstAidKit";
	player addItemToUniform "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 2 do {player addItemToVest "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";};
	player addItemToVest "CUP_HandGrenade_RGD5";
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 3 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_RGD5";};
	player addHeadgear "cwr3_o_headgear_ssh68";

	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player additem "ACE_EarPlugs";

	 player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};
if (player isKindOf _MED) then
{

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addWeaponGlobal "CUP_arifle_AKS74U";
	player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

	player forceAddUniform "cwr3_o_uniform_m1982_lacers";
	player addVest "cwr3_o_vest_harness_medic";
	player addBackpack "cwr3_o_backpack_rd54_medic";

	player addItemToUniform "FirstAidKit";
	for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
	player addItemToVest "CUP_30Rnd_545x39_AK_M";
	player addItemToVest "SmokeShellBlue";
	player addItemToVest "SmokeShellYellow";
	player addItemToBackpack "Medikit";
	for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
	player addHeadgear "cwr3_o_headgear_ssh68_net";

	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	for "_i" from 1 to 9 do {player addItemToBackpack "ACE_fieldDressing";};

	for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_500";};
	player additem "ACE_surgicalKit";
	for "_i" from 1 to 6 do {player addItemToBackpack "ACE_packingBandage";};

	player additem "ACE_Canteen";
	for "_i" from 1 to 4 do {player addItemToBackpack "ACE_splint";};
	for "_i" from 1 to 8 do {player addItemToBackpack "ACE_tourniquet";};

	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};
if (player isKindOf _AT) then
{

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addWeaponglobal "CUP_arifle_AKS74U";
	player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";
	player addWeaponglobal "CUP_launch_RPG7V";
	player addSecondaryWeaponItem "CUP_PG7VL_M";

	player forceAddUniform "cwr3_o_uniform_m1982_lacers";
	player addVest "cwr3_o_vest_harness_sapper";
	player addBackpack "cwr3_o_backpack_rpg7_pg7vl";

	player addItemToUniform "FirstAidKit";
	for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
	player addItemToVest "CUP_30Rnd_545x39_AK_M";
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_PG7VL_M";};
	player addHeadgear "cwr3_o_headgear_ssh68";


	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player additem "ACE_EarPlugs";


	 player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};
if (player isKindOf _AR) then
{

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player addWeaponGlobal "CUP_arifle_RPK74_45";
	player addPrimaryWeaponItem "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";

	player forceAddUniform "cwr3_o_uniform_m1982_lacers_rolled";
	player addVest "cwr3_o_vest_chicom_beltkit_ak74";
	player addBackpack "cwr3_o_backpack_rd54_rpk";

	player addItemToUniform "FirstAidKit";
	for "_i" from 1 to 3 do {player addItemToUniform "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	player addItemToUniform "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 3 do {player addItemToVest "CUP_HandGrenade_RGD5";};
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 3 do {player addItemToBackpack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_RGD5";};
	player addHeadgear "cwr3_o_headgear_ssh68";

	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player additem "ACE_EarPlugs";

	 player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};

if (player isKindOf _MGA) then
{


	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;


	player addWeaponglobal "CUP_arifle_AK74";
	player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";


	player forceAddUniform "cwr3_o_uniform_m1982_lacers";
	player addVest "cwr3_o_vest_harness_mg";
	player addBackpack "cwr3_o_backpack_rd54_pk";


	player addItemToUniform "FirstAidKit";
	for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
	player addItemToVest "CUP_30Rnd_545x39_AK_M";
	for "_i" from 1 to 4 do {player addItemToVest "CUP_HandGrenade_RGD5";};
	player addItemToBackpack "FirstAidKit";
	for "_i" from 1 to 3 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_RGD5";};
	player addHeadgear "cwr3_o_headgear_ssh68";


	player linkItem "ItemCompass";
	player linkItem "ItemWatch";


	 player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};
if (player isKindOf _GL) then
{

	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	comment "Add weapons";
	player addWeaponGlobal "CUP_arifle_AK74_GL";
	player addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

	comment "Add containers";
	player forceAddUniform "cwr3_o_uniform_m1982_lacers";
	player addVest "cwr3_o_vest_harness_sapper";

	comment "Add items to containers";
	player addItemToUniform "FirstAidKit";
	for "_i" from 1 to 6 do {player addItemToUniform "CUP_30Rnd_545x39_AK_M";};
	player addItemToVest "CUP_30Rnd_545x39_AK_M";
	for "_i" from 1 to 7 do {player addItemToVest "CUP_1Rnd_HE_GP25_M";};
	for "_i" from 1 to 4 do {player addItemToVest "CUP_HandGrenade_RGD5";};
	player addHeadgear "cwr3_o_headgear_ssh68_camo";

	comment "Add items";

	player linkItem "ItemCompass";
	player linkItem "ItemWatch";


	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";
	player additem "ACE_fieldDressing";

	player additem "ACE_packingBandage";
	player additem "ACE_packingBandage";

	player additem "ACE_Canteen";
	player additem "ACE_personalAidKit";
	player disableAI "RADIOPROTOCOL";

	_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do 
		{
			player addMagazineGlobal _magazine;
		};
};





