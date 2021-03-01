//TODO clone loaded ace cargo
//clones crate. (_crate,_clone(optional)) if no clone give, one is created and placed near the original
IRN_fnc_cloneCrate = {
	params ["_crate","_clone"];
	//crate object clone
	if (isNil "_clone") then {
		_clone = (typeOf _crate) createVehicle (getPos _crate);
		_clonePos = [getPos _crate,1,30,2] call BIS_fnc_findSafePos;
		_clone setPos _clonePos;
		//_clone enableSimulationGlobal false;
	};
	diag_log  ["clone: ",typeOf _clone];
	_items = getitemCargo _crate; diag_log str ["items",_items];
	_mags = getmagazineCargo _crate; diag_log str ["mags",_mags];
	//_weapons = getWeaponCargo _crate;
	_weapons = weaponsItemsCargo _crate;
	_containers = everyBackpack _crate; //	
	_backPackItems = backpackCargo _crate;
	diag_log str ["containers:",_containers];
	diag_log str ["backpacks",_backPackItems];
	diag_log ["weaponsItems:",_weapons];
	{
		_arr = _x;
		{
			_item = _x;
			_count = _arr select 1 select _foreachIndex;
			_clone addItemCargoGlobal [_item, _count];
		} forEach (_arr select 0);
	} forEach [_items,_mags];
	{
		_clone addWeaponWithAttachmentsCargoGlobal [_x,1];
	} forEach _weapons;

	if (count _containers != 0) then {
		{_clone addBackpackCargoGlobal [_x,1]} forEach _backPackItems;
		_backPacksClone = everyBackpack _clone;
		{
			_cloneContainer = _backPacksClone select _forEachIndex;
			diag_log "recurse into backpack";
			[_x,_cloneContainer] call IRN_fnc_cloneCrate;
		} forEach _containers;
	};



	



	_clone
};

//params: talker (unit receiving sound), index: 0 = player talking, 1 opz first (long) answer, 2 opz second (short) answer
IRN_fnc_sayRandom = {
	params ["_talker","_index"];
	//diag_log  str [ "sayRandom:",_talker,_index];
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