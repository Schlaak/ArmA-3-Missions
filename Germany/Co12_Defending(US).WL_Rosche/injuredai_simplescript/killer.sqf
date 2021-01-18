
/*
Finisher sound play for players
you can add more sounds or remove them from arryas
it seperated for each sides

*/

// NICHT IN BENUTZUNG WEIL KEINE SOUNDS.
if !(isServer) exitWith {};

_victim = _this select 0;
_killer = _this select 1;

_victim removeAllMPEventHandlers "MPKilled";

/////////////////////////////////sound for west units
/*
if (side _killer == west) then {
// add-remove sounds here

_sound = [
] call BIS_fnc_selectRandom;
[[_killer,_sound] remoteExec ["say3D"]];

} else {
	*/
////////////////////////////sound for east units
if (side _killer == east) then {
// add-remove sounds here
_sound = [];
/*
"yell_1","yell_2","yell_3","yell_4","yell_5","yell_6","yell_7","yell_8","yell_9","yell_10","yell_11","yell_12","yell_13","yell_14","yell_15","yell_16","yell_17","yell_18","yell_19","yell_20","yell_21","yell_22","yell_23","yell_24","yell_25","yell_26","yell_27","yell_28","yell_29","yell_30","yell_31","yell_32","yell_33","yell_34","yell_35","yell_36","yell_37","yell_38","yell_39","yell_40","yell_41","yell_42","yell_43","yell_44","yell_45","yell_46","yell_47","yell_48","yell_49","yell_50","yell_51","yell_52","yell_53","yell_54","yell_55","yell_56","yell_57","yell_58","yell_59","yell_60","yell_61","yell_62","yell_63","yell_64","yell_65","yell_66","yell_67","yell_68" ] call BIS_fnc_selectRandom;

*/
[[_killer,_sound] remoteExec ["say3D"]];


/*
"CK_01","CK_02","CK_03","CK_04","CK_05","CK_06","CK_07","CK_08","CK_09","CK_010","CK_011","CK_012","CK_013","CK_014","CK_015","CK_016","CK_017","CK_018","CK_019","CK_020"

[[_killer,_sound] remoteExec ["say3D"]];
*/
} else {
////////////////////////////////////sound for independent/civilians units
// add-remove sounds here
/*
_sound = ["CK_01","CK_02","CK_03","CK_04","CK_05","CK_06","CK_07","CK_08","CK_09","CK_010","CK_011","CK_012","CK_013","CK_014","CK_015","CK_016","CK_017","CK_018","CK_019","CK_020"

] call BIS_fnc_selectRandom;
[[_killer,_sound] remoteExec ["say3D"]];
*/
};





