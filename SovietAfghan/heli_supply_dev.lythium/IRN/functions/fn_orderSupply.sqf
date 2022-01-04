/*
	Author: IR0NSIGHT

	Description:
	Will order the specified helicopter to airlift the given supply crate to a selfchosen LZ near given pos.

	Parameter(s):
		0 :
			OBJECT - caller (for position)
		1 :
			OBJECT - container to be transported (must be airliftable)
		2 :
			BOOLEAN - directly to caller (true) or nearby safe LZ (false)
		3 :
			STRING - name to use for marking the LZ

	Returns:
	none
*/
//TODO replace caller with position of _caller
params["_caller","_crate","_precise","_markername"];

if (!isServer) exitWith {
	["local call not allowed. called on non-server-machine with: %1",_this]; call BIS_fnc_error;
};

if (isNull _caller || isNull _crate) exitWith {
	["caller or original container is null: %1",_this]; call BIS_fnc_error;
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
_helo = supply_helo_01;	//TODO make into function parameter
_airport = airport_01; //TODO make into function parameter
_var = _helo getVariable "RTB";
if (isNil "_var") then {
	[getPos _airport,"heliport"]call IRN_fnc_marker;
	diag_log ["heliport marker created"];
};
//-------------------------------------------------------------------------- !var declaration
//flying and transported crate != wanted crate -> helo busy, no supply available.
if (count ropeAttachedObjects _helo == 0 AND !(_helo getVariable ["RTB",true])) exitWith { //wenn helo nicht bereit, und keine last -> rückweg.
	systemChat "Keine Versorgung möglich. Helikopter ist nicht verfügbar.";
	//abort
};
//asserted: helo does not have fly order OR the new order is about the same crate.


_lzObj = [_caller,_precise,_markername] call _getLZ; //will spawn LZ.
if ((_helo getVariable ["RTB",true]) && count ropeAttachedObjects _helo == 0) then { //only attach crate, if helo doesnt have one yet and is at base.
	_crate = [_crate] call IRN_fnc_cloneContainer;
	[_helo,_crate] call _prepareHelo; //will attach cargo to helo
	systemChat "Auftrag erhalten. Helikopter auf dem Weg.";
} else {
	systemChat "Neue Landezone wird gesucht.";
};
[_helo,_lzObj,_airport] call _orderHeloToLZ;
_helo setVariable ["RTB",false,true]; //mark as busy
//systemChat "marking as RTB: false";


