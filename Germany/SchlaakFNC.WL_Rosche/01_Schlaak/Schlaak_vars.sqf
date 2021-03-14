//=================================
// SCHLAAK DIPLOMACY
//=================================
Schlaak_Playerside = west;		//define playerside
Schlaak_Hostiles = East;		//define oposing forces
Schlaak_Afghanmode = false;		//is it in Afghanistan?


diag_log "SCHLAAK_VARS.SQF: Diplomacy defined";
systemchat "SCHLAAK_VARS.SQF: Diplomacy defined";
//=================================
// SCHLAAK GROUPS
//=================================
switch (Schlaak_Playerside) do
{
    case east:
    {
		if (Schlaak_Afghanmode == true) then
		{
			
			//Mechanized
			O_grpMech1 = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Motorized" >> "CUP_I_TK_GUE_MotorizedPatrol");
			O_grpMech2 = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Mechanized" >> "CUP_I_TK_GUE_MechanizedGroup");
			O_grpMech3 = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Motorized" >> "CUP_I_TK_GUE_MotorizedPatrol");
			O_grpMech4 = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Mechanized" >> "CUP_I_TK_GUE_MechanizedPatrol");
			//motorized
			O_grpmot1 = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Motorized" >> "CUP_I_TK_GUE_MotorizedPatrol");
			// infantry
			O_grpATteam = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_ATTeam");
			O_grpFTeam = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_Patrol");
			O_grpMGteam = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_GroupWeapons");
			O_grpRFsqd = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_Group");
			O_grpSupportteam = (configfile >> "CfgGroups" >> "indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_GroupWeapons");
			//Arrays to select random from
		}
		else
		{
			//Mechanized
			O_grpMech1 = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Mechanized" >> "cwr3_b_mechanized_infantry_m2a2");
			O_grpMech2 = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Mechanized" >> "cwr3_i_mechanized_infantry_m113");
			O_grpMech3 = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Mechanized" >> "cwr3_i_mechanized_infantry_m113");
			O_grpMech4 = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Mechanized" >> "cwr3_b_mechanized_infantry_m2a2");

			//motorized
			O_grpmot1 = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Motorized" >> "cwr3_b_motorized_squad");
			O_grpmot2 = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Motorized" >> "cwr3_b_motorized_section_at");
			O_grpmot3 = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Motorized" >> "cwr3_b_motorized_patrol");
			
			// infantry
			O_grpATteam = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Infantry" >> "cwr3_b_at_team");
			O_grpFTeam = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Infantry" >> "cwr3_b_fire_team");
			O_grpMGteam = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Infantry" >> "cwr3_b_mg_team");
			O_grpRFsqd = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Infantry" >> "cwr3_b_rifle_squad");
			O_grpSupportteam = (configfile >> "CfgGroups" >> "WEST" >> "CWR3_USA" >> "Infantry" >> "cwr3_b_support_team");
		};

    };

    case west:
    {
        O_grpMech1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
		O_grpMech2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
		O_grpMech3 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
		O_grpMech4 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
		//motorized
		O_grpmot1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Motorized" >> "cwr3_o_motorized_section");
		// infantry
		O_grpATteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_at_team");
		O_grpFTeam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_fire_team");
		O_grpMGteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_mg_team");
		O_grpRFsqd = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_rifle_squad");
		O_grpSupportteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_support_team");

    };
    case independent:
    {
        //TODO

    };

};
//Arrays to select random from
O_grp_arr_Mech = [O_grpMech1,O_grpMech2,O_grpMech3,O_grpMech4];
O_grp_arr_Inf = [O_grpATteam,O_grpATteam,O_grpMGteam,O_grpMGteam,O_grpMGteam,O_grpMGteam,O_grpATteam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpRFsqd,O_grpRFsqd,O_grpSupportteam];


diag_log "SCHLAAK_VARS.SQF: Groups defined";
systemchat "SCHLAAK_VARS.SQF: Groups defined";


//=================================
// SCHLAAK NUMBERS
//=================================
Schlaak_Grp_defeated = 0;
Schlaak_Units_Captured_W = 0;	//counts capured units according to side
Schlaak_Units_Captured_E = 0;
Schlaak_Units_Captured_I = 0;

Schlaak_Units_routed_w = 0;		//counts routed units according to side
Schlaak_Units_routed_E = 0;
Schlaak_Units_routed_I = 0;
diag_log "SCHLAAK_VARS.SQF: Numbers defined";
systemchat "SCHLAAK_VARS.SQF: Numbers defined";
//=================================
// SCHLAAK ARRAYS
//=================================

