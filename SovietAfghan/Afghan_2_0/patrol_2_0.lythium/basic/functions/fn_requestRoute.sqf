params [
	["_caller",objNull,[objNull]]
];
if (isNull _caller) exitWith {
	["caller for route request is null."] call BIS_fnc_error;
};
//deactivate old route
_old = missionNamespace getVariable ["IRN_route_active",[]];
if (!(_old isEqualTo [])) then {
	[_old] call IRN_fnc_deactivateRoute;
};


//select random route
_routes = [] call IRN_fnc_getRoutes;
_newRoute = selectRandom _routes;
//diag_log["selected route: ",_newRoute];
[_newRoute] call IRN_fnc_activateRoute;