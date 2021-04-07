//diag_log ["sovietuniform.sqf called with", _this];
if (!isserver) exitWith {
	diag_log ["not server"];
};

private ["_items","_dude","_uniform","_hat","_rifle","_vest","_vestitems"];

_dude = _this select 0;

_items = uniformItems _dude;
sleep 0.5;
removeUniform _dude;

switch (rank _dude) do
{
    case "CORPORAL":
    {
        _hat = selectRandom ["cwr3_b_headgear_pasgt_m81_woodland"];

    };

    case "SERGEANT":
    {
        _hat = selectRandom ["cwr3_b_headgear_pasgt_m81_woodland_goggles"];

    };

    case "LIEUTENANT":
    {
        _hat = selectRandom ["cwr3_b_headgear_pasgt_m81_woodland_2lt","cwr3_b_headgear_cap_m81_woodland_2lt"];

    };

    case "CAPTAIN":
    {
        _hat = selectRandom ["cwr3_b_headgear_cvc"];

    };

    case "MAJOR":
    {
        _hat = selectRandom ["cwr3_b_headgear_cap_m81_woodland_majgen","cwr3_b_headgear_pasgt_m81_woodland_majgen"];

    };
	default
    {
        _hat = selectRandom ["cwr3_b_headgear_m1_cover_net","cwr3_b_headgear_pasgt_m81_woodland","cwr3_b_headgear_m1_olive","cwr3_b_headgear_m1_woodland_army_1985","cwr3_b_headgear_m1_cover_net"];
		
    };

};
_uniform = selectRandom ["cwr3_b_uniform_m81_woodland","cwr3_b_uniform_m81_woodland_early","cwr3_b_uniform_og107_rolled","cwr3_b_uniform_m81_woodland_gloves"
						,"cwr3_b_uniform_m81_woodland_rolled","cwr3_b_uniform_m81_woodland_rolled_gloves","cwr3_b_uniform_og107_rolled","cwr3_b_uniform_og107"];

sleep 0.5;
if (_dude iskindof "cwr3_b_soldier") then 
	{
	_vest = selectrandom ["cwr3_b_vest_pasgt_LBV_woodland","cwr3_b_vest_pasgt_LBV_olive","cwr3_b_vest_pasgt_alice_woodland","cwr3_b_vest_alice","cwr3_b_vest_LBV_Alice"];
	_vestitems = vestItems _dude;
	removevest _dude;
	_dude addvest _vest;
	{
		_dude addItemToVest _x
	} foreach _vestitems;
	};





removeUniform _dude;
sleep 0.5;
_dude forceAddUniform _uniform;
sleep 0.5;
removeHeadgear _dude;
_dude addheadgear _hat;

sleep 0.5;
/*_rifle = "cwr3_arifle_fnfal_hlag";
removeAllWeapons _dude;
_dude addweapon _rifle;
sleep 0.5;
_magazines = getArray (configFile >> "CfgWeapons" >> primaryWeapon _dude >> "magazines");
_dude addmagazineglobal (_magazines select 0);
_dude addmagazineglobal (_magazines select 0);
_dude addmagazineglobal (_magazines select 0);
_dude addmagazineglobal (_magazines select 0);
*/
{
	_dude addItemToUniform _x
} foreach _items;

