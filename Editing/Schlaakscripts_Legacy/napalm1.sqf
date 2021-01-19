playsound "snd_jet";

if (!isserver) exitwith {};
sleep 20;


_pos = getpos napalm;
_bombRnd = createVehicle ["Sh_82mm_AMOS",(getpos napalm), [], 0, "NONE"];
nul = [napalm,true,true] execvm "scripts\fireeffects2.sqf";
sleep 1.3;
_pos = getpos napalm_1;
_bombRnd = createVehicle ["Sh_82mm_AMOS",(getpos napalm_1), [], 0, "NONE"];
nul = [napalm_1,true,true] execvm "scripts\fireeffects2.sqf";
sleep 1;
_pos = getpos napalm_2;
_bombRnd = createVehicle ["Sh_82mm_AMOS",(getpos napalm_2), [], 0, "NONE"];
nul = [napalm_2,true,true] execvm "scripts\fireeffects2.sqf";
sleep 1.2;
_pos = getpos napalm_3;
_mrtRnd = createVehicle ["Sh_82mm_AMOS",_pos, [], 0, "NONE"];
nul = [napalm_3,true,true] execvm "scripts\fireeffects2.sqf";
sleep 1;
napalmstrike1_1 = true;
sleep 600;
napalmstrike1_1 = false;



