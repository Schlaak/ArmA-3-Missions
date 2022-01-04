//populates route with enemies and crates and stuff
params [
	["_route",[],[[]]],
	["_enemyDensity",1,[1]] //optional, defaults to 1 enemy group per marker
];
if (_route isEqualTo []) exitWith {
	["route to populate is null"] call BIs_fnc_error;
};
if (_enemyDensity <= 0) then {
	["route populated without enemies!"] call BIs_fnc_error;
};

//diag_log["populating route with density: ",_enemyDensity];
_searchMarkers = (_route select {markerType _x == "mil_unknown";}); //? marker

//spawn a bunch of enemy groups, equally over all markers
_allMarkers = _route call BIS_fnc_arrayShuffle;
_enemies = [];
_totalCount = 0;
_totalGroups = 0;

_crates = [] call IRN_fnc_getCrates;
{
	_marker = _x;
	//spawn a bunch of random units around marker
	_enemies = _enemies + ([getMarkerPos _marker,_enemyDensity,500,[0,1,2]] call IRN_fnc_populateUnits);

	//TODO spawn event stuff (downed heli etc)
	if (!(_crates isEqualTo [])) then {
		diag_log["getting crate for marker ",_marker];
		_crate = [getMarkerPos _marker, _crates, 500] call IRN_fnc_populateCrates;
		_crates = _crates - [_crate];
	}

	//TODO spawn roadblocks

	//TODO spawn friendly units

	//TODO spawn animals
} forEach _allMarkers;
//diag_log["enemy groups for route: ",_enemies];
//diag_log["spawned ",_totalGroups,"groups for ",count _allMarkers," totalling ",_totalCount," soldiers"];

//update global hashmap
_hm = missionNamespace getVariable ["IRN_route_HM",nil];
if (isNil "_hm") exitWith {
	["Units hashmap is nil, cant write spawned groups to route."] call BIS_fnc_error;
};
_routeName = markerText (_route select {markerType _x == "mil_start"} select 0);
_hm set [_routeName,_enemies];
//diag_log["set HM value for route: ",_routeName];

//on road pos:
//randomRoadPosAroundPlayer = [[[position player,50]],[], {isOnRoad _this}] call BIS_fnc_randomPos;