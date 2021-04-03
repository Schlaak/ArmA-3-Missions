/*
[] execVM "01_Schlaak\Missionscripts\PoI1.sqf";

*/


if (!isserver) exitwith {};	//only on server

//===============================
// Defining all the stuff.
//===============================
_TypePoi = "LocationCamp_F";	//define logic type for PoI´s
_PoIArray = Schlaak_PoI_2;


_anzahl = count _PoIArray;
_anzahlComp = _TypePoi countType (entities [[], ["Location"], true]);	//get all logics of the given type
//"LocationFOB_F" countType (entities [[], ["Location"], true]);
_comp = entities _TypePoi;
_compUsed = _comp;
_Schlaak_PoI_used = _PoIArray;
//"LocationFOB_F" countType (entities [[], ["Logic"], true]);

_mindist = (paramsArray select 14);
_maxdist = (paramsArray select 15);
_objdist = (paramsArray select 16);
//===============================
// Exitconditions
//===============================
if (_anzahl == 0) exitwith { sleep 3; [] execVM "01_Schlaak\Missionscripts\PoI3.sqf";};
if (_anzahlComp == 0) exitwith {sleep 3; [] execVM "01_Schlaak\Missionscripts\PoI3.sqf";};

//===============================
// call my fnc to attach synchedOBJ of logic to the logic.
//===============================
//parameters:
//_object 	= the object all the synched objects shall be rel.attached to
//_Sim		= enable simulation?
//_dynsim		= enable dynamic simulation?
//_DAM		= can these objects take damage?
{[_x,false,false,false] call SCHLAAK_fnc_attachsynchedObj} foreach (_comp);



//===============================
// The final loop to move all the shit around....
//===============================


for [{_i = count _compUsed}, {_i <= (count _compUsed)}, {_i=_i-1}] do	//for the count of compositions do all the stuff
{
	if (count _Schlaak_PoI_used <= 0) then 	//PoI-positions used up?
	{
		_Schlaak_PoI_used = _PoIArray;		// reset em then!
	};

	if (count _compUsed <= 0) exitWith {
		systemchat "PoI2: all comps moved!!!";	//all compositions placed? exit with! should be the normal exit!.
		sleep 3;
		[] execVM "01_Schlaak\Missionscripts\PoI3.sqf";				
		};


	_CompObj = selectrandom _comp;		// get one random coposition
	_compUsed = _compUsed - [_CompObj];	// make sure it does not use it twice


    _Helperobj = selectrandom _Schlaak_PoI_used;			//select some random poi.
	_Schlaak_PoI_used = _Schlaak_PoI_used - [_Helperobj];	//make sure one PoI only gets 1 Logic.


	_pos = getpos _Helperobj;		// get the anchor pos for where the composition will be moved.
	_finalpos = [_pos, _mindist, _maxdist, _objdist, 0, 0.3, 0] call BIS_fnc_findSafePos;	// get final pos


	if (isNil "_finalpos") then 	//debug if no savepos is found.
	{
		systemchat "POI2:get safe spawnpos failed!";
	};
	_CompObj setpos ( _finalpos);		// finaly move the shit
	_CompObj setVectorUp surfaceNormal _finalpos;

	sleep 0.2;		
	systemchat "PoI2: Moving!";	
	//systemchat format ["POI2: moved %1 to %2", getpos _Helperobj, _finalpos];	//report what has been moved.
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