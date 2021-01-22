//if (!isserver) exitWith {};
O_grpBMP1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
O_grpBMP2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
O_grpBTR = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
O_grpMTLB = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
O_grpmot = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Motorized" >> "cwr3_o_motorized_section");

O_grpRND = selectrandom [O_grpBMP1,O_grpBMP2,O_grpBTR,O_grpMTLB];