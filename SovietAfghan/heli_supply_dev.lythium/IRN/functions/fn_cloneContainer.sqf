/*
	Author: IR0NSIGHT

	Description:
	Will clone a container with all its inventory and ace cargo (and their inventory and ace cargo etc).

	Parameter(s):
		0 :
			OBJECT - original container to clone
		1 (optional):
			OBJECT - container to use instead of new clone
	Returns:
	clone
*/
params ["_crate","_clone"];
if (isNull _crate) exitWith {
	["target object is nil."] call BIS_fnc_error;
};
//crate object clone
if (isNil "_clone") then {
	_clone = (typeOf _crate) createVehicle (getPos _crate);
	_clonePos = [getPos _crate,1,30,2] call BIS_fnc_findSafePos;
	_clone setPos _clonePos;
	[_clone] call IRN_fnc_clearContainer;
	diag_log "creating new clone container.";
	//_clone enableSimulationGlobal false;
};
_items = getitemCargo _crate;
_mags = getmagazineCargo _crate;
_weapons = weaponsItemsCargo _crate;
_containers = everyContainer _crate; //	
_backPackItems = backpackCargo _crate;

{
	_arr = _x;
	_itemTypes = _x select 0;
	_itemCounts = _x select 1;
	{
		_item = _x;
		_count = _itemCounts select _foreachIndex;
		_clone addItemCargoGlobal [_item, _count];
	} forEach (_itemTypes);
} forEach [_items,_mags];
{
	_clone addWeaponWithAttachmentsCargoGlobal [_x,1];
} forEach _weapons;

if (count _containers != 0) then {
	{
		_type = _x select 0;
		diag_log ["adding container: ",_type," is Backpack: ",(_type in _backPackItems)];
		if (_type in _backPackItems) then {
			_clone addBackpackCargoGlobal [_type,1];
		} else {
			_clone addItemCargoGlobal [_type,0]; //!needs to be zero, otherwise double added. idk why
		};
	} forEach _containers;
	_backPacksClone = everyContainer _clone;
	{
		//find a container of same type, delete from list.
		_orgType = _x select 0;
		_temp = _backPacksClone select {(_x select 0) isEqualTo _orgType};
		diag_log ["temp: ",_temp];
		_cloneContainer = _temp select 0 select 1;
		_backPacksClone = _backPacksClone - [_cloneContainer];
		diag_log ["recurse into backpack:", _cloneContainer];
		[_cloneContainer] call IRN_fnc_clearContainer;
		[_x select 1,_cloneContainer] call IRN_fnc_cloneContainer;
	} forEach _containers;
	diag_log ["done for: ",typeOf _crate];
};

private _loaded = _crate getVariable ["ace_cargo_loaded", []];
//copy over ace cargo values
_size = [_crate] call ace_cargo_fnc_getSizeItem;
[_clone,_size] call ACE_cargo_fnc_setSize;

//get total space: spaceleft + size of all loaded
_space = [_crate] call ACE_cargo_fnc_getcargospaceleft;
{_space = (_space + ([_x] call ace_cargo_fnc_getSizeItem));} forEach _loaded;
[_clone,_space] call ACE_cargo_fnc_setSpace;
diag_log ["size: ",_size,"space: ",_space];


diag_log ["loaded: ",_loaded];
{
	private _new =[_x] call IRN_fnc_cloneContainer;
	[_new,_clone,true] call ace_cargo_fnc_loadItem;
} forEach _loaded;
_clone