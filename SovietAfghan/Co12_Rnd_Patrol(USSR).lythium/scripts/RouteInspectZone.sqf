sleep 4;
for [{_i=0}, {_i <= (floor random 3)}, {_i=_i+1}] do
{
    player globalChat format["Marker%1",_i];
	
	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers),random 400, random 360] call BIS_fnc_relPos;
	_mrkr = createMarker [(format ["inspect%1",_i]), _spawnPos];
	_mrkr setMarkerShape "ELLIPSE";
	_mrkr setmarkerbrush "Vertical";
	_mrkr setmarkercolor "colorred";
	_mrkr setMarkerSize [250,250];
};

