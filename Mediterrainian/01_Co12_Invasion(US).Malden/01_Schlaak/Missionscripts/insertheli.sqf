_wppos = [getmarkerpos WP1, 10, 800, 20, 0, 0.3, 0] call BIS_fnc_findSafePos;
_wp = (group driver insertheli) addwaypoint [_wppos,0,1];
_helipad = "Land_HelipadEmpty_F" createVehicle _wppos;
_wp setWaypointType "TR UNLOAD";
_wp setWaypointStatements [" (allPlayers findIf {(_x in vehicle this) && alive _x} < 0)" 

," [['MI-8', 'Хорошо. Viel Glück da draußen! до скорого товарищ!']] remoteExec ['BIS_fnc_EXP_camp_playSubtitles', 0];
(group driver insertheli) addwaypoint [[0,0,0],0];
driver insertheli domove getmarkerpos 'respawn_east';
[insertheli] spawn {sleep 120;deletevehicle insertheli; deletevehicle (_this select 0) ;{deleteVehicle _x} foreach units group _this select 0;};
 "];