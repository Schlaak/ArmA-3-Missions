while {alive ukwradio} do
{
	_sound = selectrandom ["songaghan","songcaravan","songcombatwork","songdushman","songgruppakrovi"];
	sleep 340 + (random 100);
	[ukwradio ,_sound] remoteExec ["say3d", 0, true];
	sleep 15 + (random 10);
	_sound = selectrandom ["songaghan","songcaravan","songcombatwork","songdushman","songgruppakrovi"];
	[ukwradio ,_sound] remoteExec ["say3d", 0, true];
};