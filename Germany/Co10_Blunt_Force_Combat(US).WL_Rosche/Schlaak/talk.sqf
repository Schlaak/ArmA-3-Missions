//_talk = [this] execvm "scripts\talk.sqf";
private ["_GI","_GI2"];
_GI = _this select 0;
_GI2 = leader group _GI;


sleep 5;
while {true} do
{
	_talk = selectrandom [
"HLOF_allclear","HLOF_area","HLOF_athority","HLOF_babysitting","HLOF_bfeeling","HLOF_charge","HLOF_check","HLOF_chicken","HLOF_command","HLOF_corporal","HLOF_coverup","HLOF_current","HLOF_disney","HLOF_frosty","HLOF_fubar","HLOF_guard","HLOF_hear","HLOF_hearsome","HLOF_hell","HLOF_lost","HLOF_medical","HLOF_nohealth","HLOF_nomovement","HLOF_onepiece","HLOF_outof","HLOF_roger","HLOF_seensquad","HLOF_outof","HLOF_sniper","HLOF_stand","HLOF_stayalert"];
_reply = selectrandom ["HLOF_athority","HLOF_check","HLOF_corporal_01","HLOF_dogs","HLOF_feel","HLOF_guardduty","HLOF_hellosir","HLOF_leave","HLOF_locksmith","HLOF_mission","HLOF_no","HLOF_now","HLOF_oneshot","HLOF_orders","HLOF_quiet","HLOF_right","HLOF_shephard","HLOF_short","HLOF_sir","HLOF_siryessir","HLOF_sir_01","HLOF_situations","HLOF_sore","HLOF_tag","HLOF_talking","HLOF_thanks","HLOF_yes","HLOF_zone"];
_GI setRandomLip true;
[_GI, _talk, 20] call CBA_fnc_globalSay3d;
sleep 3;
_GI setRandomLip false;
sleep 5;
_GI2 setRandomLip true;
[_GI2, _reply, 20] call CBA_fnc_globalSay3d;
sleep 3;
_GI2 setRandomLip false;
sleep 12;
};





	/* STATEMENT */
