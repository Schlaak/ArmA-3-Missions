if (!isServer)  exitwith {};
_timeout = 10;
_ServerFPS = createMarker ["ServerFPS", [+0,+200,0]];
"ServerFPS" setMarkerColor "colorRED";
"ServerFPS" setMarkerType "KIA";
"ServerFPS" setMarkerAlpha 0.45;
for	"_i" from 0 to _timeout do {

	_debug = format ["Average FPS %1, min FPS %2", diag_fps,diag_fpsMin];
	"ServerFPS" setMarkerText _debug;
	sleep 5;
};