//diag_log ["sovietuniform.sqf called with", _this];
if (!isserver) exitWith {
	diag_log ["not server"];
};

private ["_items","_dude","_uniform","_hat","_rifle","_vest","_vestitems"];
if ( isplayer _dude) exitwith {};
_dude = _this select 0;

_items = uniformItems _dude;
sleep 0.5;
removeUniform _dude;

switch (rank _dude) do
{
    case "CORPORAL":
    {
        _hat = selectRandom ["cwr3_i_headgear_beret_02_black_fia"];

    };

    case "SERGEANT":
    {
        _hat = selectRandom ["cwr3_i_headgear_beret_01_brown_fia"];

    };

    case "LIEUTENANT":
    {
        _hat = selectRandom ["cwr3_i_headgear_beret_02_headset_green_fia","cwr3_i_headgear_beret_02_headset_black_fia"];

    };

    case "CAPTAIN":
    {
        _hat = selectRandom ["cwr3_i_headgear_beret_01_blue_fia"];

    };

    case "MAJOR":
    {
        _hat = selectRandom ["cwr3_i_headgear_leather_hat"];

    };
	default
    {
        _hat = selectRandom ["cwr3_i_headgear_parahelmet_black","cwr3_i_headgear_parahelmet_olive_net","cwr3_i_headgear_parahelmet_olive","cwr3_i_headgear_parahelmet_camo",
		"cwr3_i_headgear_cap_p60","cwr3_i_headgear_cap_steingrau","cwr3_i_headgear_boonie_rolled_p60"];
		
    };

};
_uniform = selectRandom ["cwr3_i_uniform_steingrau_mol","cwr3_i_uniform_mol_p60"];


_vest = "cwr3_i_vest_58webbing";
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

sleep 0.5;
_rifle = "cwr3_arifle_fnfal_hlag";
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