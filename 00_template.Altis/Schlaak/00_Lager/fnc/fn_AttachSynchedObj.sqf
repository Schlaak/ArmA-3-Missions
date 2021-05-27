/*
Function to attach the objects synchronizedObjects to the object.

usefull for creating compositions and moving them.

parameters:
_object 	= the object all the synched objects shall be rel.attached to
_Sim		= enable simulation?
_dynsim		= enable dynamic simulation?
_DAM		= can these objects take damage?

//most common samplecall
[this,true,true,false] call Schlaak_fnc_attachsychedobj;


BIS_fnc_attachToRelative = global
enableSimulationGlobal = global
allowdamage = global
enableDynamicSimulation = should be global
*/



/*
[this,(nearestObject [this, ""])] call BIS_fnc_attachToRelative;
{(deletevehicle _x)} foreach ( synchronizedObjects thistrigger);  }
*/
params ["_OBJ","_SIM","_DYNSIM","_DAM"];

if (!isserver)  exitwith {};


_array = synchronizedObjects _OBJ;
//{[_x, _OBJ] call BIS_fnc_attachToRelative;} foreach ( synchronizedObjects _OBJ);

//{_x attachto [_OBJ]} foreach _array;


{[_x,_OBJ] call BIS_fnc_attachToRelative;} foreach (synchronizedObjects _OBJ);
/*
if (_SIM == true) then {
	{_x enableSimulationGlobal true} foreach _array;
} else {
	{_x enableSimulationGlobal false} foreach _array;
};


if (_DYNSIM == true) then {
	{_x enableDynamicSimulation true} foreach _array;
	{_x enableSimulationGlobal true} foreach _array;
} else {
	{_x enableDynamicSimulation false} foreach _array;
};



if (_DAM == true) then {
	{_x allowdamage true} foreach (synchronizedObjects _OBJ);
} else {
	{_x allowdamage false} foreach (synchronizedObjects _OBJ);
};