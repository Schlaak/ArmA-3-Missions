if !(isserver) exitwith {};
_pos = getpos ( selectrandom [ArtySite_3,ArtySite_2,ArtySite_1,ArtySite_0]);
nul = [ArtySite_4,_pos,100] execvm "02_scripts\shk_moveobjects.sqf";
systemchat "ARTY SITE MOVED!";
