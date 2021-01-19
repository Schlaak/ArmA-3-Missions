//[this, false] execvm "scripts\US.sqf";
//heavy loadout
//[this, true] execvm "scripts\US.sqf";


private ["_dude","_heavy","_Rifle","_RifleMag","_handGrenade","_smokeShell","_item1","_item2","_MG","_MGmag","_AT","_RifleCO","_RifleGRN",
"_pistol","_pistolMag","_rucksack","_rucksack2","_kleidung","_helm","_brille","_role","_weste","_westeMG","_westeCO","_WesteGRN"];
if (isserver) exitWith {};

if (!hasInterface && !isDedicated) then
{




_dude = _this select 0;
_items = uniformItems _dude;
_itemsVest = vestItems _dude;


if (!isPlayer _dude ) then
{




if (!(_dude getVariable ["isSetup", false])) then {
_dude setVariable ["isSetup", true];





_heavy = true;
//_this select 1
sleep (1 + (random 3));





_rucksack = "usm_pack_alice";
_rucksack2 = "usm_pack_m5_medic";

_kleidung = selectRandom ["usm_bdum65_odg","usm_bdum65_wdl3","usm_bdum65_wdl","usm_bdu_bnu_wdl","usm_bdu_bnu_wdl","usm_bdu_bnu_erdl","usm_bdu_srl_wdl","usm_bdu_srl_odg","usm_bdu_srh_wdl","usm_bdu_srh_erdl","usm_bdu_srh_wdl","usm_bdu_srh_wdl","usm_bdu_srl_wdl","usm_bdu_bti_wdl","usm_bdu_bti_wdl","usm_bdu_bti_wdl","usm_bdu_bti_erdl","usm_bdu_bti_odg","usm_bdu_btisrl_wdl","usm_bdu_btisrl_erdl","usm_bdu_btisrl_wdl","usm_bdu_wdl","usm_bdu_odg","usm_bdu_erdl","usm_bdu_wdl"];

_helm = selectrandom ["H_Bandanna_camo","H_Bandanna_gry","","","usm_bdu_8point_wdl","usm_bdu_8point_odg","usm_headwrap_odg2","usm_headwrap_odg1","usm_headwrap_glk","usm_helmet_pasgt_ceswd_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl"];

_brille = selectRandom ["","","usm_giglovesscarf2","","","","","""G_Aviator","","","usm_gigloves","","","","G_Spectacles_Tinted","","G_Aviator","","","","G_Squares"];


_weste = selectRandom ["usm_vest_lbe_rm","usm_vest_lbe_rm2","usm_vest_lbe_rm","usm_vest_lbe_rm2","usm_vest_lbe_rm2","usm_vest_lbe_rmpr"];
_westeMG = "usm_vest_lbe_MG";
_westeCO = "usm_vest_lbe_rmpr";
_WesteGRN = "usm_vest_lbe_gr";


/*
===========HEAVY DUDE===========
*/
if (_heavy) then {


_weste = selectRandom ["usm_vest_pasgt_lbe_rm","usm_vest_pasgt_lbe_rm2","usm_vest_pasgt_lbe_MG","usm_vest_pasgt_lbe_rmpr"];
_westeMG = "usm_vest_pasgt_lbe_MG";
_westeCO = "usm_vest_pasgt_lbe_rmpr";
_WesteGRN = "usm_vest_pasgt_lbe_gr";
};





removeUniform _dude;
removeVest _dude;

removeHeadgear _dude;
removeGoggles _dude;



_dude forceAddUniform _kleidung;

_waffe = primaryWeapon _dude;

switch (_waffe) do
{
    case "LMG_SUD_M60":
    {
        _dude addvest _westeMG;
    };
    case "arifle_SUD_M16_GL":
    {
        _dude AddVest _WesteGRN;
    };
    default
    {
        _dude AddVest _weste;
    };
};
_dude addheadgear _helm;
_dude addgoggles _brille;

{_dude addItemToUniform _x} foreach _items;
{_dude addItemToVest _x} foreach _itemsVest;
};

};
};