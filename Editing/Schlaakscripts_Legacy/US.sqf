//[this, false] execvm "scripts\US.sqf";
//heavy loadout
//[this, true] execvm "scripts\US.sqf";


private ["_dude","_heavy","_Rifle","_RifleMag","_handGrenade","_smokeShell","_item1","_item2","_MG","_MGmag","_AT","_RifleCO","_RifleGRN",
"_pistol","_pistolMag","_rucksack","_rucksack2","_kleidung","_helm","_brille","_role","_weste","_westeMG","_westeCO","_WesteGRN"];
if (!isserver) exitWith {};

_dude = _this select 0;
_heavy = true;
//_this select 1
sleep (1 + (random 3));
_Rifle = selectRandom ["arifle_SUD_M16"];
_RifleMag = "SUD_30Rnd_556x45_Stanag";
_handGrenade = "HandGrenade";
_smokeShell = "SmokeShell";
_item1 = "usm_fielddressing";
_item2 = selectrandom ["usm_lc2canteen","usm_mre","usm_etool"];

_MG = "LMG_SUD_M60";
_MGmag = "SUD_100Rnd_762x51_M60";
_AT = "launch_SUD_CarlGustaf";
_RifleCO = "arifle_SUD_M16_GL";
_RifleGRN = "arifle_SUD_M16_GL";
_pistol = "usm_flashlight";
_pistolMag = "";

_rucksack = "usm_pack_alice";
_rucksack2 = selectrandom ["","","","","","","","","","","","","usm_pack_m5_medic"];

_kleidung = selectRandom ["usm_bdum65_odg","usm_bdum65_wdl3","usm_bdum65_wdl","usm_bdu_bnu_wdl","usm_bdu_bnu_wdl","usm_bdu_bnu_erdl","usm_bdu_srl_wdl","usm_bdu_srl_odg","usm_bdu_srh_wdl","usm_bdu_srh_erdl","usm_bdu_srh_wdl","usm_bdu_srh_wdl","usm_bdu_srl_wdl","usm_bdu_bti_wdl","usm_bdu_bti_wdl","usm_bdu_bti_wdl","usm_bdu_bti_erdl","usm_bdu_bti_odg","usm_bdu_btisrl_wdl","usm_bdu_btisrl_erdl","usm_bdu_btisrl_wdl","usm_bdu_wdl","usm_bdu_odg","usm_bdu_erdl","usm_bdu_wdl"];

_helm = selectrandom ["H_Bandanna_camo","H_Bandanna_gry","","","usm_bdu_8point_wdl","usm_bdu_8point_odg","usm_headwrap_odg2","usm_headwrap_odg1","usm_headwrap_glk","usm_helmet_pasgt_ceswd_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_m1_wdl","usm_helmet_m1v2_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl","usm_helmet_pasgt_ceswd_wdl"];

