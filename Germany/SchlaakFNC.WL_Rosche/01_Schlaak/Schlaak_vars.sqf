{_x addMPEventHandler ["MPhit", { [_this select 0] call Schlaak_fnc_incap; }];} foreach allunits; 


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

sleep 3;
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

Schlaak_dietime = 60 + (random 300);		//basic dietime though without any use atm
Schlaak_bodybagtime = 300 + (random 600);		//time till bodybab
Schlaak_bagremovaltime = 300 + (random 300);	//time till bodybagremoval

/*
Schlaak_dietime = 15 + (random 3);
Schlaak_bodybagtime = 15 + (random 3);
Schlaak_bagremovaltime = 15 + (random 3);
*/

diag_log "SCHLAAK_VARS.SQF: Numbers defined";
systemchat "SCHLAAK_VARS.SQF: Numbers defined";
sleep 3;
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




diag_log "SCHLAAK_VARS.SQF: Arrays defined";
systemchat "SCHLAAK_VARS.SQF: Arrays defined";
sleep 3;
//=================================
// SCHLAAK STRINGS
//=================================


diag_log "SCHLAAK_VARS.SQF: Strings defined";
systemchat "SCHLAAK_VARS.SQF: Strings defined";
//=================================
// SCHLAAK OBJECTS etc
//=================================
//sleep 5;
//{if ((side _x) == west) then {[_x ] call Schlaak_fnc_grpCompromised;}} forEach allUnits;
//{if ((side _x) == east) then {[_x ] call Schlaak_fnc_grpCompromised;}} forEach allUnits;
//{if ((side _x) == resistance) then {[_x ] call Schlaak_fnc_grpCompromised;}} forEach allUnits;
//{[_x ] call Schlaak_fnc_incap;} foreach allunits;

diag_log "SCHLAAK_VARS.SQF: flee and wounds initialized";
systemchat "SCHLAAK_VARS.SQF: flee and wounds initialized";
//#include "Schlaak_spawn_EH.sqf";

sleep 3;
[] execvm "01_Schlaak\schlaak_vars2.sqf";

diag_log "SCHLAAK_VARS.SQF: Schlaak_spawn_EH defined";
systemchat "SCHLAAK_VARS.SQF: Schlaak_spawn_EH defined";

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