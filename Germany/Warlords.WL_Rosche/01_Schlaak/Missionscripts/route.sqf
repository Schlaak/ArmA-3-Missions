
if (!isserver) exitwith {};
//================================
// DEFINING STUFF
//================================
_route1mrks = [];
_route2mrks = [];
_route3mrks = [];
_route4mrks = [];
_route5mrks = [];
_route6mrks = [];
_route7mrks = [];
_route8mrks = [];
_route9mrks = [];
_routeAllmrks = [_route1mrks,_route2mrks,_route3mrks,_route4mrks,_route5mrks,_route6mrks];//_route7mrks,_route8mrks,_route9mrks];
//================================
// PUSH MARKERS TO routXmrk-ARRAYS
//================================
for "X" from 0 to 4 do {
	_route1mrks pushBack (format ["R1_%1", X]);
	_route2mrks pushBack (format ["R2_%1", X]);
	_route3mrks pushBack (format ["R3_%1", X]);
	_route4mrks pushBack (format ["R4_%1", X]);
	_route5mrks pushBack (format ["R5_%1", X]);
	_route6mrks pushBack (format ["R6_%1", X]);
	_route7mrks pushBack (format ["R7_%1", X]);
	_route8mrks pushBack (format ["R8_%1", X]);
	_route9mrks pushBack (format ["R9_%1", X]);
	sleep 0.3;
	systemChat str X;
	};



//================================
// NAME THE MARKERS ACCORDING TO MAPGRIDPOS
//================================
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route1mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route2mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route3mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route4mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route5mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route6mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route7mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route8mrks;
{_x setMarkerText (str (mapgridposition getmarkerpos _x))} foreach _route9mrks;


//================================
// SET MARKER ALPHA
//================================
{_x setmarkeralpha 0} forEach _route1mrks;
{_x setmarkeralpha 0} forEach _route2mrks;
{_x setmarkeralpha 0} forEach _route3mrks;
{_x setmarkeralpha 0} forEach _route4mrks;
{_x setmarkeralpha 0} forEach _route5mrks;
{_x setmarkeralpha 0} forEach _route6mrks;
{_x setmarkeralpha 0} forEach _route7mrks;
{_x setmarkeralpha 0} forEach _route8mrks;
{_x setmarkeralpha 0} forEach _route9mrks;
//================================
// SET MARKER ALPHA
//================================

//_routeAllmrks
_routeAllPOIs = [Schlaak_PoI_4,Schlaak_PoI_3,Schlaak_PoI_2,Schlaak_PoI_1];



//_routeFinal = _route1mrks; // TODO: still hardcoded... improve!
_routeFinal = selectrandom _routeAllmrks;
{_x setmarkeralpha 1} forEach _routeFinal;

systemchat "========================";
systemchat "ROUTE.SQF: Loop 1";
systemchat "========================";
for "_i" from 0 to  floor (count Schlaak_PoI_1) do {
systemchat str _i;

sleep 0.5;
(Schlaak_PoI_1 select _i) setpos [(getmarkerpos (selectrandom _routeFinal) select 0) + random 300,(getmarkerpos (selectrandom _routeFinal) select 1) + random 300,(getmarkerpos (selectrandom _routeFinal) select 2)];

};

systemchat "========================";
systemchat "ROUTE.SQF: Loop 1 - DONE!";
systemchat "========================";
sleep 2;


systemchat "========================";
systemchat "ROUTE.SQF: Loop 2";
systemchat "========================";
for "_i" from 0 to  floor (count Schlaak_PoI_2) do {
systemchat str _i;

sleep 0.5;
(Schlaak_PoI_2 select _i) setpos [(getmarkerpos (selectrandom _routeFinal) select 0) + random 300,(getmarkerpos (selectrandom _routeFinal) select 1) + random 300,(getmarkerpos (selectrandom _routeFinal) select 2)];

};

systemchat "========================";
systemchat "ROUTE.SQF: Loop 2 - DONE!";
systemchat "========================";
sleep 2;


systemchat "========================";
systemchat "ROUTE.SQF: Loop 3";
systemchat "========================";
for "_i" from 0 to  floor (count Schlaak_PoI_3) do {
systemchat str _i;

sleep 0.5;
(Schlaak_PoI_3 select _i) setpos [(getmarkerpos (selectrandom _routeFinal) select 0) + random 300,(getmarkerpos (selectrandom _routeFinal) select 1) + random 300,(getmarkerpos (selectrandom _routeFinal) select 2)];

};

systemchat "========================";
systemchat "ROUTE.SQF: Loop 3 - DONE!";
systemchat "========================";
sleep 2;