Schlaak_PoI_1 = [];					//Points Of Interest 1 - 
Schlaak_PoI_2 = [];					//Points Of Interest 2 - 
Schlaak_PoI_3 = [];					//Points Of Interest 3 - 
if 
	(not isNil "Log_Schlaak_PoI_1") 
then 
	{[Log_Schlaak_PoI_1, Schlaak_PoI_1] call Schlaak_fnc_Push2Arr;};
if 
	(not isNil "Log_Schlaak_PoI_2") 
then 
	{[Log_Schlaak_PoI_2, Schlaak_PoI_2] call Schlaak_fnc_Push2Arr;};
if 
	(not isNil "Log_Schlaak_PoI_3") 
then 
	{[Log_Schlaak_PoI_3, Schlaak_PoI_3] call Schlaak_fnc_Push2Arr;};


Schlaak_Retreat_East = [];			//surrenderflee locations for East
Schlaak_Retreat_West = [];			//surrenderflee locations for West
Schlaak_Retreat_Independent = [];	//surrenderflee locations for RES
if 
	(not isNil "Log_Schlaak_Retreat_E") 
then 
{
	[Log_Schlaak_Retreat_E, Schlaak_Retreat_East] call Schlaak_fnc_Push2Arr;
};
if 
	(not isNil "Log_Schlaak_Retreat_W") 
then 
{
	[Log_Schlaak_Retreat_W, Schlaak_Retreat_West] call Schlaak_fnc_Push2Arr;
};
if 
	(not isNil "Log_Schlaak_Retreat_I") 
then 
{
	[Log_Schlaak_Retreat_I, Schlaak_Retreat_Independent] call Schlaak_fnc_Push2Arr;
};

Schlaak_Brand1 = [];				//objekte mit mittlerem Feuer
Schlaak_Brand2 = [];				//objekte mit großem Feuer
Schlaak_Smoke = [];					//objekte mit Rauch
if 
	(not isNil "Log_Schlaak_Brand1") 
then 
{
	[Log_Schlaak_Brand1, Schlaak_Brand1] call Schlaak_fnc_Push2Arr; 
	{[_x , true , false , 0] call Schlaak_fnc_fireeffects} foreach Schlaak_Brand1;
};
if 
	(not isNil "Log_Schlaak_Brand2") 
then 
{
	[Log_Schlaak_Brand2, Schlaak_Brand2] call Schlaak_fnc_Push2Arr; 
	{[_x , true , false , 0] call Schlaak_fnc_fireeffects2} foreach Schlaak_Brand2;
};
if 
	(not isNil "Log_Schlaak_Smoke") 
then 
{
	[Log_Schlaak_Smoke, Schlaak_Smoke] call Schlaak_fnc_Push2Arr;
	{[_x , false , false , 0] call Schlaak_fnc_fireeffects} foreach Schlaak_Smoke;
};


Schlaak_Garrison = [];
if 
	(not isNil "Log_Schlaak_Garrison") 
then 
{
	[Log_Schlaak_Garrison, Schlaak_Garrison] call Schlaak_fnc_Push2Arr; 
	
};


