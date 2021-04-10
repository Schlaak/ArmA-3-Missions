//=================================
//Assets
//=================================

class CfgWLRequisitionPresets
{
	class CWR3 // --- class name used in the Init module
	{
		class WEST // --- assets available for BLUFOR
		{
			class Infantry
			{

                class cwr3_b_soldier_aa_stinger
                {
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_at_m47
            	{
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_at_carlgustaf
                {
					cost = 70; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_ar
                {
					cost = 60; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_crew
                {
					cost = 50; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_gl
                {
					cost = 50; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_mg
                {
					cost = 45; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_marksman
                {
					cost = 100; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_medic
                {
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier
                {
					cost = 25; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_at_law
                {
					cost = 50; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_sl
               {
					cost = 100; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_b_soldier_tl
                {
					cost = 50; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};

			};
			class Vehicles
			{
				class cwr3_b_m151_m2
				{
					cost = 75;
					requirements[] = {};
                    };
                class cwr3_b_hmmwv
                    {
                        cost = 100;
                        requirements[] = {};
                    };
                class cwr3_b_hmmwv_mev
                    {
                        cost = 100;
                        requirements[] = {};
                    };
                class cwr3_b_hmmwv_transport
                    {
                        cost = 120;
                        requirements[] = {};
                    };
                class cwr3_b_hmmwv_m2
                    {
                        cost = 150;
                        requirements[] = {};
                    };
                class cwr3_b_hmmwv_tow
                    {
                        cost = 175;
                        requirements[] = {};
                    };
                class cwr3_b_m151
                    {
                        cost = 50;
                        requirements[] = {};
                    };
                class cwr3_b_m939_open
                    {
                        cost = 200;
                        requirements[] = {};
                    };
                class cwr3_b_m939_refuel
                    {
                        cost = 250;
                        requirements[] = {};
                    };
                class cwr3_b_m939_repair
                    {
                        cost = 250;
                        requirements[] = {};
                    };
                class cwr3_b_m939
                    {
                        cost = 200;
                        requirements[] = {};
                    };
                class cwr3_b_m163
                    {
                        cost = 1200;
                        requirements[] = {};
                    };
                class cwr3_b_m113a1
                    {
                        cost = 450;
                        requirements[] = {};
                    };
                class cwr3_b_m113a1_mev
                    {
                        cost = 400;
                        requirements[] = {};
                    };
                class cwr3_b_m113a3
                    {
                        cost = 500;
                        requirements[] = {};
                    };
                class cwr3_b_m113a3_mev
                    {
                        cost = 450;
                        requirements[] = {};
                    };
                class cwr3_b_m2a2
                    {
                        cost = 800;
                        requirements[] = {};
                    };
                class cwr3_b_m60a3
                    {
                        cost = 1000;
                        requirements[] = {};
                    };
                class cwr3_b_m1a1
                    {
                        cost = 2500;
                        requirements[] = {"H"};
                    };
                };
			class Aircraft
			{
				class cwr3_b_a10
                {
					cost = 7500;
					requirements[] = { "A" };
				};
                class cwr3_b_a10_cas
                {
					cost = 7500;
					requirements[] = { "A" };
				};
                class cwr3_b_a10_lgb
				{
					cost = 7500;
					requirements[] = { "A" };
				};
                class cwr3_b_ah64_hellfire
                {
					cost = 4500;
					requirements[] = { "H" };
				};
                class cwr3_b_ah64
                {
					cost = 4300;
					requirements[] = { "H" };
				};
                class cwr3_b_ah1f
                {
					cost = 3500;
					requirements[] = { "H" };
				};
                class cwr3_b_ch47
                {
					cost = 2000;
					requirements[] = { "H" };
				};                
                class cwr3_b_oh58
                {
					cost = 1200;
					requirements[] = { "H" };
				};
                class cwr3_b_uh1_slick
                {
					cost = 2200;
					requirements[] = { "H" };
				};
                class cwr3_b_uh1_gunship
                {
					cost = 2200;
					requirements[] = { "H" };
				};
                class cwr3_b_uh1
                {
					cost = 2000;
					requirements[] = { "H" };
				};                
                class cwr3_b_uh1_mev
                {
					cost = 2000;
					requirements[] = { "H" };
				};                
                class cwr3_b_uh60_unarmed_ffv
                {
					cost = 3600;
					requirements[] = { "H" };
				};
                class cwr3_b_uh60_ffv
                {
					cost = 4000;
					requirements[] = { "H" };
				};                
                class cwr3_b_uh60_mev
                {
					cost = 3600;
					requirements[] = { "H" };
				};
			};
			class Naval
			{
				class cwr3_b_zodiac
				{
					cost = 100;
					requirements[] = { "W" };
				};
                class cwr3_b_boat
                {
					cost = 300;
					requirements[] = { "W" };
				};
			};
			class Gear
			{
                class cwr3_crate_basicammo_us
                {
					cost = 200;
					requirements[] = {};
				};
                class cwr3_crate_basicweapons_us
                {
					cost = 200;
					requirements[] = {};
				};
                class cwr3_crate_launchers_us
                {
					cost = 50;
					requirements[] = {};
				};
                class cwr3_crate_specialweapons_us
                {
					cost = 300;
					requirements[] = {};
				};
			};
			class Defences
			{
                class cwr3_b_m252
                {
                    cost = 500;
                    requirements[] = {};
                };
                class cwr3_b_m2hb_high
                    {
                    cost = 250;
                    requirements[] = {};
                };
                class cwr3_b_m2hb_low
                {
                    cost = 250;
                    requirements[] = {};
                };
                class cwr3_b_mk19
                {
                    cost = 800;
                    requirements[] = {};
                };
                class cwr3_b_tow
                {
                    cost = 500;
                    requirements[] = {};
                };
			};
		};
		class EAST // --- assets available for OPFOR
		{
			// --- rest of input
            class Infantry
			{
                class cwr3_o_soldier
                {
					cost = 15; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_aa_igla
                {
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_aa_strela
                {
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_at_at4
                {
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_at_rpg7
                {
					cost = 50; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_ar
                {
					cost = 100; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_crew
                {
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_crew_apc
                {
					cost = 75; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_gl
                {
					cost = 100; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_medic
                {
					cost = 50; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_marksman
                {
					cost = 60; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_at_rpg18
                {
					cost = 30; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_sl
                {
					cost = 50; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
                class cwr3_o_soldier_tl
                {
					cost = 25; // --- Command Points required
					requirements[] = {}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
				};
            };
            class Vehicles
            {
                class cwr3_o_t72b1

                {
                    cost = 1800;
					requirements[] = { "H" };
				};
                class cwr3_o_t72a
                {
                    cost = 1500;
					requirements[] = { "H" };
				};
                class cwr3_o_t64bv
                {
                    cost = 1000;
					requirements[] = { "H" };
				};
                class cwr3_o_t64b
                {
                    cost = 1000;
					requirements[] = {};
				};
                class cwr3_o_t55a
                {
                    cost = 800;
					requirements[] = {};
				};
                class cwr3_o_t55
                {
                    cost = 800;
					requirements[] = {};
				};
                class cwr3_o_bmp1
                {
                    cost = 600;
					requirements[] = {};
				};
                class cwr3_o_bmp1p
                {
                    cost = 650;
					requirements[] = {};
				};
                class cwr3_o_bmp2
                {
                    cost = 700;
					requirements[] = {};
				};
                class cwr3_o_bmp2_mev
                {
                    cost = 650;
					requirements[] = {};
				};
                class cwr3_o_brdm2
                {
                    cost = 400;
					requirements[] = {};
				};
                class cwr3_o_brdm2_atgm
                {
                    cost = 500;
					requirements[] = {};
				};
                class cwr3_o_brdm2um
                {
                    cost = 350;
					requirements[] = {};
				};
                class cwr3_o_btr60
                {
                    cost = 350;
					requirements[] = {};
				};
                class cwr3_o_btr80
                {
                    cost = 450;
					requirements[] = {};
				};
                class cwr3_o_mtlb_pk
                {
                    cost = 300;
					requirements[] = {};
				};
                class cwr3_o_mtlb_mev
                {
                    cost = 300;
					requirements[] = {};
				};
                class cwr3_o_mtlb_repair
                {
                    cost = 500;
					requirements[] = {};
				};
                class cwr3_o_bmp2_zu23
                {
                    cost = 1200;
					requirements[] = { "H" };
				};
                class cwr3_o_mtlb_sa13
                {
                    cost = 800;
					requirements[] = {};
				};
                class cwr3_o_uaz_aa
                {
                    cost = 500;
					requirements[] = {};
				};
                class cwr3_o_ural_zu23
                {
                    cost = 1000;
					requirements[] = {};
				};
                class cwr3_o_zsu
                {
                    cost = 1500;
					requirements[] = {};
				};
                class cwr3_o_uaz
                {
                    cost = 75;
					requirements[] = {};
				};
                class cwr3_o_uaz_dshkm
                {
                    cost = 100;
					requirements[] = {};
				};
                class cwr3_o_uaz_spg9
                {
                    cost = 150;
					requirements[] = {};
				};
                class cwr3_o_ural
                {
                    cost = 150;
					requirements[] = {};
				};
                class cwr3_o_ural_refuel
                {
                    cost = 250;
					requirements[] = {};
				};
                class cwr3_o_ural_repair
                {
                    cost = 300;
					requirements[] = {};
				};
                class cwr3_o_ural_open
                {
                    cost = 150;
					requirements[] = {};
				};
                class cwr3_o_uaz_mev
                {
                    cost = 200;
					requirements[] = {};
				};

            };
            class Aircraft
            {
                class cwr3_o_v80
                {
					cost = 5000;
					requirements[] = { "H" };
				};
                class cwr3_o_mi8_mtv3
                {
					cost = 3000;
					requirements[] = { "H" };
				};
                class cwr3_o_mi8_mev
                {
					cost = 2000;
					requirements[] = { "H" };
				};
                class cwr3_o_mi8_amt
                {
					cost = 2000;
					requirements[] = { "H" };
				};
                class cwr3_o_mi24v
                {
					cost = 3600;
					requirements[] = { "H" };
				};
                class cwr3_o_mi24p
                {
					cost = 3600;
					requirements[] = { "H" };
				};
                class cwr3_o_mi24d
                {
					cost = 3600;
					requirements[] = { "H" };
				};
                class cwr3_o_an2
                {
					cost = 700;
					requirements[] = { "A" };
				};
                class cwr3_o_su25
                {
					cost = 4000;
					requirements[] = { "A" };
				};
                class cwr3_o_su25_lgb
                {
					cost = 4000;
					requirements[] = { "A" };
				};
            };
            class Naval
            {
                class cwr3_o_boat

                {
					cost = 300;
					requirements[] = { "W" };
				};
                class cwr3_o_zodiac
                {
					cost = 50;
					requirements[] = { "W" };
				};
            };
            class Gear
            {
                class cwr3_crate_basicammo_ru
                {
					cost = 50;
					requirements[] = {};
				};
                class cwr3_crate_basicweapons_ru
                {
					cost = 75;
					requirements[] = {};
				};
                class cwr3_crate_explosives_ru
                {
					cost = 50;
					requirements[] = {};
				};
                class cwr3_crate_grenades_ru
                {
					cost = 50;
					requirements[] = {};
				};
                class cwr3_crate_launchers_ru
                {
					cost = 50;
					requirements[] = {};
				};
                class cwr3_crate_support_ru
                {
					cost = 300;
					requirements[] = {};
				};
                class cwr3_crate_uniforms_ru
                {
					cost = 50;
					requirements[] = {};
				};
            };
            class Defences
            {
                class cwr3_o_d30_at
                {
					cost = 1000;
					requirements[] = { "H"};
				};
                class cwr3_o_konkurs_tripod
                {
					cost = 250;
					requirements[] = {};
				};
                class cwr3_o_nsv_high
                {
					cost = 75;
					requirements[] = {};
				};
                class cwr3_o_nsv_low
                {
					cost = 75;
					requirements[] = {};
				};
                class cwr3_o_spg9
                {
					cost = 100;
					requirements[] = {};
				};
                class cwr3_o_zu23
                {
					cost = 400;
					requirements[] = { "H" };
				};
            };
		};
	};
};
//=================================
//Factions
//=================================
class CfgWLFactionAssets
{
	class WEST // --- BLUFOR
	{
		class InfantryUnits // --- for BLUFOR and OPFOR, only individual unit classnames are defined as the system doesn't spawn predefined groups
		{
			class cwr3_b_soldier_mg {}; // --- asset classname to be added to the spawn list
            class cwr3_b_soldier_at_law {};
            class cwr3_b_soldier {};
            class cwr3_b_soldier_tl {};
		};
	};
	class EAST // --- OPFOR
	{
		class InfantryUnits
		{
            class cwr3_o_soldier {};
            class cwr3_o_soldier_at_rpg18 {};
            class cwr3_o_soldier_tl {};
            class cwr3_o_soldier_mg {};
		};
	};
	class INDEP // --- Independent
	{
		class InfantryGroups // --- independent faction uses group configs to spawn garrisons; you can define various group types to be randomly used
		{
			groups[] = {
				"'Indep' >> 'IND_G_F' >> 'Infantry'>> 'cwr3_fia' >> 'Infantry' >> 'cwr3_i_at_team'", // --- use this part of the config path found in the Config viewer (CfgGroups)
				"'Indep' >> 'IND_G_F' >> 'Infantry'>> 'cwr3_fia' >> 'Infantry' >> 'cwr3_i_fire_team'", // --- NOTE THE QUOTATION MARKS AND APOSTROPHES
                "'Indep' >> 'IND_G_F' >> 'Infantry'>> 'cwr3_fia' >> 'Infantry' >> 'cwr3_i_mg_team'"
            };
		};
		class MotorizedGroups
		{
			groups[] = {
				
			};
		};
		class MechanizedGroups
		{
			groups[] = {
				
			};
		};
		class ArmoredGroups
		{
			groups[] = {
				
			};
		};
	};
};

//=================================
//Blacklisting
//=================================
WLAIRequisitonBlacklist[] = {
	"B_crew_F",
	"B_Helipilot_F",
	"B_Pilot_F",
	"O_crew_F",
	"O_Helipilot_F",
	"O_Pilot_F",
	"B_T_crew_F",
	"B_T_Helipilot_F",
	"B_T_Pilot_F",
	"O_T_crew_F",
	"O_T_Helipilot_F",
	"O_T_Pilot_F"
};
//=================================
//Assetcosts
//=================================
class CfgWLAssetCostOverride
{
    /*
	B_Soldier_F = 50;		// --- example asset classname
	Scan = 200;				// --- sector scan
	Airdrop = 200;			// --- airdrop
	FastTravel = 200;		// --- fast travel
	LastLoadout = 200;		// --- last loadout
	Arsenal = 200;			// --- arsenal
	FundsTransfer = 200;	// --- funds transfer
	ResetVoting = 200;		// --- voting reset
    */

};