//[_dude, false] execvm "scripts\US.sqf";
//heavy loadout
//[_dude, true] execvm "scripts\US.sqf";
//[_dude, true] execvm "scripts\US.sqf";
//[_dude] execvm "scripts\dushman.sqf";
if !(isserver) exitWith {};

//private ["_items","_dude","_uniform"];

_dude = _this select 0;
//if (_dude isKindOf "CUP_I_TK_GUE_Soldier") then
//{

_uniform = selectRandom ["CUP_U_O_TK_MixedCamo","CUP_U_C_Profiteer_04","CUP_U_C_Profiteer_01","CUP_U_C_Profiteer_03","CUP_I_B_PMC_Unit_43","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_08","CUP_O_TKI_Khet_Partug_08","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Jeans_03","CUP_O_TKI_Khet_Jeans_03","CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_02","CUP_O_TKI_Khet_Jeans_02","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Jeans_04"];
_vest = selectRandom ["V_HarnessO_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_blk","V_TacVest_oli","V_I_G_resistanceLeader_F","V_LegStrapBag_coyote_F","V_LegStrapBag_olive_F","V_Pocketed_coyote_F","V_Pocketed_olive_F","V_Pocketed_black_F","cwr3_o_vest_6b2_ak74","cwr3_o_vest_6b2_chicom_ak74","cwr3_o_vest_6b2_chicom_light_ak74","cwr3_o_vest_6b2_mg","cwr3_o_vest_6b2_sapper","cwr3_o_vest_officer_jacket","cwr3_b_vest_alice","cwr3_b_vest_alice_medic","cwr3_b_vest_alice_mg","cwr3_b_vest_alice_officer","cwr3_i_vest_anite_blk","cwr3_i_vest_anite_khk","cwr3_b_vest_anite","cwr3_o_vest_chicom_ak74","cwr3_o_vest_chicom_ak74","cwr3_o_vest_chicom_ak74","cwr3_o_vest_chicom_ak74","cwr3_o_vest_chicom_ak74","cwr3_o_vest_chicom_ak74","cwr3_o_vest_chicom_beltkit_ak74","cwr3_o_vest_chicom_beltkit_light_ak74","cwr3_i_vest_chicom","cwr3_i_vest_lbv","cwr3_i_vest_lbv_mg","cwr3_i_vest_lbv_mg_olive","cwr3_i_vest_lbv_olive","cwr3_o_vest_harness_ak74","cwr3_o_vest_harness_ak74","cwr3_i_vest_chicom","cwr3_i_vest_lbv","cwr3_i_vest_lbv_mg","cwr3_i_vest_lbv_mg_olive","cwr3_i_vest_lbv_olive","cwr3_o_vest_harness_medic","cwr3_b_vest_pasgt_alice_woodland_medic","CUP_V_B_PASGT_no_bags_desert","CUP_V_B_PASGT_no_bags_OD","CUP_V_RUS_Smersh_1","CUP_V_RUS_Smersh_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_01","CUP_V_OI_TKI_Jacket1_05","CUP_V_OI_TKI_Jacket1_02","CUP_V_OI_TKI_Jacket1_03","CUP_V_OI_TKI_Jacket1_03","CUP_V_OI_TKI_Jacket4_04","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_02","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket4_03","CUP_V_OI_TKI_Jacket4_01","CUP_V_OI_TKI_Jacket5_04","CUP_V_OI_TKI_Jacket5_05","CUP_V_OI_TKI_Jacket5_02","CUP_V_OI_TKI_Jacket5_06","CUP_V_OI_TKI_Jacket5_03","CUP_V_OI_TKI_Jacket5_01","CUP_V_OI_TKI_Jacket3_04","CUP_V_OI_TKI_Jacket3_02","CUP_V_OI_TKI_Jacket3_03","CUP_V_OI_TKI_Jacket3_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket3_01","CUP_V_OI_TKI_Jacket6_04","CUP_V_OI_TKI_Jacket6_05","CUP_V_OI_TKI_Jacket6_02","CUP_V_OI_TKI_Jacket6_06","CUP_V_OI_TKI_Jacket6_03","CUP_V_OI_TKI_Jacket6_01","CUP_V_OI_TKI_Jacket2_04","CUP_V_OI_TKI_Jacket2_06","CUP_V_OI_TKI_Jacket2_03","CUP_V_OI_TKI_Jacket2_02","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket2_01"];
_bckpck = selectRandom ["","","","","","","","","","","","","","","","","","","CUP_B_AlicePack_Bedroll","CUP_B_AlicePack_Khaki","CUP_B_AlicePack_OD","cwr3_o_backpack_rd54","cwr3_o_backpack_harness_roll","cwr3_i_backpack","cwr3_b_backpack_alice","CUP_B_SLA_Medicbag"];
_rpgpack = selectrandom ["CUP_B_AlicePack_OD","CUP_B_RPGPack_Khaki","CUP_B_RPGPack_Khaki"];
_rpg = selectrandom ["cwr3_launch_rpg75","CUP_launch_M72A6","CUP_launch_M72A6_Special","CUP_launch_RPG26","CUP_launch_RPG7V","CUP_launch_RPG7V","CUP_launch_RPG7V","CUP_launch_RPG7V","CUP_launch_RPG18","CUP_launch_RShG2"];
_goggles = selectrandom ["G_Bandanna_shades","G_Bandanna_shades","G_Bandanna_tan","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_aviator","G_Bandanna_blk","G_Bandanna_sport","G_Spectacles","G_Aviator","G_Spectacles_Tinted","G_Squares","G_Squares_Tinted","G_Balaclava_blk","CUP_Beard_Black","CUP_Beard_Blonde","CUP_Beard_Brown","CUP_PMC_Facewrap_Ranger","CUP_PMC_Facewrap_Red","CUP_PMC_Facewrap_Tan","CUP_TK_NeckScarf","CUP_G_Scarf_Face_Blk","CUP_G_Scarf_Face_Grn","CUP_G_Scarf_Face_Red","CUP_G_Scarf_Face_Tan","CUP_G_Scarf_Face_White","CUP_G_Grn_Scarf_GPS_Beard","CUP_G_Grn_Scarf_GPS_Beard_Blonde","CUP_G_Tan_Scarf_GPS_Beard","CUP_G_Tan_Scarf_GPS_Beard_Blonde","CUP_G_White_Scarf_GPS_Beard_Blonde","CUP_G_White_Scarf_GPS_Beard","CUP_Beard_Black","CUP_Beard_Blonde","CUP_Beard_Brown","CUP_G_Grn_Scarf_GPS_Beard","CUP_G_Grn_Scarf_GPS_Beard_Blonde","CUP_G_Tan_Scarf_GPS_Beard","CUP_G_Tan_Scarf_GPS_Beard_Blonde","CUP_G_White_Scarf_GPS_Beard_Blonde","CUP_G_White_Scarf_GPS_Beard","CUP_Beard_Black","CUP_Beard_Blonde","CUP_Beard_Brown","CUP_G_Grn_Scarf_GPS_Beard","CUP_G_Grn_Scarf_GPS_Beard_Blonde","CUP_G_Tan_Scarf_GPS_Beard","CUP_G_Tan_Scarf_GPS_Beard_Blonde","CUP_G_White_Scarf_GPS_Beard_Blonde","CUP_G_White_Scarf_GPS_Beard","CUP_PMC_G_thug"];
_helmet = selectrandom ["","","","","","","","H_Cap_tan",
"H_Cap_oli","H_Cap_red","H_Cap_blk","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Shemag_olive","H_HeadBandage_bloody_F","H_HeadBandage_stained_F","H_HeadBandage_bloody_F","H_HeadBandage_stained_F","H_HeadBandage_clean_F","cwr3_o_headgear_ssh68","cwr3_o_headgear_tsh3","CUP_H_SLA_BeanieGreen","CUP_H_C_Beanie_04","CUP_H_C_Beanie_03","CUP_H_C_Beanie_02","CUP_H_C_Beanie_01","CUP_H_PMC_Beanie_Khaki","CUP_H_TK_Lungee","CUP_H_TK_Lungee","CUP_H_TK_Lungee","CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_02","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_04","CUP_H_TKI_Lungee_Open_05","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_02","CUP_H_TKI_Lungee_03","CUP_H_TKI_Lungee_04","CUP_H_TKI_Lungee_05","CUP_H_TKI_Lungee_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_2_04","CUP_H_TKI_Pakol_2_05","CUP_H_TKI_Pakol_2_06","CUP_H_TKI_Pakol_1_02","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06","CUP_H_TK_TankerHelmet"];
_weapon = selectrandom ["CUP_arifle_AK74_Early","CUP_arifle_AK74_GL_Early","CUP_arifle_AK74M","CUP_arifle_AK47_Early","CUP_arifle_AKM_Early","CUP_arifle_AKM_GL_Early","CUP_arifle_AKM","CUP_arifle_AKMS_Early","CUP_arifle_AKMS","CUP_arifle_AK47","CUP_arifle_AKS","CUP_arifle_AKS74_Early","CUP_arifle_AKS74","CUP_arifle_AKS74U","CUP_srifle_CZ550","CUP_sgun_CZ584","cwr3_smg_uzi","CUP_arifle_FNFAL5060","CUP_arifle_FNFAL5061","CUP_arifle_FNFAL5062","CUP_arifle_FNFAL","CUP_arifle_FNFAL5061_wooden","CUP_arifle_FNFAL_OSW","CUP_arifle_Gewehr1","CUP_arifle_G3A3_ris","CUP_arifle_G3A3_ris_black","CUP_arifle_G3A3_modern_ris","CUP_arifle_Galil_556_black","CUP_arifle_Galil_black","CUP_arifle_Galil_SAR_black","CUP_srifle_M14","CUP_arifle_M16A1","CUP_arifle_M16A2","CUP_smg_M3A1","CUP_smg_M3A1","CUP_smg_M3A1","CUP_smg_Mac10","CUP_srifle_LeeEnfield","CUP_srifle_LeeEnfield","CUP_srifle_LeeEnfield","CUP_srifle_LeeEnfield","CUP_srifle_LeeEnfield","CUP_lmg_M60","CUP_lmg_M60E4_norail","CUP_glaunch_M79","CUP_smg_Mac10","CUP_lmg_FNMAG","CUP_arifle_Sa58P","CUP_SKS","CUP_lmg_PKM","CUP_arifle_Steyr_Stg58","CUP_arifle_TYPE_56_2_Early","CUP_arifle_TYPE_56_2_Early","CUP_arifle_XM16E1","CUP_arifle_XM16E1"];
_mg = selectrandom ["CUP_lmg_UK59","CUP_lmg_PKM","CUP_lmg_M60","CUP_lmg_M60E4_norail","CUP_glaunch_M79","CUP_lmg_PKM","CUP_lmg_FNMAG","CUP_lmg_PKM","CUP_lmg_PKM","CUP_lmg_PKM","CUP_lmg_PKMN","CUP_arifle_RPK74","CUP_arifle_RPK74_45"];
_mgbackpack = selectrandom ["CUP_B_AlicePack_Bedroll","CUP_B_AlicePack_Khaki","CUP_B_AlicePack_OD","cwr3_o_backpack_rd54","cwr3_o_backpack_harness_roll","cwr3_i_backpack","cwr3_b_backpack_alice","CUP_B_SLA_Medicbag"];

