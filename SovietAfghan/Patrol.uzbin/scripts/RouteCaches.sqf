_getcachePos = {
	params ["_centerPos","_2Param"];
	//diag_log [_centerPos];
	_pos = [
		_centerPos, //position
		1,	//min distance
		150, //max distance
		5, //min object distance
		0, //water mode 0 = not in water
		0.7, //max gradient, 0.5 ca 30°
		0, //shoreMode does not have to be shore
		[], //blackList
		[0,0,0] //default pos, returned if fails
	] call BIS_fnc_findSafePos;
	if (_pos isEqualTo [0,0,0]) then {
		systemChat "failed to find position";
		diag_log ["failed to find position for ", _centerPos];
	};
	//isNil
	_pos //return
};
//position of templates to be teleported to desired pos.
_cacheTemplates = [[11749.2,12240.7,0],[11851.4,12243.7,0],[11954,12246.8,0],[11750.6,12145,0],[11852.9,12133.3,0],[11951.2,12146.3,0],[11952.3,12052.3,0],[11850.9,12049,0],[11750.8,12048.8,0]];
_cacheAmount = 3 + random 9;
diag_log ["placing",_cacheAmount,"caches"];

for "_i" from 0 to _cacheAmount do {
	//template
	if (count _cacheTemplates == 0) exitWith {
		diag_log ["weapon cache placement failed, no available templates left"];
	};
	_cache = selectrandom _cacheTemplates;
	_cacheTemplates = _cacheTemplates - [_cache];

	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getcachePos;
	[_cache,_spawnPos,50] execvm "scripts\shk_moveobjects.sqf";

	diag_log ["placed cache from ",_cache," remaining templates: ",_cacheTemplates, " at spawnpos ",_spawnPos];

//	_marker1 = createMarker ["cache" + str time, _spawnPos];
//	_marker1 setMarkerType "hd_warning";
//	_marker1 setMarkerText "Cache!!!";
};