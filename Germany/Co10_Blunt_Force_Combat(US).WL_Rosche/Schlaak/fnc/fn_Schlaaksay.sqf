//Save way for multiplayer sounds.... can´t memorize shit. [player,"9liner",50] call SchlaakMPsay;
//Schlaaksay = {
	params ["_talker","_sound","_distance"];
	[_talker,[_sound,_distance,1,true]] remoteExec ["say3D", 0, False];
//};