/*
	Author: IR0NSIGHT

	Description:
	Will clear a container with all its inventory

	Parameter(s):
		0 :
			OBJECT - container to clear of vanilla inventory
	Returns:
	none
*/
params [["_crate",objNull,[objNull]]];
if (isNull _crate) exitWith {
	["target object is nil."] call BIS_fnc_error;
};
clearItemCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
{
	deleteVehicle _x select 1;
} forEach everyContainer _crate;
