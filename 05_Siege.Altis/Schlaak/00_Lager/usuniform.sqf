//diag_log ["sovietuniform.sqf called with", _this];
if (!isserver) exitWith {
	diag_log ["not server"];
};

private ["_items","_dude","_uniform","_hat","_rifle","_vest","_vestitems"];

_dude = _this select 0;
if ( isplayer _dude) exitwith {};
if (!isNil {_dude getVariable "Schlaak_Uniform"}) exitWith {};	// Abort function if already called.
if ( isplayer _dude) exitWith {};								// Abort if player
_dude setVariable ["Schlaak_Uniform", 0, false];



_items = uniformItems _dude;
sleep 0.5;
removeUniform _dude;
_vestitems = vestItems _dude;
removevest _dude;
sleep 0.5;


	


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
        _hat = selectRandom ["cwr3_b_headgear_m1_cover_net","cwr3_b_headgear_pasgt_m81_woodland","cwr3_b_headgear_m1_olive",
                            "cwr3_b_headgear_m1_woodland_army_1985","cwr3_b_headgear_m1_cover_net",
                            "cwr3_b_headgear_pasgt_m81_woodland","cwr3_b_headgear_pasgt_m81_woodland",
                            "cwr3_b_headgear_pasgt_m81_woodland","cwr3_b_headgear_pasgt_m81_woodland","cwr3_b_headgear_headband_woodland",
                            "cwr3_b_headgear_pasgt_m81_woodland"];
		
    };

};
_uniform = selectRandom ["cwr3_b_uniform_m81_woodland","cwr3_b_uniform_m81_woodland_rolled","cwr3_b_uniform_og107","cwr3_b_uniform_og107_rolled",
                        "cwr3_b_uniform_m81_woodland","cwr3_b_uniform_m81_woodland"
                        ];




switch (typeOf _dude) do  {
    case "cwr3_b_soldier":      //Rifleman
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_LBV_woodland","cwr3_b_vest_pasgt_LBV_olive","cwr3_b_vest_pasgt_alice_woodland",
        "cwr3_b_vest_alice","cwr3_b_vest_LBV_Alice"];

    };
    case "cwr3_b_soldier_crew": //Crewman
    {
        _vest = selectrandom ["cwr3_b_vest_alice_crew","cwr3_b_vest_pasgt_alice_od_crew","cwr3_b_vest_pasgt_alice_od_crew","cwr3_b_vest_pasgt_alice_od_crew"];

    };
    case "cwr3_b_soldier_mg":      //MG
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_alice_mg"];

    };
    case "cwr3_b_soldier_ar":      //MG - AR
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_alice_mg"];

    };
    case "cwr3_b_soldier_amg":      //MG 2nd
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_alice_mg"];

    };
    case "cwr3_b_soldier_aar":      //MG AR 2nd
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_alice_mg"];

    };
    case "cwr3_b_soldier_aar":      //MG AR 2nd
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_pasgt_alice_woodland_mg","cwr3_b_vest_alice_mg"];

    };
    case "cwr3_b_officer":      //officer
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_alice_officer"];

    };
    case "cwr3_b_officer_night":      //officer
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_alice_officer"];

    };
    case "cwr3_b_soldier_sl":      //officer
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_alice_officer"];

    };
    case "cwr3_b_soldier_tl":      //officer
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_pasgt_alice_woodland_officer","cwr3_b_vest_alice_officer"];

    };
    case "cwr3_b_soldier_medic":    //medic
    {
        _vest = selectrandom ["cwr3_b_vest_pasgt_alice_woodland_medic","cwr3_b_vest_pasgt_alice_woodland_medic","cwr3_b_vest_pasgt_alice_woodland_medic",
        "cwr3_b_vest_alice_medic"]
    };
	default
    {
        _vest = selectrandom ["cwr3_b_vest_LBV_Alice","cwr3_b_vest_alice","cwr3_b_vest_LBV","cwr3_b_vest_pasgt_LBV_olive","cwr3_b_vest_pasgt_LBV_woodland"
        ,"cwr3_b_vest_pasgt_alice_woodland"];
    };
    
    

};

sleep 0.5;
_dude addvest _vest;
{_dude addItemToVest _x	} foreach _vestitems;


removeUniform _dude;
sleep 0.5;
_dude forceAddUniform _uniform;
sleep 0.5;
removeHeadgear _dude;
_dude addheadgear _hat;

sleep 0.5;

{
	_dude addItemToUniform _x
} foreach _items;

sleep 30;
if (true) exitwith {};