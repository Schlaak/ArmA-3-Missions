if (!isServer)  exitwith {};
_UnitsSimulatedIndicationMarker = createMarker ["UnitsSimulatedIndicationMarker", [0,0,0]];
"UnitsSimulatedIndicationMarker" setMarkerColor "colorRED";
"UnitsSimulatedIndicationMarker" setMarkerType "KIA";
"UnitsSimulatedIndicationMarker" setMarkerAlpha 0.45;
_timeout = 10;
for	"_i" from 0 to _timeout do {
	_simCount = {(alive _x) && (simulationEnabled _x)} count allUnits;
	_debug = format ["Simulated units: %1", _simCount];
	"UnitsSimulatedIndicationMarker" setMarkerText _debug;
	sleep 5;
};
sleep 30;
if (true) exitwith {};