_brille = selectRandom ["","","usm_giglovesscarf2","","","","","""G_Aviator","","","usm_gigloves","","","","G_Spectacles_Tinted","","G_Aviator","","","","G_Squares"];

_role = selectrandom [0,0,0,0,0,1,0,1,0,1,0,2,0,2,2,2,1,2,1,0,0,0,0,0,0,0,0,0,0,3,3,4,4,4];
/*
===========light DUDE===========
*/
_weste = selectRandom ["usm_vest_lbe_rm","usm_vest_lbe_rm2","usm_vest_lbe_rm","usm_vest_lbe_rm2","usm_vest_lbe_rm2","usm_vest_lbe_rmpr"];
_westeMG = "usm_vest_lbe_MG";
_westeCO = "usm_vest_lbe_rmpr";
_WesteGRN = "usm_vest_lbe_gr";


/*
===========HEAVY DUDE===========
*/
if (_heavy) then {


_weste = selectRandom ["usm_vest_pasgt_lbe_rm","usm_vest_pasgt_lbe_rm2"];
_westeMG = "usm_vest_pasgt_lbe_MG";
_westeCO = "usm_vest_pasgt_lbe_rmpr";
_WesteGRN = "usm_vest_pasgt_lbe_gr";
};



removeAllWeapons _dude;
removeAllItems _dude;
removeAllAssignedItems _dude;
removeUniform _dude;
removeVest _dude;
removeBackpack _dude;
removeHeadgear _dude;
removeGoggles _dude;
_dude forceAddUniform _kleidung;
switch (_role) do
{


    // ================================
    case 0:		//Gunner
    {
    	_dude addweapon _Rifle;
        _dude addvest _weste;
    	_dude addPrimaryWeaponItem _RifleMag;
    	_dude addmagazine _RifleMag;
    	_dude addmagazine _RifleMag;
    	_dude addmagazine _RifleMag;
    	_dude addmagazine _RifleMag;
        _dude additem _item2;
        _dude additem _item1;
        _dude additem _item1;
        _dude addBackpack _rucksack2;

    };


    // ================================
    case 1:		//MG
    {
        _dude addweapon _MG;
        _dude addvest _westeMG;
                _dude addPrimaryWeaponItem _MGmag;
        _dude addbackpack _rucksack;
        _dude addmagazine _MGmag;
        _dude addmagazine _MGmag;
        _dude addmagazine _MGmag;
        _dude addmagazine _MGmag;
        _dude addmagazine _MGmag;
        _dude additem _item2;
        _dude additem _item1;
        _dude additem _item1;

    };


    // ================================
    case 2:		//LAT
    {
        _dude addweapon _Rifle;
        _dude addweapon _AT;
        _dude addvest _weste;
        _dude addPrimaryWeaponItem _RifleMag;
        _dude addmagazine "SUD_HEAT751";
        _dude addmagazine _RifleMag;
        _dude addmagazine _RifleMag;
        _dude addmagazine _RifleMag;
        _dude addmagazine _RifleMag;
        _dude additem _item2;
        _dude additem _item1;
        _dude additem _item1;
    };


    // ================================
    case 3:     //GREN
    {
        _dude addweapon _RifleGRN;
        _dude addvest _WesteGRN;
        _dude addPrimaryWeaponItem _RifleMag;
        _dude addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
        _dude addmagazine _RifleMag;
        _dude addmagazine _RifleMag;
        _dude addmagazine _RifleMag;
        _dude addmagazine _RifleMag;
        _dude addMagazines ["SUD_1Rnd_HE_M203",8];
        _dude additem _item2;
        _dude additem _item1;
        _dude additem _item1;

    };


    // ================================
    case 4:     //officer
    {


        _dude addWeapon _RifleCO;
        _dude addPrimaryWeaponItem _RifleMag;
        _dude addmagazine _RifleMag; _dude addmagazine _RifleMag; _dude addmagazine _RifleMag;
        _dude addmagazine _RifleMag;
        _dude addHandgunItem "";


        _dude addMagazine "SUD_1rnd_FlareWhite_M203";
        _dude addMagazine "SUD_1Rnd_HE_M203"; _dude addMagazine "SUD_1Rnd_HE_M203";
        _dude addMagazine "SUD_1rnd_FlareWhite_M203"; _dude addMagazine "SUD_1rnd_FlareWhite_M203";

        _dude addVest "usm_vest_pasgt_lbe_rmpr";


        _dude addmagazine _handGrenade; _dude addmagazine _handGrenade;
        _dude addmagazine _smokeShell; _dude addmagazine _smokeShell; _dude addmagazine _smokeShell;


        _dude addWeapon _pistol;
        _dude addHandgunItem _pistolMag;



        _dude assignitem "itemmap";
        _dude assignitem "itemradio";
        _dude linkItem "ItemMap";
    };
};
_dude addgoggles _brille;


_dude linkItem "ItemCompass";



_dude addHeadgear _helm;
if ((backpack _dude) != nil) then
{
    _dude addItemToBackpack _item1; _dude addItemToBackpack _item1; _dude addItemToBackpack _item1; _dude addItemToBackpack _RifleMag; _dude addItemToBackpack _RifleMag; _dude addItemToBackpack _RifleMag;
    _dude addItemToBackpack _item2;
};
exit;
