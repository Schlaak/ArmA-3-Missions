//diag_log ["sovietuniform.sqf called with", _this];
if (!isserver) exitWith {
	diag_log ["not server"];
};

private ["_items","_dude","_uniform"];




_dude = _this select 0;
if ( isplayer _dude) exitwith {};


_vestitems = vestItems _dude;
_items = uniformItems _dude;
removevest _dude;
removeUniform _dude;
removeheadgear _dude;
sleep 0.5;
_hat = selectRandom ["cwr3_o_headgear_ssh68_net","cwr3_o_headgear_ssh68_cover","cwr3_o_headgear_ssh68_cover_klmk","cwr3_o_headgear_ssh68_camo",
"cwr3_o_headgear_ssh68_camo","cwr3_o_headgear_ssh68","CUP_H_RUS_SSH68_olive","CUP_H_RUS_SSH68_cover_vsr93","CUP_H_RUS_SSH68_cover_berezka","CUP_H_RUS_SSH68_green"];
//===================================
// Do give headgear according to rank
//===================================
switch (rank _dude) do
{
    case "CORPORAL":
    {
        _hat = selectRandom ["cwr3_o_headgear_fieldcap_m1982"];
		//cwr3_o_headgear_fieldcap_ttsko

    };

    case "SERGEANT":
    {
        _hat = selectRandom ["cwr3_o_beret_vdv"];
		// VMF cwr3_o_beret_vmf
      _vest = "CUP_V_RUS_6B3_1";
    };

    case "LIEUTENANT":
    {
        _hat = selectRandom ["cwr3_o_ushanka"];
        _vest = "CUP_V_RUS_6B3_1";
    };

    case "CAPTAIN":
    {
        _hat = selectRandom ["cwr3_o_headgear_officer_cap_field"];
        _vest = "CUP_V_RUS_6B3_1";
    };

    case "MAJOR":
    {
        _hat = selectRandom ["cwr3_o_headgear_officer_cap_field"];
        _vest = "CUP_V_RUS_6B3_1";
    };
	default
    {
        _hat = selectRandom ["cwr3_o_headgear_ssh68_net","cwr3_o_headgear_ssh68_cover","cwr3_o_headgear_ssh68_cover_klmk","cwr3_o_headgear_ssh68_camo",
		"cwr3_o_headgear_ssh68_camo","cwr3_o_headgear_ssh68","CUP_H_RUS_SSH68_olive","CUP_H_RUS_SSH68_cover_vsr93","CUP_H_RUS_SSH68_cover_berezka","CUP_H_RUS_SSH68_green"];

    };

};


_uniform = selectRandom ["cwr3_o_uniform_m1982_ttsko","cwr3_o_uniform_m1982_ttsko","cwr3_o_uniform_m1982_rolled_ttsko"];
_vest = selectrandom ["cwr3_o_vest_6b2_chicom_ak74","cwr3_o_vest_6b2_ak74","cwr3_o_vest_6b2_chicom_ak74","cwr3_o_vest_harness_ak74","cwr3_o_vest_harness_ak74","cwr3_o_vest_harness_ak74","cwr3_o_vest_chicom_beltkit_ak74","cwr3_o_vest_chicom_beltkit_light_ak74"];
//_hat = selectrandom ["cwr3_o_headgear_ssh68","cwr3_o_headgear_ssh68_camo","cwr3_o_headgear_ssh68_cover_klmk","cwr3_o_headgear_ssh68_cover","cwr3_o_headgear_ssh68_net","CUP_H_RUS_SSH68_cover_vsr93","CUP_H_RUS_SSH68_cover_vsr98",
//"CUP_H_RUS_SSH68_cover_vsr84_dubok","CUP_H_RUS_SSH68_olive","CUP_H_RUS_SSH68_green","CUP_H_RUS_SSH68_cover_berezka"];
//===================================
// Do give Vest according to role 
//===================================


switch (typeOf _dude) do  {
    case "cwr3_o_soldier":      //Rifleman
    {
      _vest = selectrandom ["cwr3_o_vest_6b2_chicom_ak74","cwr3_o_vest_6b2_ak74","cwr3_o_vest_6b2_chicom_ak74","cwr3_o_vest_harness_ak74","cwr3_o_vest_harness_ak74","cwr3_o_vest_harness_ak74","cwr3_o_vest_chicom_beltkit_ak74","cwr3_o_vest_chicom_beltkit_light_ak74"];
    };
    case "cwr3_o_soldier_amg":      //MG AMG
    {

    };
    case "cwr3_o_soldier_mg":      //MG
    {

    };
    case "cwr3_o_soldier_medic":      //MEDIC
    {

    };
    case "cwr3_o_officer":      //OFFICER
    {
		_vest = "CUP_V_RUS_6B3_1";
    };
    case "cwr3_o_soldier_sl":      //OFFICER SL
    {
		_vest = "CUP_V_RUS_6B3_1";
    };
    case "cwr3_o_officer_night":      //OFFICER Night
    {	
		_vest = "CUP_V_RUS_6B3_1";
    };
    case "cwr3_o_soldier_crew":      //CREW
    {
		_uniform = "cwr3_o_uniform_m1982_tanker";
		_vest = selectRandom ["cwr3_o_vest_beltkit_ak74","cwr3_i_vest_ammo_pouch","cwr3_o_vest_beltkit_officer","cwr3_o_vest_beltkit_rd54"];
		_hat = selectrandom ["cwr3_o_headgear_tsh3","CUP_H_TK_TankerHelmet"];
    };
    case "cwr3_o_soldier_crew_apc":    //CREW APC
    {
		_uniform = "cwr3_o_uniform_m1982_apc";
		_vest = selectRandom ["cwr3_o_vest_beltkit_ak74","cwr3_i_vest_ammo_pouch","cwr3_o_vest_beltkit_officer","cwr3_o_vest_beltkit_rd54"];
		_hat = selectrandom ["cwr3_o_headgear_tsh3","CUP_H_TK_TankerHelmet"];
    };
	default
    {
		//_uniform = selectRandom ["cwr3_o_uniform_m1982","cwr3_o_uniform_m1982_rolled"];
		// M1982 uniform
		_uniform = selectRandom ["cwr3_o_uniform_m1982_ttsko","cwr3_o_uniform_m1982_ttsko","cwr3_o_uniform_m1982_rolled_ttsko"];
    };
    
    

};
//===================================
// Give em the stuff 
//===================================


sleep 0.5;


_dude forceAddUniform _uniform;
sleep 0.5;
{
	_dude addItemToUniform _x
} foreach _items;
sleep 0.5;
_dude addvest _vest;
{_dude addItemToVest _x	} foreach _vestitems;
_dude addheadgear _hat;
sleep 30;
if (true) exitwith {};