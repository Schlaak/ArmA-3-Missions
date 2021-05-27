// [this] execvm "Schlaak\Equip\civ.sqf";

_dude = _this select 0;
nul = [_dude,"CUP_hgun_Makarov",(10+random 10),floor random 50 + 5,resistance,1,1] execVM "02_scripts\ws_assassins.sqf";
_dude addAction ["<img size='4'  image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa' />","02_scripts\grab.sqf",(_this select 0),0,true,true,"","((_target distance _this) <2) && alive _target && ((lifeState _target) == 'HEALTHY') "];

if (!isserver) exitWith {
	diag_log ["not server"];
};

removeallitems _dude;
removeuniform _dude;
_uniform = selectrandom ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour",
"U_C_Poor_1","U_I_G_Story_Protagonist_F","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla2_2","U_BG_Guerilla1_1","U_BG_Guerilla3_1","U_BG_Guerrilla_6_1",
"U_C_HunterBody_grn","U_Marshal","U_I_G_resistanceLeader_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_3_F",
"U_I_C_Soldier_Bandit_2_F","U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_Man_casual_5_F","U_C_Man_casual_4_F","U_C_Man_casual_6_F","U_C_man_sport_1_F",
"U_C_FormalSuit_01_tshirt_gray_F","U_C_FormalSuit_01_tshirt_black_F","U_C_FormalSuit_01_black_F","U_C_FormalSuit_01_khaki_F","U_C_FormalSuit_01_gray_F","U_C_FormalSuit_01_blue_F"
,"U_C_ArtTShirt_01_v6_F","U_C_ArtTShirt_01_v1_F","U_C_ArtTShirt_01_v4_F","U_C_ArtTShirt_01_v2_F","U_C_ArtTShirt_01_v5_F","U_C_ArtTShirt_01_v3_F","U_C_Uniform_Farmer_01_F"
,"U_C_E_LooterJacket_01_F","U_I_L_Uniform_01_tshirt_olive_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_sport_F","U_C_Uniform_Scientist_02_formal_F"
,"U_C_Mechanic_01_F","CUP_U_O_CHDKZ_Lopotev","CUP_U_O_CHDKZ_Bardak","CUP_U_C_Citizen_02","CUP_U_C_Citizen_01","CUP_U_C_Citizen_04","CUP_U_C_Citizen_03"
,"CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Jeans_02","CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_03","CUP_U_I_GUE_Anorak_01","CUP_U_I_GUE_Anorak_03","CUP_U_I_GUE_Anorak_02"
,"CUP_I_B_PMC_Unit_39","CUP_I_B_PMC_Unit_40","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_4","CUP_I_B_PMC_Unit_1","CUP_I_B_PMC_Unit_2","CUP_I_B_PMC_Unit_3"
,"CUP_I_B_PMC_Unit_19","CUP_U_C_Profiteer_02","CUP_U_C_Profiteer_01","CUP_U_C_Profiteer_03","CUP_U_C_Profiteer_04","CUP_U_C_racketeer_01","CUP_U_C_racketeer_02","CUP_U_C_racketeer_03"
,"CUP_U_C_racketeer_04","CUP_U_C_Rocker_01","CUP_U_C_Rocker_02","CUP_U_C_Rocker_03","CUP_U_C_Rocker_04","CUP_U_C_Suit_01","CUP_U_C_Suit_02","CUP_U_C_Suit_03",
"CUP_U_C_Functionary_jacket_02","CUP_U_C_Functionary_jacket_01","CUP_U_C_Functionary_jacket_03"];
_dude forceadduniform _uniform;


_vest =  selectrandom [""];
_backpack =  selectrandom [""];

