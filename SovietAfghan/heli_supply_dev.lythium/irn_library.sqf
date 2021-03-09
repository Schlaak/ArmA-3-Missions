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
_auto = createVehicle ["offoradalsg",getPos player];

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
//create marker [pos,(defualt "")text,(default hd_dot)type]
IRN_fnc_createMarker = {
	params ["_pos","_name","_type"];
	if (isNil "_name") then {
		_name = "";
	};
	if (isNil "_type") then {
		_type = "hd_dot";
	};
	_marker = createMarker [str time + selectRandom ["a","b","c","d","e"],_pos];
	_marker setMarkerType _type;
	_marker setMarkerText _name;
	_marker
};

IRN_fnc_getDir = {
	params ["_from","_to"];
	_dir = vectorNormalized (_to vectorDiff _from);
	_dir
};

//will init a loop for given drone
IRN_fnc_droneCycle = {
	params ["_drone","_type"];
	diag_log ["this",_this];
	if (isNil "_type") then {
		_type = "init";
		_hasCycle = _drone getVariable ["irn_dronecyle",false];
		if (_hasCycle) exitWith {
			systemChat "drone has cylce already, exitting"
		};
	};
	_drone setVariable ["irn_dronecyle",true,true];

	//delete all old waypoints
	_grp = group currentPilot _drone;
	for "_i" from count waypoints _grp - 1 to 0 step -1 do
	{
		deleteWaypoint [_grp, _i];
	};
	_drone flyInHeightASL [2500,2500,4000];

	if (_type == "init") then {
		_drone setVariable ["irn_droneAmmo",6];
		_drone setFuel 1;

		_loiter = _grp addWaypoint [getPos player, 0, 1, "loiter"];
		_loiter setWaypointType "LOITER";
		_loiter setWaypointLoiterRadius 1000;
		_loiter waypointAttachVehicle player;
		waitUntil {
			sleep 10;
			(_drone getVariable ['irn_droneAmmo',6] <= 0 || (fuel _drone < 0.2))
		};
		systemChat "drone out of ammo or fuel, calling RTB";
		[_drone,"RTB"] call IRN_fnc_droneCycle;
	};

	if (_type == "RTB") then {
		_rtb = _grp addWaypoint [[0,0,0], 0, 1, "RTB"];
		_rtb setWaypointCompletionRadius 1000;
		_rtb setWaypointStatements ["true", "[(vehicle this),'init'] spawn IRN_fnc_droneCycle; systemChat 'RTB successful'"];
	};





	


};

//params["_caller","_crate","_precise","_markername"];
IRN_fnc_orderSupply = {
	params["_caller","_crate","_precise","_markername"];
	if (!isServer) exitWith {
		diag_log ["someone tried calling helo supply on non-server-machine with: ",_this];
	};
	diag_log ["order supply was called with: ",_this];
	//get suitable LZ near player
	_getLZ = {
		params["_caller","_precise","_markername","_pos"];
		if (_precise) then {
			if ([] isEqualType _caller) then {
				_pos = _caller;
			} else {
				_pos = getPos _caller;
			};
		} else {
			_pos = [_caller, 1, 1000, 25, 0, 0.3, 0] call BIS_fnc_findSafePos; //TODO blacklist areas near enemys
		};
		_marker = createMarker [str time,_pos];
		_marker setMarkerType "hd_pickup";
		if (isNil "_markername") then {
			_markername = "supply drop";
		};
		_marker setMarkerText _markername;
		_lzObj = "Land_HelipadEmpty_F" createVehicle _pos;
		[_marker,_lzObj] spawn { //delayed kill
			params["_marker","_lzObj"];
			sleep 500;//3 mins
			deleteMarker _marker;
			deleteVehicle _lzObj;
		};
		_lzObj
	};
	//will set helos variable to true and attach cargo to it.
	_prepareHelo = {
		params ["_helo","_crate"];
		_helo enableRopeAttach true;
		_crate enableRopeAttach true;
		diag_log ["helo",_helo,"crate",_crate];
		[_helo,_crate] spawn { //Delayed attach to ropes: only above 15m ATL
			params ["_helo","_crate"];
			waitUntil {
				(((getPosATL _helo) select 2) >= 15)
			};
			_helo setSlingLoad _crate;
		//	systemChat str ["attached object:",ropeAttachedObjects _helo];
		};
	};
	//will add waypoints for given Helo to drop supply at LZ + RTB
	_orderHeloToLZ = {
		params ["_helo","_lzObj","_airport"];

		_pilot = currentPilot _helo;
		_grp = group _pilot;
		//kill of all waypoints;
		for "_i" from count waypoints _grp - 1 to 0 step -1 do
		{
			deleteWaypoint [_grp, _i];
		};
		//start moving towards LZ (might be unnecessary)
		_wp = _grp addWaypoint [getPos _lzObj,0,1,"move"];
		_wp setWaypointCompletionRadius 1000;

		//drop off slingload at LZ
		_wp = _grp addWaypoint [getPos _lzObj,0,2,"droppoint"];
		_wp setWaypointType "unhook";
		_wp waypointAttachVehicle _lzObj;

		//RTB, afterwards land at airport obj.
		_wp = _grp addWaypoint [getPos _airport,0,3,"RTB"];
		_wp setWaypointStatements ["true","(vehicle this) land 'LAND'; (vehicle this) setVariable ['RTB',true,true];"];
	};

	//-------------------------------------------------------------------------- !method declaration, var declaration
	_helo = supply_helo_01;
	S_H_1 = _helo;	//debug var
	_airport = airport_01;
	_var = _helo getVariable "RTB";
	if (isNil "_var") then {
		[getPos _airport,"heliport"]call IRN_fnc_createMarker;
		diag_log ["heliport marker created"];
	};
	//-------------------------------------------------------------------------- !var declaration
	sleep 4;
	//flying and transported crate != wanted crate -> helo busy, no supply available.
	if (count ropeAttachedObjects _helo == 0 AND !(_helo getVariable ["RTB",true])) exitWith { //wenn helo nicht bereit, und keine last -> rückweg.
		systemChat "Keine Versorgung möglich. Helikopter ist nicht verfügbar.";
		//abort
	};
	//asserted: helo does not have fly order OR the new order is about the same crate.


	_lzObj = [_caller,_precise,_markername] call _getLZ; //will spawn LZ.
	if ((_helo getVariable ["RTB",true]) && count ropeAttachedObjects _helo == 0) then { //only attach crate, if helo doesnt have one yet and is at base.
		_crate = [_crate] call IRN_fnc_cloneCrate;
		[_helo,_crate] call _prepareHelo; //will attach cargo to helo
		systemChat "Auftrag erhalten. Helikopter auf dem Weg.";
	} else {
		systemChat "Neue Landezone wird gesucht.";
	};
	[_helo,_lzObj,_airport] call _orderHeloToLZ;
	_helo setVariable ["RTB",false,true]; //mark as busy
	//systemChat "marking as RTB: false";
};