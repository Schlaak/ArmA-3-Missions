//if (!isserver) exitWith {};

/*
===============================
Ambiente flyby classnames
===============================
*/

O_grpBMP1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
O_grpBMP2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
O_grpBTR = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
O_grpMTLB = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
O_grpmot = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Motorized" >> "cwr3_o_motorized_section");
O_grpATteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_at_team");
O_grpFTeam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_fire_team");
O_grpMGteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_mg_team");
O_grpRFsqd = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_rifle_squad");
O_grpSupportteam = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Infantry" >> "cwr3_o_support_team");

O_grpRND = selectrandom [O_grpBMP1,O_grpBMP2,O_grpBTR,O_grpMTLB];
O_grpInfRnd = selectrandom [O_grpATteam,O_grpATteam,O_grpATteam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpFTeam,O_grpRFsqd,O_grpRFsqd,O_grpSupportteam];

publicVariable "O_grpBMP1";
publicVariable "O_grpBTR";
publicVariable "O_grpBMP2";
publicVariable "O_grpMTLB";
publicVariable "O_grpmot";
publicVariable "O_grpATteam";
publicVariable "O_grpFTeam";
publicVariable "O_grpMGteam";
publicVariable "O_grpRFsqd";
publicVariable "O_grpSupportteam";

publicVariable "O_grpRND";
publicVariable "O_grpInfRnd";
/*
===============================
Ambiente flyby classnames
===============================
*/

Schlaak_ambFly_class1 = ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p",
				"cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
Schlaak_ambFly_class2 = [];		

publicVariable "Schlaak_ambFly_class1";
publicVariable "Schlaak_ambFly_class2";