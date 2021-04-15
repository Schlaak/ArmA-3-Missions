class CfgRoles
{
	class Assault
	{
		displayName = $STR_A3_Role_Assault;
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa";
	};
	class Support
	{
		displayName = $STR_A3_Role_Support;
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa";
	};
	class Recon
	{
		displayName = $STR_A3_Role_Recon;
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa";
	};
    class AT
    {
		displayName = "Anti-Tank";
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa";
	};
    class MG
    {
		displayName = "Machinegunner";
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa";
	};
    class Med
    {
		displayName = "Medic";
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa";
	};
    class Rifle
    {
		displayName = "Riflemen";
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa";
	};
    class Lead
    {
		displayName = "Leader";
		icon = "a3\Ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa";
	};
};



class CfgRespawnInventory
{
		class B_CWR_Rifleman
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "Rifle";	
		vehicle = "cwr3_b_soldier"
	};
    	class B_CWR_TL
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "lead";	
		vehicle = "cwr3_b_soldier_tl"
	};
        	class B_CWR_SL
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "lead";	
		vehicle = "cwr3_b_soldier_sl"
	};
        	class B_CWR_ATlaw
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "Rifle";	
		vehicle = "cwr3_b_soldier_at_law"
	};
        	class B_CWR_MG
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "MG";	
		vehicle = "cwr3_b_soldier_mg"
	};
        	class B_CWR_medic
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "Rifle";	
		vehicle = "cwr3_b_soldier_crew"
	};
        	class B_CWR_crew
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "Rifle";	
		vehicle = "cwr3_b_soldier_ar"
	};
        	class B_CWR_ar
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "Rifle";	
		vehicle = "cwr3_b_soldier_ar"
	};
        	class B_CWR_AA
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "Rifle";	
		vehicle = "cwr3_b_soldier_aa_stinger"
	};
        	class B_CWR_ATcarl
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "AT";	
		vehicle = "cwr3_b_soldier_at_carlgustaf"
	};
        	class B_CWR_M47
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "AT";	
		vehicle = "cwr3_b_soldier_at_m47"
	};
        	class B_CWR_AMG
	{
		// Alternative configuration pointing to a CfgVehicles class. Loadout will be copied from it.
        role = "Rifle";	
		vehicle = "cwr3_b_soldier_amg"
	};

        class O_CWR_TL
        {
            role = "lead";	
            vehicle = "cwr3_o_soldier_tl"
        };
        class O_CWR_SL
        {
            role = "lead";	
            vehicle = "cwr3_o_soldier_sl"
        };
        class O_CWR_ATrpg18
        {
            role = "Rifle";	
            vehicle = "cwr3_o_soldier_at_rpg18"
        };
        class O_CWR_RMbckpck
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier_backpack"
            };
        class O_CWR_RM
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier"
            };
        class O_CWR_Medic
            {
                role = "MED";	
                vehicle = "cwr3_o_soldier_medic"
            };
        class O_CWR_DMR
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier_marksman"
            };
        class O_CWR_MG
            {
                role = "MG";	
                vehicle = "cwr3_o_soldier_mg"
            };
        class O_CWR_crew
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier_crew"
            };
        class O_CWR_crewAPC
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier_crew_apc"
            };
        class O_CWR_AR
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier_ar"
            };
        class O_CWR_AT4
            {
                role = "AT";	
                vehicle = "cwr3_o_soldier_at_at4"
            };
        class O_CWR_RPG7
            {
                role = "AT";	
                vehicle = "cwr3_o_soldier_at_rpg7"
            };
        class O_CWR_igla
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier_aa_igla"
            };
        class O_CWR_strela
            {
                role = "Rifle";	
                vehicle = "cwr3_o_soldier_aa_strela"
            };
};




