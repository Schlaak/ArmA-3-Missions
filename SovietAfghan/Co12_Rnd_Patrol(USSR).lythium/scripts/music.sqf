if (!isserver) exitWith {};

while {alive ukwradio} do
{
	_sound = selectrandom ["songaghan","songcaravan","songcombatwork","songdushman","songgruppakrovi"];
	[ukwradio, _sound, 60] call CBA_fnc_globalSay3d;
	[ukwradio_1, _sound, 60] call CBA_fnc_globalSay3d;
	//[ ,_sound] remoteExec ["say3d", 0, true];
	sleep 660 ;


};