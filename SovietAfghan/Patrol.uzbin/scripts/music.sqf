if (!isserver) exitWith {};

while {alive ukwradio} do
{
	_sound = selectrandom ["songaghan","songcaravan","songcombatwork","songdushman","songgruppakrovi"];
	[ukwradio ,_sound] remoteExec ["say3d", 0, true];
	sleep 600 ;


};