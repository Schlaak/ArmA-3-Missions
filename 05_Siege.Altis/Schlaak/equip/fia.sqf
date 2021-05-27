//diag_log ["sovietuniform.sqf called with", _this];
if (!isserver) exitWith {
	diag_log ["not server"];
};

private ["_items","_dude","_uniform","_hat","_rifle","_vest","_vestitems","_googles"];

_dude = _this select 0;
if ( isplayer _dude) exitwith {};
_items = uniformItems _dude;
sleep 0.5;
removeUniform _dude;

_hat = selectRandom ["H_Cap_marshal","H_Cap_grn_BI","H_Cap_blu","H_Cap_blk_CMMG","H_Cap_grn","H_Cap_tan"
,"H_Cap_blk_ION","H_Cap_oli","H_Cap_red","H_Cap_blk","H_Cap_blk_Raven","H_Cap_headphones","H_Beret_blk","H_Bandanna_camo"
,"H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Bandanna_gry","H_Bandanna_sand","H_Bandanna_blu","H_HelmetIA"
,"H_HelmetIA","H_HelmetIA","","","","","","","",""];

_uniform = selectRandom ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite",
"U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_I_G_Story_Protagonist_F","U_BG_Guerilla2_1"
,"U_BG_Guerilla2_3","U_BG_Guerilla2_2","U_BG_Guerilla1_1","U_OG_Guerilla1_1","U_BG_Guerilla3_1"
,"U_BG_Guerrilla_6_1","U_BG_leader","U_C_HunterBody_grn","U_I_G_resistanceLeader_F","U_Marshal","U_I_C_Soldier_Bandit_4_F"
,"U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_2_F"
,"U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Para_1_F"
,"U_C_Man_casual_5_F","U_C_Man_casual_4_F","U_C_Man_casual_6_F","U_I_C_Soldier_Camo_F","U_C_ArtTShirt_01_v6_F"
,"U_C_ArtTShirt_01_v1_F","U_C_ArtTShirt_01_v4_F","U_C_ArtTShirt_01_v2_F","U_C_ArtTShirt_01_v5_F","U_C_ArtTShirt_01_v3_F"
,"U_C_Uniform_Farmer_01_F","U_C_E_LooterJacket_01_F","U_I_L_Uniform_01_tshirt_olive_F","U_I_L_Uniform_01_tshirt_skull_F"
,"U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_sport_F","U_O_R_Gorka_01_black_F","U_BG_Guerilla1_2_F"
,"CUP_U_B_BDUv2_roll_dirty_DPM_OD","CUP_U_B_BDUv2_roll_gloves_dirty_DPM_OD","CUP_U_B_BDUv2_dirty_DPM_OD",
"CUP_U_O_CHDKZ_Bardak","CUP_U_O_CHDKZ_Lopotev","CUP_U_O_CHDKZ_Kam_03","CUP_U_O_CHDKZ_Kam_01","CUP_U_O_CHDKZ_Kam_02"
,"CUP_U_O_CHDKZ_Commander","CUP_U_O_CHDKZ_Kam_04","CUP_U_O_CHDKZ_Kam_08","CUP_U_O_CHDKZ_Kam_05","CUP_U_O_CHDKZ_Kam_07"
,"CUP_U_O_CHDKZ_Kam_06","CUP_U_C_Citizen_04","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Jeans_02"
,"CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_03","CUP_U_I_GUE_Anorak_01","CUP_U_I_GUE_Anorak_03","CUP_U_I_GUE_Anorak_02"
,"CUP_U_I_GUE_WorkU_01","CUP_U_I_GUE_WorkU_02","CUP_U_I_GUE_Flecktarn2","CUP_U_I_GUE_Flecktarn3","CUP_U_I_GUE_Flecktarn"
,"CUP_U_I_GUE_Flecktarn4","CUP_U_I_GUE_Woodland1","CUP_U_USNavy_LHD_crew_Green","CUP_I_B_PARA_Unit_15","CUP_I_B_PARA_Unit_8"
,"CUP_I_B_PARA_Unit_6","CUP_I_B_PARA_Unit_10","CUP_I_B_PARA_Unit_9","CUP_I_B_PARA_Unit_4","CUP_I_B_PARA_Unit_1"
,"CUP_I_B_PARA_Unit_3","CUP_U_O_Partisan_TTsKO","CUP_U_O_Partisan_TTsKO_Mixed","CUP_U_O_Partisan_VSR_Mixed1"
,"CUP_U_O_Partisan_VSR_Mixed2","CUP_I_B_PMC_Unit_19","CUP_I_B_PMC_Unit_13","CUP_I_B_PMC_Unit_16","CUP_I_B_PMC_Unit_15"
,"CUP_I_B_PMC_Unit_3","CUP_I_B_PMC_Unit_2","CUP_I_B_PMC_Unit_1","CUP_I_B_PMC_Unit_4","CUP_I_B_PMC_Unit_7","CUP_I_B_PMC_Unit_6"
,"CUP_I_B_PMC_Unit_5","CUP_I_B_PMC_Unit_8","CUP_I_B_PMC_Unit_11","CUP_I_B_PMC_Unit_9","CUP_I_B_PMC_Unit_10"
,"CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_43","CUP_I_B_PMC_Unit_40","CUP_I_B_PMC_Unit_39"
,"CUP_I_B_PMC_Unit_36","CUP_I_B_PMC_Unit_38","CUP_I_B_PMC_Unit_37","CUP_U_C_racketeer_01","CUP_U_C_racketeer_02","CUP_U_C_racketeer_03"
,"CUP_U_C_racketeer_04","CUP_U_C_Rocker_01","CUP_U_C_Rocker_03","CUP_U_C_Rocker_02","CUP_U_C_Rocker_04"];

