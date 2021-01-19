if (!isServer)  exitwith {};


_UnitsOnMapIndicationMarker = createMarker ["UnitsOnMapIndicationMarker", [+0,+100,0]];
"UnitsOnMapIndicationMarker" setMarkerColor "colorRED";
"UnitsOnMapIndicationMarker" setMarkerType "KIA";
"UnitsOnMapIndicationMarker" setMarkerAlpha 0.45;
_timeout = 10;
for	"_i" from 0 to _timeout do {
	_simCount = {alive _x} count allUnits;
	_debug = format ["Units alive: %1", _simCount];
	"UnitsOnMapIndicationMarker" setMarkerText _debug;
	sleep 5;
};