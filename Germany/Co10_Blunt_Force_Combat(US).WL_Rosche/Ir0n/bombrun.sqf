params ["_pos","_dir","_planeCount"];
for "_i" from 0 to _planeCount - 1 do {
	[_pos,_dir] execVM "ir0n\flyby.sqf";
	sleep 5;
};