systemchat "========================";
systemchat "ROUTE.SQF: Loop 4";
systemchat "========================";
for "_i" from 0 to  floor (count Schlaak_PoI_4) do {
systemchat str _i;

sleep 0.5;
(Schlaak_PoI_4 select _i) setpos [(getmarkerpos (selectrandom _routeFinal) select 0) + random 300,(getmarkerpos (selectrandom _routeFinal) select 1) + random 300,(getmarkerpos (selectrandom _routeFinal) select 2)];

};

systemchat "========================";
systemchat "ROUTE.SQF: Loop 4 - DONE!";
systemchat "========================";
sleep 2;

systemChat "================";
systemChat "Route.sqf: Done";
systemChat "================";



WP1 =_routeFinal select 0;
publicVariable "WP1";

if (true ) exitWith {[] execVM "01_Schlaak\Missionscripts\PoI1.sqf";	};






/*
LEGACY BELOW!



//================================
// Main loop for all pois
//================================

_PoIArray = _routeAllPOIs select _i;	//PoI array.... 


sleep 0.5;
systemchat "========================";
systemchat str _PoIArray;
systemchat "========================";
sleep 0.5;
//if (! isNil "_PoIArray") then {
							//TODO: need to unhardcode it!
_anzahl = count _PoIArray;	// count. used as number of loops to do.
//} else {
//	_anzahl = 1;
//};

_routeFinal2 = _routeFinal;	// copy of route final to be able to reset it within the loop below.

systemchat "Route.sqf: premoving!";
systemchat str _anzahl;
//_helper = selectrandom _PoIArray;

//================================
// SECONDARY LOOP
//================================
for "_y" from 0 to _anzahl do {
	
	
	_mrk = (selectRandom _routeFinal2);	// select random marker from route final 2
	//_routeFinal2 = _routeFinal2 - [_mrk];	// yo, we dont need that one until...
	if (count _routeFinal2 == 0) then {_routeFinal2 = _routeFinal};	//loop would still be going but no mrk left? reset!
	//if (count _PoIArray == 0) then {_PoIArray = _routeAllPOIs};



	sleep 0.3;
	//_finalpos = [getmarkerpos _mrk, 10, 800, 5, 0, 0.3, 0] call BIS_fnc_findSafePos;	// get final pos
	_finalpos = [((getmarkerpos _mrk) select 0 )+ (random 450),((getmarkerpos _mrk) select 1) + (random 450),0];
	sleep 0.3;
	_helper = selectrandom _PoIArray;		// get one random helper

	systemchat str _mrk;

	//_PoIArray = _PoIArray - [_helper];		// remove helper from array as it has already been moved.
	sleep 0.3;
	_helper setpos _finalpos;
	//systemchat str ((_helper) + ("moved to:") + (mapgridposition _finalpos));
};

};

systemChat "================";
systemChat "Route.sqf: Done";
systemChat "================";
[] execVM "01_Schlaak\Missionscripts\PoI1.sqf";	


WP1 =_routeFinal select 0;
publicVariable "WP1";

// !(allPlayers findIf {(_x in vehicle this) && alive _x} < 0) //WARTE BIS ALLE DRINNE
//	(allPlayers findIf {(_x in vehicle this) && alive _x} == count allplayers) 

//  (allPlayers findIf {(_x in vehicle this) && alive _x} < 0) // WARTE BIS ALLE RAUS


//sleep 120;
/*
{ deleteVehicle (vehicle _x) }forEach units (group insertheli);
{ deleteVehicle _x }forEach units (group insertheli);
deleteVehicle insertheli;
*/



/*


for "X" from 1 to 20 do {
	_route3mrks pushBack ("Route3");
	_route3mrks pushBack (format ["Route3_%1", X]);
	};
for "X" from 1 to 20 do {
	_route4mrks pushBack ("Route4");
	_route4mrks pushBack (format ["Route4_%1", X]);
	};
for "X" from 1 to 20 do {
	_route5mrks pushBack ("Route5");
	_route5mrks pushBack (format ["Route5_%1", X]);
	};
for "X" from 1 to 20 do {
	_route6mrks pushBack ("Route6");
	_route6mrks pushBack (format ["Route6_%1", X]);
	};
for "X" from 1 to 20 do {
	_route7mrks pushBack ("Route7");
	_route7mrks pushBack (format ["Route7_%1", X]);
	};
for "X" from 1 to 20 do {
	_route8mrks pushBack ("Route8");
	_route8mrks pushBack (format ["Route8_%1", X]);
	};
for "X" from 1 to 20 do {
	_route9mrks pushBack ("Route9");
	_route9mrks pushBack (format ["Route9_%1", X]);
	};



*/