if (!isserver) exitWith {};
while {alive loudspeaker} do
{
	_sound = selectrandom ["a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12","a13","t1","t2","t3","t4","t5"];
	sleep 200 + 100;
	[loudspeaker ,_sound] remoteExec ["say3d", 0, true];
	sleep 15 + 10;
	_sound = selectrandom ["a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12","a13","t1","t2","t3","t4","t5"];
	[loudspeaker ,_sound] remoteExec ["say3d", 0, true];
};