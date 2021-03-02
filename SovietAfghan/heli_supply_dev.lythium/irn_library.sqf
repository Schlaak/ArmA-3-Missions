/*
 * Author: IR0NSIGHT
 * Clones an object and its cargo inventory, including ace cargo
 *
 * Arguments:
 * 0: Original object <OBJECT>
 * 1: Cloned object <OBJECT> (optional)
 *
 * Return Value:
 * cloned object <OBJECT>
 *
 * Example:
 * [object] call IRN_fnc_cloneCrate
 *
 * Public: No //TODO whatdoes this want?
*/
IRN_fnc_cloneCrate = {
	params ["_crate","_clone"];
	//crate object clone
	if (isNil "_clone") then {
		_clone = (typeOf _crate) createVehicle (getPos _crate);
		_clonePos = [getPos _crate,1,30,2] call BIS_fnc_findSafePos;
		_clone setPos _clonePos;
		[_clone] call IRN_fnc_clearCrate;
		diag_log "creating new clone container.";
		//_clone enableSimulationGlobal false;
	};
	diag_log  ["clone: ",typeOf _clone];
	_items = getitemCargo _crate; diag_log str ["items",_items];
	_mags = getmagazineCargo _crate; diag_log str ["mags",_mags];
	//_weapons = getWeaponCargo _crate;
	_weapons = weaponsItemsCargo _crate;
	_containers = everyContainer _crate; //	
	_backPackItems = backpackCargo _crate;
	diag_log str ["containers:",_containers];
	//diag_log str ["backpacks",_backPackItems];
	//diag_log ["weaponsItems:",_weapons];
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
			[_cloneContainer] call IRN_fnc_clearCrate;
			[_x select 1,_cloneContainer] call IRN_fnc_cloneCrate;
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
		private _new =[_x] call IRN_fnc_cloneCrate;
		[_new,_clone,true] call ace_cargo_fnc_loadItem;
	} forEach _loaded;
	_clone
};

//clears an object of all inventory items. does not include ace cargo
IRN_fnc_clearCrate = {
	params ["_crate"];
	clearItemCargoGlobal _crate;
	clearWeaponCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;

	{
		diag_log ["trying to kill container: ",_x];
		deleteVehicle _x select 1;
	} forEach everyContainer _crate;
	diag_log ["cleared crate",_crate]
};

IRN_fnc_test = {
	params ["_crate"];
	//diag_log ["crate:",_crate,"all containers",everyContainer _crate,"all backpacks",everyBackpack _crate];
};

//params: talker (unit receiving sound), index: 0 = player talking, 1 opz first (long) answer, 2 opz second (short) answer
IRN_fnc_sayRandom = {
	params ["_talker","_index"];
	////diag_log  str [ "sayRandom:",_talker,_index];
	_sound = nil;
	switch (_index) do {
		case 0: {
			_sound = selectrandom ["Call1","Call2","Call3","Call4","Call5"];
		};
		case 1: {
			_sound = selectrandom ["CP1","CP2","CP7","CP8","cp3","cp4","CP5","CP6","CP9","CP10","CP11"];
		};
		case 2: {
			_sound = selectRandom ["CPu1","CPu2","CPu7","cpu3","cpu4","CPu5","CPu6"];
		};
		default {};
	};
	_talker say3D [_sound,50,1,true];
};