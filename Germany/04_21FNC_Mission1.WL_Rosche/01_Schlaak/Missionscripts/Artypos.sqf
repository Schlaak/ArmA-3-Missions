if !(isserver) exitwith {};
_pos = selectrandom [];
nul = [Artilleriestellung,_pos,100,"Man"] execvm "02_scripts\shk_moveobjects.sqf";
