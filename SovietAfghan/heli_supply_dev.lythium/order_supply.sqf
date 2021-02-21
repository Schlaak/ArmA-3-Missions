//[caller,radiusfree] execVM order_supply.sqf
//heli used is: supply_helo_01, the helipad at which helo will land after RTB is airport_01.

params["_caller","_crate","_precise"];

//get suitable LZ near player
_getLZ = {
	params["_caller","_precise","_pos"];
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
	_marker setMarkerText "supply drop";
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
	_helo enableRopeAttach true;
	_crate enableRopeAttach true;

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
	params ["_helo","_lzObj"];

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
	
	[_helo,_grp,_wp select 1,_airport] spawn { //delayed landing order at airport
		params ["_helo","_grp","_wpIdx","_airport"];
		waitUntil {
			sleep 5; 
			_idxCurrent = currentWaypoint _grp;
			(_wpIdx < _idxCurrent)
		};	
		//_handle = [_grp, getPos _airport, _airport] spawn BIS_fnc_wpLand;
		_helo land "LAND";
		waitUntil {
			sleep 5;
		//	systemChat str ["helo landed: ", (((getPosATL _helo) select 2) < 1)];
			 (((getPosATL _helo) select 2) < 1)
		};
		_helo setVariable ["RTB",true,true];
	};
};
//-------------------------------------------------------------------------- !method declaration, var declaration
_helo = supply_helo_01;
_airport = airport_01;
//-------------------------------------------------------------------------- !var declaration
clearItemCargoGlobal _crate;

//flying and transported crate != wanted crate -> helo busy, no supply available.
if (!((count ropeAttachedObjects _helo == 0 AND _helo getVariable ["RTB",true]) OR _crate in (ropeAttachedObjects _helo))) exitWith {
	systemChat "no supply available, helo is busy.";
	//abort
};
//asserted: helo does not have fly order OR the new order is about the same crate.



_lzObj = [_caller,_precise] call _getLZ; //will spawn LZ.
if ((_helo getVariable ["RTB",true]) && count ropeAttachedObjects _helo == 0) then { //only attach crate, if helo doesnt have one yet and is at base.
	[] call _prepareHelo; //will attach cargo to helo
	systemChat "taking order, supply helo dispatched.";
} else {
	systemChat "redirecting to new LZ."
};
[_helo,_lzObj] call _orderHeloToLZ;
_helo setVariable ["RTB",false,true]; //mark as busy
//systemChat "marking as RTB: false";