sleep (1 + (random 3));


//if (!isPlayer _dude ) then {
_items = uniformItems _dude;
sleep 0.5;
removeUniform _dude;

//_dude addWeapon "arifle_SUD_AK74";
//_dude addPrimaryWeaponItem "SUD_30Rnd_545x39_AK";
if (!(_dude getVariable ["isSetup", false])) then {
_dude setVariable ["isSetup", true];



removeAllWeapons _dude;
removeAllItems _dude;
removeAllAssignedItems _dude;
removeUniform _dude;
removeVest _dude;
removeBackpack _dude;
removeHeadgear _dude;
removeGoggles _dude;



_dude forceAddUniform _uniform;
{_dude addItemToUniform _x} foreach _items;
_dude addGoggles _goggles;
_dude addHeadgear _helmet;
_dude addvest _vest;
_case = selectrandom [0,0,0,0,0,0,1,1,1,2,2,0,0];

	switch (_case) do
	{
	case 0:
	{
		_dude addweapon _weapon;
		_dude addBackpack _bckpck;
		_magazines = getArray (configFile >> "CfgWeapons" >> primaryWeapon _dude >> "magazines");
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);
	};
	case 1:
	{
		_dude addweapon _mg;
		_dude addBackpack _mgbackpack;
		_magazines = getArray (configFile >> "CfgWeapons" >> primaryWeapon _dude >> "magazines");
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);

	};
	case 2:
	{
		_dude addweapon _weapon;
		_dude addBackpack _rpgpack;
		_dude addweapon _rpg;
		_magazines = getArray (configFile >> "CfgWeapons" >> primaryWeapon _dude >> "magazines");
		_magazines2 = getArray (configFile >> "CfgWeapons" >> secondaryWeapon _dude >> "magazines");
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines2 select 0);
		_dude addmagazineglobal (_magazines2 select 0);
		_dude addmagazineglobal (_magazines2 select 0);
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);
		_dude addmagazineglobal (_magazines select 0);
	};
	};
};
sleep 30;
if (true) exitwith {};
//};
	//END FIRST IF
//};