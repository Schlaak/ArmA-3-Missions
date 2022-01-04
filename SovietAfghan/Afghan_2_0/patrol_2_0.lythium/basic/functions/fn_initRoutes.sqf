//hides all route markers. adds "get route assigned" action to HQ car
_routes = [] call IRN_fnc_getRoutes;
{
	_route = _x;
	{ //foreach marker in route folder
		_marker = _x;
		//diag_log["hiding marker: ",_marker];
		_marker setMarkerAlpha 0;
	} forEach _route;
} forEach _routes;

//initialize global hashmap, maps name vs enemy groups there
_hm = createHashMap;
missionNamespace setVariable ["IRN_route_HM",_hm];

//add action for route selection to this vehicle
["cwr3_o_ural_hq"] call irn_fnc_initGetterRoute;