schlaak_suffersounds = ["ACE_moan_Male01ENGB_high_1","ACE_moan_Male01ENGB_high_2","ACE_moan_Male01ENGB_high_3",	"ACE_moan_Male01ENGB_high_4","ACE_moan_Male01ENGB_high_5","ACE_moan_Male01ENGB_low_1","ACE_moan_Male01ENGB_low_2",
		"ACE_moan_Male01ENGB_low_3","ACE_moan_Male01ENGB_low_4","ACE_moan_Male01ENGB_low_5","ACE_moan_Male01ENGB_mid_1","ACE_moan_Male01ENGB_mid_2","ACE_moan_Male01ENGB_mid_3","ACE_moan_Male01ENGB_mid_4","ACE_moan_Male01ENGB_mid_5",
		"ACE_moan_Male01GRE_high_1",	"ACE_moan_Male01GRE_high_2","ACE_moan_Male01GRE_high_3","ACE_moan_Male01GRE_high_4","ACE_moan_Male01GRE_high_5","ACE_moan_Male01GRE_low_1",	"ACE_moan_Male01GRE_low_2",	"ACE_moan_Male01GRE_low_3",	"ACE_moan_Male01GRE_low_4",		"ACE_moan_Male01GRE_low_5",
		"ACE_moan_Male01GRE_mid_1","ACE_moan_Male01GRE_mid_2","ACE_moan_Male01GRE_mid_3","ACE_moan_Male01GRE_mid_4","ACE_moan_Male01GRE_mid_5","ACE_moan_Male02ENG_high_1",
		"ACE_moan_Male02ENG_high_2","ACE_moan_Male02ENG_high_3","ACE_moan_Male02ENG_high_4","ACE_moan_Male02ENG_high_5",
		"ACE_moan_Male02ENG_low_1","ACE_moan_Male02ENG_low_2","ACE_moan_Male02ENG_low_3","ACE_moan_Male02ENG_low_4",
		"ACE_moan_Male02ENG_low_5","ACE_moan_Male02ENG_mid_1","ACE_moan_Male02ENG_mid_2","ACE_moan_Male02ENG_mid_3",
		"ACE_moan_Male02ENG_mid_4","ACE_moan_Male02ENG_mid_5","ACE_moan_Male02ENGB_high_1","ACE_moan_Male02ENGB_high_2",
		"ACE_moan_Male02ENGB_high_3","ACE_moan_Male02ENGB_high_4","ACE_moan_Male02ENGB_high_5","ACE_moan_Male02ENGB_low_1","ACE_moan_Male02ENGB_low_2","ACE_moan_Male02ENGB_low_3","ACE_moan_Male02ENGB_low_4",
		"ACE_moan_Male02ENGB_low_5","ACE_moan_Male02ENGB_mid_1","ACE_moan_Male02ENGB_mid_2","ACE_moan_Male02ENGB_mid_3","ACE_moan_Male02ENGB_mid_4","ACE_moan_Male02ENGB_mid_5","ACE_moan_Male02GRE_high_1",
		"ACE_moan_Male02GRE_high_2","ACE_moan_Male02GRE_high_3",	"ACE_moan_Male02GRE_high_4","ACE_moan_Male02GRE_high_5",	"ACE_moan_Male02GRE_low_1",	"ACE_moan_Male02GRE_low_2",
		"ACE_moan_Male02GRE_low_3","ACE_moan_Male02GRE_low_4",	"ACE_moan_Male02GRE_low_5",	"ACE_moan_Male02GRE_mid_1",	"ACE_moan_Male02GRE_mid_2",	"ACE_moan_Male02GRE_mid_3",
		"ACE_moan_Male02GRE_mid_4",	"ACE_moan_Male02GRE_mid_5",	"ACE_moan_Male03ENG_high_1",
		"ACE_moan_Male03ENG_high_2","ACE_moan_Male03ENG_high_3",	"ACE_moan_Male03ENG_high_4","ACE_moan_Male03ENG_high_5",
		"ACE_moan_Male03ENG_low_1",	"ACE_moan_Male03ENG_low_2",	"ACE_moan_Male03ENG_low_3",	"ACE_moan_Male03ENG_low_4",
		"ACE_moan_Male03ENG_low_5",	"ACE_moan_Male03ENG_mid_1",	"ACE_moan_Male03ENG_mid_2",	"ACE_moan_Male03ENG_mid_3",
		"ACE_moan_Male03ENG_mid_4",	"ACE_moan_Male03ENG_mid_5",	"ACE_moan_Male03ENGB_high_1","ACE_moan_Male03ENGB_high_2","ACE_moan_Male03ENGB_high_3",
		"ACE_moan_Male03ENGB_high_4","ACE_moan_Male03ENGB_high_5",	"ACE_moan_Male03ENGB_low_1","ACE_moan_Male03ENGB_low_2",
		"ACE_moan_Male03ENGB_low_3","ACE_moan_Male03ENGB_low_4",	"ACE_moan_Male03ENGB_low_5","ACE_moan_Male03ENGB_mid_1",
		"ACE_moan_Male03ENGB_mid_2","ACE_moan_Male03ENGB_mid_3",	"ACE_moan_Male03ENGB_mid_4","ACE_moan_Male03ENGB_mid_5",
		"ACE_moan_Male03GRE_high_1",	"ACE_moan_Male03GRE_high_2",	"ACE_moan_Male03GRE_high_3",	"ACE_moan_Male03GRE_high_4",
		"ACE_moan_Male03GRE_high_5",	"ACE_moan_Male03GRE_low_1",	"ACE_moan_Male03GRE_low_2",
		"ACE_moan_Male03GRE_low_3",	"ACE_moan_Male03GRE_low_4",		"ACE_moan_Male03GRE_low_5",	"ACE_moan_Male03GRE_mid_1",
		"ACE_moan_Male03GRE_mid_2",	"ACE_moan_Male03GRE_mid_3",		"ACE_moan_Male03GRE_mid_4",	"ACE_moan_Male03GRE_mid_5",
		"ACE_moan_Male04ENG_high_1",	"ACE_moan_Male04ENG_high_2",	"ACE_moan_Male04ENG_high_3",
		"ACE_moan_Male04ENG_high_4",	"ACE_moan_Male04ENG_high_5",	"ACE_moan_Male04ENG_low_1",
		"ACE_moan_Male04ENG_low_2",	"ACE_moan_Male04ENG_low_3",	"ACE_moan_Male04ENG_low_4",
		"ACE_moan_Male04ENG_low_5",	"ACE_moan_Male04ENG_mid_1",		"ACE_moan_Male04ENG_mid_2",	"ACE_moan_Male04ENG_mid_3",
		"ACE_moan_Male04ENG_mid_4",	"ACE_moan_Male04ENG_mid_5",		"ACE_moan_Male04GRE_high_1","ACE_moan_Male04GRE_high_2","ACE_moan_Male04GRE_high_3",		"ACE_moan_Male04GRE_high_4",	"ACE_moan_Male04GRE_high_5",		"ACE_moan_Male04GRE_low_1","ACE_moan_Male04GRE_low_2",		"ACE_moan_Male04GRE_low_3","ACE_moan_Male04GRE_low_4",		"ACE_moan_Male04GRE_low_5","ACE_moan_Male04GRE_mid_1",		"ACE_moan_Male04GRE_mid_2","ACE_moan_Male04GRE_mid_3",		"ACE_moan_Male04GRE_mid_4","ACE_moan_Male04GRE_mid_5",		"ACE_moan_Male05ENG_high_1","ACE_moan_Male05ENG_high_2",		"ACE_moan_Male05ENG_high_3",		"ACE_moan_Male05ENG_high_4",		"ACE_moan_Male05ENG_high_5",		"ACE_moan_Male05ENG_low_1",
		"ACE_moan_Male05ENG_low_2",		"ACE_moan_Male05ENG_low_3",		"ACE_moan_Male05ENG_low_4",		"ACE_moan_Male05ENG_low_5",
		"ACE_moan_Male05ENG_mid_1",		"ACE_moan_Male05ENG_mid_2",		"ACE_moan_Male05ENG_mid_3",		"ACE_moan_Male05ENG_mid_4",
		"ACE_moan_Male05ENG_mid_5",		"ACE_moan_Male05ENGB_high_1","ACE_moan_Male05ENGB_high_2",
		"ACE_moan_Male05ENGB_high_3","ACE_moan_Male05ENGB_high_4",		"ACE_moan_Male05ENGB_high_5","ACE_moan_Male05ENGB_low_1",
		"ACE_moan_Male05ENGB_low_2","ACE_moan_Male05ENGB_low_3",		"ACE_moan_Male05ENGB_low_4","ACE_moan_Male05ENGB_low_5",
		"ACE_moan_Male05ENGB_mid_1","ACE_moan_Male05ENGB_mid_2",		"ACE_moan_Male05ENGB_mid_3","ACE_moan_Male05ENGB_mid_4",
		"ACE_moan_Male05ENGB_mid_5","ACE_moan_Male05GRE_high_1",		"ACE_moan_Male05GRE_high_2","ACE_moan_Male05GRE_high_3",
		"ACE_moan_Male05GRE_high_4","ACE_moan_Male05GRE_high_5",		"ACE_moan_Male05GRE_low_1","ACE_moan_Male05GRE_low_2",
		"ACE_moan_Male05GRE_low_3","ACE_moan_Male05GRE_low_4",		"ACE_moan_Male05GRE_low_5","ACE_moan_Male05GRE_mid_1",
		"ACE_moan_Male05GRE_mid_2",		"ACE_moan_Male05GRE_mid_3",		"ACE_moan_Male05GRE_mid_4",		"ACE_moan_Male05GRE_mid_5",
		"ACE_moan_Male06ENG_high_1",		"ACE_moan_Male06ENG_high_2",		"ACE_moan_Male06ENG_high_3",		"ACE_moan_Male06ENG_high_4",
		"ACE_moan_Male06ENG_high_5",		"ACE_moan_Male06ENG_high_6",
		"ACE_moan_Male06ENG_high_7",		"ACE_moan_Male06ENG_high_8",		"ACE_moan_Male06ENG_low_1",		"ACE_moan_Male06ENG_low_2",		"ACE_moan_Male06ENG_low_3",		"ACE_moan_Male06ENG_low_4",		"ACE_moan_Male06ENG_low_5",		"ACE_moan_Male06ENG_low_6",		"ACE_moan_Male06ENG_low_7",		"ACE_moan_Male06ENG_low_8",
		"ACE_moan_Male06ENG_mid_1",		"ACE_moan_Male06ENG_mid_2",		"ACE_moan_Male06ENG_mid_3",		"ACE_moan_Male06ENG_mid_4",
		"ACE_moan_Male06ENG_mid_5",		"ACE_moan_Male06ENG_mid_6",		"ACE_moan_Male06ENG_mid_7",		"ACE_moan_Male06ENG_mid_8",
		"ACE_moan_Male06GRE_high_1",		"ACE_moan_Male06GRE_high_2",		"ACE_moan_Male06GRE_high_3",		"ACE_moan_Male06GRE_high_4",
		"ACE_moan_Male06GRE_high_5",		"ACE_moan_Male06GRE_low_1",		"ACE_moan_Male06GRE_low_2",		"ACE_moan_Male06GRE_low_3",	"ACE_moan_Male06GRE_low_4",		"ACE_moan_Male06GRE_low_5",	"ACE_moan_Male06GRE_mid_1","ACE_moan_Male06GRE_mid_2","ACE_moan_Male06GRE_mid_3","ACE_moan_Male06GRE_mid_4",
		"ACE_moan_Male06GRE_mid_5","ACE_moan_Male07ENG_high_1","ACE_moan_Male07ENG_high_2","ACE_moan_Male07ENG_high_3",
		"ACE_moan_Male07ENG_high_4","ACE_moan_Male07ENG_high_5","ACE_moan_Male07ENG_low_1","ACE_moan_Male07ENG_low_2",
		"ACE_moan_Male07ENG_low_3","ACE_moan_Male07ENG_low_4","ACE_moan_Male07ENG_low_5","ACE_moan_Male07ENG_mid_1",
		"ACE_moan_Male07ENG_mid_2","ACE_moan_Male07ENG_mid_3","ACE_moan_Male07ENG_mid_4","ACE_moan_Male07ENG_mid_5",
		"ACE_moan_Male08ENG_high_1","ACE_moan_Male08ENG_high_2","ACE_moan_Male08ENG_high_3","ACE_moan_Male08ENG_high_4",
		"ACE_moan_Male08ENG_high_5","ACE_moan_Male08ENG_high_6","ACE_moan_Male08ENG_high_7","ACE_moan_Male08ENG_high_8",
		"ACE_moan_Male08ENG_low_1","ACE_moan_Male08ENG_low_2","ACE_moan_Male08ENG_low_3","ACE_moan_Male08ENG_low_4",
		"ACE_moan_Male08ENG_low_5","ACE_moan_Male08ENG_low_6","ACE_moan_Male08ENG_low_7","ACE_moan_Male08ENG_low_8",
		"ACE_moan_Male08ENG_mid_1","ACE_moan_Male08ENG_mid_2","ACE_moan_Male08ENG_mid_3","ACE_moan_Male08ENG_mid_4",
		"ACE_moan_Male08ENG_mid_5","ACE_moan_Male08ENG_mid_6","ACE_moan_Male08ENG_mid_7","ACE_moan_Male08ENG_mid_8","ACE_moan_Male09ENG_high_1","ACE_moan_Male09ENG_high_2","ACE_moan_Male09ENG_high_3",
		"ACE_moan_Male09ENG_high_4","ACE_moan_Male09ENG_low_1",	"ACE_moan_Male09ENG_low_2",	"ACE_moan_Male09ENG_low_3",
		"ACE_moan_Male09ENG_low_4",	"ACE_moan_Male09ENG_low_5",	"ACE_moan_Male09ENG_mid_1",	"ACE_moan_Male09ENG_mid_2",
		"ACE_moan_Male09ENG_mid_3",	"ACE_moan_Male09ENG_mid_4",	"ACE_moan_Male09ENG_mid_5"];

diag_log "SCHLAAK_VARS.SQF: Arrays defined";
systemchat "SCHLAAK_VARS.SQF: Arrays defined";
//=================================
// SCHLAAK STRINGS
//=================================


diag_log "SCHLAAK_VARS.SQF: Strings defined";
systemchat "SCHLAAK_VARS.SQF: Strings defined";
//=================================
// SCHLAAK OBJECTS etc
//=================================


diag_log "SCHLAAK_VARS.SQF: Objects defined";
systemchat "SCHLAAK_VARS.SQF: Objects defined";

/*
O_grpBMP1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
O_grpBMP2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
O_grpBTR = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
O_grpMTLB = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
O_grpmot = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Motorized" >> "cwr3_o_motorized_section");
O_grpRNDmech = selectrandom [O_grpBMP1,O_grpBMP2,O_grpBTR,O_grpMTLB];

Counterattack_defeated = 0;