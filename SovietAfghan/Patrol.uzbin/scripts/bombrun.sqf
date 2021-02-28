params ["_target","_planeCount"];
_pos = getPos _target;
//_pos vectorAdd ([-50,0,0] vectorMultiply (0.5 * _planeCount));
for "_i" from 0 to _planeCount - 1 do {
	[_pos,0] execVM "scripts\flyby.sqf";
	//_pos = _pos vectorAdd [50,0,0];
	sleep 5;
}