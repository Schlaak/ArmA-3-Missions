/*
Function to push all synchronized objects from _OBJ to _ARR

params ["_OBJ","_ARR"]; 


to be used an array has to be defined before. I do this via the schlaak_vars

to be used from objectinit a delay is advised. Do this with e.g:
[this] spawn {
sleep 3;
[_this select 0, ARRAY1] call SCHLAAK_fnc_Wrapper;
}

*/

//{this, ARRAY1] call Schlaak_fnc_Push2Arr
params ["_OBJ","_ARR"]; 

if (isNull _OBJ)  exitwith {["Schlaak_fn_wrapper _OBJ not defined"] call BIS_fnc_error;};
//if (isNull _ARR)  exitwith {["Schlaak_fn_wrapper _ARR not defined"] call BIS_fnc_error;};
if (!isServer)  exitwith {};

{_ARR pushBack _x} foreach (synchronizedObjects _OBJ);

