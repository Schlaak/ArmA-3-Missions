// [this] execvm "scripts\rnd_shoteranim.sqf";
//if (!isserver) exitWith {};
//private ["_dude","_anim"];

_dude = _this select 0;

/*
"repair_kneel1"
"repair_kneel2"
"repair_prone"
"repair_stand"
"sit_high"
"sit"
"sit_table"
"sit_rifle"
*/
_anim = selectrandom ["briefing","lean","patrol","pushups","sit_low","stand","talk"];
_nic = [_dude, _anim] execVM "ShoterAnimation\ShoterAnimation.sqf";