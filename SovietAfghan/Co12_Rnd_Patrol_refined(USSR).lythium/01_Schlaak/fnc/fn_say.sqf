//Save way for multiplayer sounds.... can´t memorize shit. [player,"9liner",50] call Schlaak_fnc_say;
params ["_talker","_sound","_distance"];

/*if ((isNull _talker) OR (isNil _sound) )  exitwith 
{
	["Schlaak_fnc_say missing one or more params!"] call BIS_fnc_error;
};
*/

[_talker,[_sound,_distance,1,true]] remoteExec ["say3D", 0, False];
