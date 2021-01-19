if (isDedicated) exitWith {};

_dude = _this select 0;
_hat = selectrandom ["usm_headwrap_odg2","usm_headwrap_blk","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_tan","H_Cap_blu","H_Cap_oli","H_Cap_tan","H_Cap_blk","H_Cap_grn","H_Cap_surfer","H_Bandanna_khk","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_camo","H_Hat_brown","H_Hat_checker","H_Hat_tan","rds_worker_cap1","rds_worker_cap2","rds_worker_cap3","rds_worker_cap4","rds_Villager_cap1","rds_Villager_cap2","rds_Villager_cap3","rds_Villager_cap4","rds_Profiteer_cap1","rds_Profiteer_cap2","rds_Profiteer_cap3","rds_rocker_hair1","H_HeadBandage_stained_F","H_HeadBandage_clean_F","H_HeadBandage_bloody_F","H_Booniehat_mgrn","G_Spectacles","G_Spectacles_Tinted","G_Shades_Black","G_Squares","G_Squares_Tinted","G_Aviator","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_khk","G_Bandanna_tan","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Shades_Blue","G_Sport_Blackred","rds_long_hair_01"];
removeheadgear _dude;
_dude addHeadgear _hat;
/*
[this,(nearestObject [this, ""])]
[this, (nearestObject [this, ""])] call BIS_fnc_attachToRelative;