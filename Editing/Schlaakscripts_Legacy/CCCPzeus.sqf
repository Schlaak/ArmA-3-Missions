//[_dude, false] execvm "scripts\US.sqf";
//heavy loadout
//[_dude, true] execvm "scripts\US.sqf";
if (!hasInterface && !isDedicated) exitWith {};


private ["_russian","_items","_dude","_uniform"];

_dude = _this select 0;


sleep (1 + (random 3));

_russian = selectrandom ["Male01RUS","Male02RUS","Male03RUS"];


[_dude, _russian] remoteExec ["setSpeaker", 0, _dude];




_items = uniformItems _dude;


sleep 0.5;
removeUniform _dude;

//_dude addWeapon "arifle_SUD_AK74";
//_dude addPrimaryWeaponItem "SUD_30Rnd_545x39_AK";
if (!(_dude getVariable ["isSetup", false])) then {
_dude setVariable ["isSetup", true];


_uniform = "stl_sgr_gm_pl_uniform_wz4652_sunrays_khaki";

if ( _dude  isKindOf "SUD_USSR_Soldier_Crew") then
{
	_uniform = "stl_sgr_gm_ge_army_uniform_crew_80_khaki";
};
/*
if ( ((rank _dude) == "SERGEANT") && (_dude iskindof "SUD_USSR_Soldier_TL") ) then
{
	_uniform = "su_uniform_msv_m69_szt_field";
};
*/



_dude forceAddUniform _uniform;
{_dude addItemToUniform _x} foreach _items;
};




/*