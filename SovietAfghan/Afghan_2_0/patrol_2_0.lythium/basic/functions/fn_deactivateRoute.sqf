//deactivates route
params[
	["_route",[],[[]]]
];
if (_route isEqualTo []) exitWith {
	["can not deactivate route, is null"] call BIS_fnc_error;
};
//get hashmap
_hm = missionNamespace getVariable ["IRN_route_HM",nil];
if (isNil "_hm") exitWith {
	["Units hashmap is nil, cant access to deactivate."] call BIS_fnc_error;
};
_routeName = markerText (_route select {markerType _x == "mil_start"} select 0);

//delete remaining groups on route
_enemies = _hm getOrDefault [_routeName,[]];
//diag_log["deleting ",count _enemies," groups for route ",_routeName];
{
	deleteVehicle _x; 
} forEach _enemies;
_hm set [_routeName,[]];

//make markers invisible
{
	_x setMarkerAlpha 0;
} forEach _route;