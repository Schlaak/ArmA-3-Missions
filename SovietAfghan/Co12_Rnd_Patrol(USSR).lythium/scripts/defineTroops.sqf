//if (!isserver) exitWith {};
/*
soviets
O_grpBMP1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
O_grpBMP2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
O_grpBTR = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
O_grpMTLB = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
O_grpmot = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Motorized" >> "cwr3_o_motorized_section");

O_grpRND = selectrandom [O_grpBMP1,O_grpBMP2,O_grpBTR,O_grpMTLB];
*/

O_grp0 = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_AATeam");
O_grp1 = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_ATTeam");
O_grp2 = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_Demosquad");
O_grpBMP1 = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_Group");
O_grpBMP2 = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_GroupWeapons");
O_grpBTR = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_Patrol");
O_grpMTLB = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Infantry" >> "CUP_I_TK_GUE_SniperTeam");
O_grpmot = (configfile >> "CfgGroups" >> "Indep" >> "CUP_I_TK_GUE" >> "Motorized" >> "CUP_I_TK_GUE_MotorizedPatrol");

O_grpRND = selectrandom [O_grpBMP1,O_grpBMP2,O_grpBTR,O_grpMTLB,O_grp2,O_grp1,O_grp0];