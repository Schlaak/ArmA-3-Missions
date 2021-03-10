/*
	Author: Ayran Sayüt

	Description:
	Will spawn a VR arrow at the given ojbject and attach it to it.

	Parameter(s):
		0 :
			Object - Object/unit to which the arrow will be attached

	Returns:
	none
*/
params [
	["_unit", objNull, [objNull]] // value -of the same type- as expected
];
//error handling:
if (isNull _unit) exitWith {
	["target object is nil."] call BIS_fnc_error;
};
_class = "Sign_Arrow_Large_Yellow_F";
switch (side _unit) do {
	case west: {_class = "Sign_Arrow_Large_Blue_F";};
	case east: {_class = "Sign_Arrow_Large_F";};
	case independent: {_class = "Sign_Arrow_Large_Green_F";};
	case civilian: {_class = "Sign_Arrow_Large_Pink_F";};
	default {};
};
_arrow = createVehicle [_class,getPos _unit];
_arrow attachTo [_unit,[0,0,5]];
[_unit,_arrow] spawn {
	params ["_unit","_arrow"];
	waitUntil {
		sleep 30;
		!(alive _unit)
	};
	deleteVehicle _arrow;
};