_goggles = selectrandom ["CUP_G_Scarf_Face_Blk","CUP_G_Scarf_Face_Grn","CUP_G_Scarf_Face_Red","CUP_G_Scarf_Face_Tan",
"CUP_G_Scarf_Face_White","G_RegulatorMask_F","CUP_PMC_Facewrap_Red","CUP_PMC_Facewrap_Tan","G_Bandanna_sport","G_Bandanna_blk"
,"G_Bandanna_aviator","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_beast","G_Bandanna_shades","CUP_RUS_Balaclava_tan"
,"CUP_G_RUS_Balaclava_Ratnik_winter","CUP_G_RUS_Balaclava_Ratnik","CUP_G_RUS_Balaclava_Ratnik_v2","CUP_RUS_Balaclava_rgr",
"CUP_RUS_Balaclava_grn","CUP_RUS_Balaclava_blk","G_Respirator_white_F","G_Respirator_yellow_F","G_Respirator_blue_F",
"G_Balaclava_lowprofile","G_Balaclava_oli","G_Balaclava_blk","G_AirPurifyingRespirator_02_black_F"];
_vest = selectrandom ["V_CarrierRigKBT_01_Olive_F","V_Pocketed_coyote_F","V_Pocketed_olive_F","V_Pocketed_black_F",
"CUP_V_I_Guerilla_Jacket","CUP_V_I_Guerilla_Jacket","CUP_V_I_Guerilla_Jacket","CUP_V_B_PASGT_no_bags","CUP_V_B_PASGT",
"V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_blk","V_TacVestIR_blk",
"CUP_V_B_RRV_MG","CUP_V_B_RRV_Scout3","CUP_V_B_RRV_Scout2_CB","CUP_V_B_RRV_Scout_CB","CUP_V_B_RRV_Officer_CB","CUP_V_B_RRV_Medic_CB"
,"CUP_V_RUS_Smersh_1","CUP_V_RUS_Smersh_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_05",
"CUP_V_OI_TKI_Jacket1_03","CUP_V_OI_TKI_Jacket4_01","CUP_V_OI_TKI_Jacket3_01","CUP_V_OI_TKI_Jacket3_01","V_TacVest_oli",
"V_TacVest_blk","V_TacVest_camo","V_TacChestrig_oli_F","V_TacChestrig_cbr_F","V_PlateCarrier1_blk","V_SmershVest_01_F",
"CUP_V_MBSS_PACA2_Green","CUP_V_I_RACS_Carrier_Rig_wdl_3","CUP_V_O_SLA_M23_1_OD","CUP_V_B_Interceptor_Rifleman_M81","CUP_V_CPC_Fast_coy","CUP_V_O_Ins_Carrier_Rig_MG",
"CUP_V_O_Ins_Carrier_Rig_MG","CUP_V_O_Ins_Carrier_Rig_MG","CUP_V_CZ_NPP2006_light_vz95","CUP_V_CZ_NPP2006_nk_vz95","CUP_V_RUS_6B3_Flora_1"];
_vestitems = vestItems _dude;
removevest _dude;
_dude addvest _vest;
sleep 0.5;
{
	_dude addItemToVest _x
} foreach _vestitems;


removeUniform _dude;
sleep 0.5;
_dude forceAddUniform _uniform;
sleep 0.5;
removeHeadgear _dude;
_dude addheadgear _hat;
_dude addgoggles _goggles;
sleep 0.5;
_rifle = selectrandom  ["CUP_arifle_M16A2","CUP_arifle_XM16E1","CUP_arifle_FNFAL5060","CUP_arifle_AK47_Early"
,"CUP_arifle_AK105","CUP_arifle_AKM_Early","CUP_arifle_AKMS_Early","CUP_arifle_AKS_top_rail","CUP_sgun_CZ584"
,"CUP_srifle_CZ750","CUP_CZ_BREN2_556_14","CUP_Famas_F1","CUP_arifle_G36C","CUP_arifle_G3A3_ris","CUP_arifle_G3A3_ris_black"
,"CUP_srifle_L129A1","CUP_arifle_L85A2","CUP_sgun_M1014","CUP_srifle_M14","CUP_arifle_M16A1","CUP_arifle_M4A1_black"
,"CUP_smg_Mac10","CUP_arifle_IMI_Romat","CUP_arifle_Sa58RIS2","CUP_arifle_Sa58V","CUP_sgun_SPAS12","CUP_arifle_XM16E1"];
removeAllWeapons _dude;
_dude addweapon _rifle;
sleep 0.5;
_magazines = getArray (configFile >> "CfgWeapons" >> primaryWeapon _dude >> "magazines");
_dude addmagazineglobal (_magazines select 0);
_dude addmagazineglobal (_magazines select 0);
_dude addmagazineglobal (_magazines select 0);
_dude addmagazineglobal (_magazines select 0);

{
	_dude addItemToUniform _x
} foreach _items;

sleep 30;
if (true) exitwith {};
/*


switch (rank _dude) do
{
    case "CORPORAL":
    {
        _hat = selectRandom [""];

    };

    case "SERGEANT":
    {
        _hat = selectRandom [""];

    };

    case "LIEUTENANT":
    {
        _hat = selectRandom ["",""];

    };

    case "CAPTAIN":
    {
        _hat = selectRandom [""];

    };

    case "MAJOR":
    {
        _hat = selectRandom [""];

    };
	default
    {
        		
    };

};