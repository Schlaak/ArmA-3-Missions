//activates given route, deactivates old ones
params[
	["_route",[],[[]]]
	];
if (_route isEqualTo []) exitWith {
	["given route is empty."] call BIS_fnc_error;
};

//diag_log ["route activated:",_route];

//activate new one
missionNamespace setVariable["IRN_route_active",_route,true];
{
	_x setMarkerAlpha 1;
} forEach _route;

//populate route
[_route,IRN_route_density] spawn IRN_fnc_populateRoute;