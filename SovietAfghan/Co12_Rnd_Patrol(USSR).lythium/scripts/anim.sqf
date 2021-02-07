/*
script for ambiente animations

[this, true, 30] execvm "scripts\anim.sqf";
*/

if (!isserver) exitwith {};
private
_dude = _this select 0;	//unit to do animation
_talk = _this select 1; //shall the unit talk? yes no
_animation = selectrandom ["STAND","STAND_IA","WATCH1","WATCH2","BRIEFING","KNEEL"]; //array of animations
_saying = selectRandom ["unterhaltung"];	//definded in cfgsounds, what to say.
_saytime = _this select 2; //time between soundfiles


dostop _dude;
_dude disableAI "RADIOPROTOCOL";


//[_dude,_animation] remoteExec ["switchmove", 0, true]; //DOES NOT WORK
[_dude,_animation,"ASIS"] remoteExec ["BIS_fnc_ambientAnim", 0, true];
while {combatMode group _dude != "COMBAT"} do 
{
	
	//_talk
	if (_talk) then 
	{
		[_dude, _saying, 20] call CBA_fnc_globalSay3d;
	};
	sleep ((random 30) + _saytime);
};

if (combatMode group _dude == "COMBAT") then
{
	[_dude,""] remoteExec ["switchmove", 0, true];
	_dude enableAI "RADIOPROTOCOL";
};