/*
Place trigger with the code to spawn number of goats to roam around a position

place in gamelogics init:
_nullgoaters = [this, 3] execvm "scripts\GoatGroup.sqf";
*/
if (!isServer)  exitwith {};




// initialize vars
private ["_Logic", "_Goatnumber","_i"];
_Logic = _this select 0;
_Goatnumber = _this select 1;


// create the group and number of goats
_goatgroup = creategroup civilian;
for	"_i" from 0 to _Goatnumber do {
_goatgroup createUnit ["Goat_random_F", [position _Logic, (random 15) +5 ,random 360] call BIS_fnc_relPos,[],0,"NONE"];

								};
// Set waypoints
sleep 5;
_wp1 = _goatgroup addwaypoint [position _Logic, 5];
_wp1 setWaypointType "Dismiss";
_wp2 = _goatgroup addwaypoint [position _Logic, 5];
_wp2 setWaypointType "CYCLE";
[_goatgroup,0] setWaypointtimeout [6,9,12];
[_goatgroup,1] setWaypointtimeout [6,9,12];