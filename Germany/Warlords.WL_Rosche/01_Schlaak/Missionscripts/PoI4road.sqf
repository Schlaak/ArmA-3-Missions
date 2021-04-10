/*
[] execVM "01_Schlaak\Missionscripts\PoI4road.sqf";

*/


if (!isserver) exitwith {};	//only on server

//===============================
// Defining all the stuff.
//===============================
_TypePoi = "LocationOutpost_F";	//define logic type for PoI´s
_PoIArray = Schlaak_PoI_4;


_anzahl = count _PoIArray;
_anzahlComp = _TypePoi countType (entities [[], ["Location"], true]);	//get all logics of the given type
//"LocationFOB_F" countType (entities [[], ["Location"], true]);
_comp = entities _TypePoi;
_compUsed = _comp;
_Schlaak_PoI_used = _PoIArray;
//"LocationFOB_F" countType (entities [[], ["Logic"], true]);

_mindist = (paramsArray select 17);
_maxdist = (paramsArray select 18);
_objdist = (paramsArray select 19);
//===============================
// Exitconditions
//===============================
if (_anzahl == 0) exitwith {};
if (_anzahlComp == 0) exitwith {};


//===============================
// call my fnc to attach synchedOBJ of logic to the logic.
//===============================
//parameters:
//_object 	= the object all the synched objects shall be rel.attached to
//_Sim		= enable simulation?
//_dynsim		= enable dynamic simulation?
//_DAM		= can these objects take damage?
{[_x,false,false,false] call SCHLAAK_fnc_attachsynchedObj} foreach (_comp);



sleep 2;
systemChat "================";
systemchat "POI4: EXECUTING!";
systemChat "================";
sleep 1;

for [{_i = 0}, {_i <= _anzahlComp}, {_i=_i+1}] do {

	systemChat "POI4: Loop";
	systemchat str _i;
	_compOBJ = (_comp select _i);

	_Helperobj = selectrandom _PoIArray;
	_pos = getpos _Helperobj;		
	_finalpos1 = [_pos, _mindist, _maxdist, _objdist, 0, 0.3, 0] call BIS_fnc_findSafePos;	// get final pos

	sleep 0.5;
	_finalpos = [ _finalpos1, 2200] call BIS_fnc_nearestRoad;
	_vectorpos = getpos _finalpos;


	if (isNil "_finalpos") then 	//debug if no savepos is found.
	{
		systemchat "POI4:get safe spawnpos failed!";
	};

	sleep 0.2;
	_road = roadAt _finalpos;
	_info = getRoadInfo _road;
	_dir = (_info select 6) getDir (_info select 7);

	sleep 0.1;
	(_comp select _i) setdir _dir;
	(_comp select _i) setpos ( getpos _finalpos);		// finaly move the shit
	sleep 0.2;
	(_comp select _i) setVectorUp surfaceNormal  (position _road);
	sleep 0.2;
	_compOBJ setVectorUp surfaceNormal position _finalpos;
	(_comp select _i) setVectorUp surfaceNormal _vectorpos;
	
	sleep 0.5;
};
sleep 2;
systemChat "================";
systemchat "POI4: DONE!";
systemChat "================";

sleep 3;
if (true) exitwith {
[] execvm "01_Schlaak\Missionscripts\SpawnHostiles.sqf";
}

















// LEGACY BELOW

//===============================
// The final loop to move all the shit around....
//===============================
/*

for [{_i = count _compUsed}, {_i <= (count _compUsed)}, {_i=_i-1}] do	//for the count of compositions do all the stuff
{




	_CompObj = selectrandom _comp;		// get one random coposition
	_compUsed = _compUsed - [_CompObj];	// make sure it does not use it twice


	if (count _compUsed <= 0) exitWith {
		systemchat "PoI4: all comps moved!!!";	//all compositions placed? exit with! should be the normal exit!.
		sleep 3;
		[] execvm "01_Schlaak\Missionscripts\SpawnHostiles.sqf";			
		};


	sleep 0.2;
    _Helperobj = selectrandom _Schlaak_PoI_used;			//select some random poi.
	_Schlaak_PoI_used = _Schlaak_PoI_used - [_Helperobj];	//make sure one PoI only gets 1 Logic.

	if (count _Schlaak_PoI_used == 0) then 	//PoI-positions used up?
	{
		_Schlaak_PoI_used = _PoIArray;		// reset em then!
	};


	sleep 0.2;
	_pos = getpos _Helperobj;		// get the anchor pos for where the composition will be moved.
	_finalpos1 = [_pos, _mindist, _maxdist, _objdist, 0, 0.3, 0] call BIS_fnc_findSafePos;	// get final pos


	_finalpos = [ _finalpos1, 1200] call BIS_fnc_nearestRoad;

	if (isNil "_finalpos") then 	//debug if no savepos is found.
	{
		systemchat "POI4:get safe spawnpos failed!";
	};

	sleep 0.2;
	_road = roadAt _finalpos;
	_info = getRoadInfo _road;
	_dir = (_info select 6) getDir (_info select 7);


	_CompObj setpos (getpos _finalpos);		// finaly move the shit
	_CompObj setdir _dir;
	_CompObj setVectorUp surfaceNormal position _finalpos;

	sleep 0.2;	
	systemchat "PoI4: Moving!";	
	//systemchat format ["POI3: moved %1 to %2", getpos _Helperobj, _finalpos];	//report what has been moved.
};



/*
_array = [1,2,3,4];	
_element = selectRandom _array;
_array = _array - [_element];	//substract from array ^^

//classes of logics from locations.
LocationRespawnPoint_F
LocationBase_F
LocationVillage_F
LocationEvacPoint_F
LocationFOB_F
LocationArea_F
LocationCamp_F
LocationResupplyPoint_F
LocationCity_F
LocationCityCapital_F
LocationOutpost_F