sleep 4;
_getmuellPos = {
	params ["_centerPos","_2Param"];
	diag_log [_centerPos];
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


//_muellsites = (synchronizedObjects RouteMuellLog);
//_synchedobjects = count  (synchronizedObjects RouteMuellLog);
//for [{_i=0}, {_i <= _synchedobjects}, {_i=_i+1}] do
//{
//    player globalChat format["Muell%1",_i];
//	_site = (_muellsites select _i);
//	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getmuellPos;
//	[_site,_spawnPos,6] execvm "scripts\shk_moveobjects.sqf";
//	sleep 1;
//};