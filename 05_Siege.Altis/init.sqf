//Basic setup
enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 1800;
"Vehicle" setDynamicSimulationDistance 1800;
"EmptyVehicle" setDynamicSimulationDistance 300;
"Prop" setDynamicSimulationDistance 300;



MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;

};
fn_simpleConv = {
#include "02_scripts\fn_simpleConv.sqf"
};
fn_L917_incap = {
#include "Schlaak\Immers\incap.sqf"
};
fn_L917_introtxt = {
#include "Schlaak\feed\IntroText.sqf"
};
fn_L917_KIA = {
#include "Schlaak\feed\KIA.sqf"
};
fn_L917_Blut = {
#include "Schlaak\Immers\Blutlache.sqf"
};







//inCap = compile preprocessfilelinenumbers "scripts\inCap.sqf";

/*//parameters
_this select 0, true or false, ais war voices,ais will talk with radio or yelling while firing, (default = true)
_this select 1, true or false, drop smoke around injured ai, (default = true)
_this select 2, true or false, drag to cover, dragger will drag injured to covers like bushes or rocks, for longer distance drag set this false, (default = true)
_this select 3, unconscious and drag chance, determine chance unit unconscious if got hit, min 0%-100% max (default = 50%)
_this select 4, hit react chance, determine chance unit have react animation if got hit, min 0%-100% max (default = 20%)
*** Important Note: if you increase hit react chance, it also decrease unconscious and drag chance ***
*/
//_null = [false, false, false, 70, 20] execvm "scripts\injured.sqf";







