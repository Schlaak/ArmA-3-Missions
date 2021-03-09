//FIXME broken, calls undefine function. 
//_staticsites = (synchronizedObjects RouteStaticsLog);
//_synchedstatics = count  (synchronizedObjects RouteStaticsLog);
//for [{_i=0}, {_i <= _synchedstatics}, {_i=_i+1}] do
//{
//    player globalChat format["Muell%1",_i];//
//	_site = (_staticsites select _i);//
//	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getmuellPos;//
//	[_site,_spawnPos,3] execvm "scripts\shk_moveobjects.sqf";//
//	sleep 1;
//};