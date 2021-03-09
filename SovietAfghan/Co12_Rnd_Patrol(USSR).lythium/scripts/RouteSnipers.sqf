//_snipersites = (synchronizedObjects RouteSniperLogic);
//_snipercount = count (synchronizedObjects RouteSniperLogic);
//for [{_i=0}, {_i <= _snipercount}, {_i=_i+1}] do
//{
//    //player globalChat format["%1",_i];
//	_site = (_snipersites select _i);
//	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getcachePos;
//	[_site,_spawnPos,2] execvm "scripts\shk_moveobjects.sqf";
//};
//FIXME calls undefined function.
