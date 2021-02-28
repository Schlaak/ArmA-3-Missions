params ["_pos","_dir"];
_getDirCompass = {
	params ["_dir"];
	if (_dir < 0) then {
		_dir = _dir + (360 * (1 + (_dir % 360)));
	};
	if (_dir > 360) then {
		_dir = _dir - (360 * (1 + (_dir % 360)));
	};
	if (_dir == 360) then {
		_dir = 0;
	};
	//hint str _dir;
	_dir
};
_createDBMarker = {
	params ["_pos","_name"];
	//systemChat str ["markerpos",_pos,"markername",_name];
	_marker = createMarker [str time + selectRandom ["a","b","c","d","e"],_pos];
	_marker setMarkerType "hd_dot";
	_marker setMarkerText _name;
};
//get spawnpos: _pos - 5000m * dir
_pos = _pos vectorAdd [-25 + random 50,-25 + random 50,0];
_helper = "Land_HelipadEmpty_F" createVehicle _pos;
_spawnPos =  _helper getRelPos [5000,[_dir - 180] call _getDirCompass]; _spawnPos set [2,150 + (getTerrainHeightASL _spawnPos)];
_despawnPos = _helper getRelPos [10000,_dir];

//plane class:
_planeClass = "cwr3_o_su25";
_arr =
[
	_spawnPos,		//position
	_dir,				//direction
	_planeClass,			//type
	civilian				//side
] call BIS_fnc_spawnVehicle;
_plane = _arr select 0;
_crew = _arr select 1;
_grp = _arr select 2;
_plane setVelocityModelSpace [0, 100, 0]; //pushes car forward
_grp setBehaviour "careless";
_grp setCombatMode "BLUE";
_wp = _grp addWaypoint [_helper getRelPos [-2000,_dir],300,1,"move"];
_wp = _grp addWaypoint [_pos,0,2,"move"];
_wp = _grp addWaypoint [_despawnPos,0,3,"despawn"];
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "careless";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointStatements ["true", "deleteVehicle vehicle this; { deleteVehicle _x } forEach thisList;"];
_plane setCaptive true;
_plane flyInHeight 150;
//systemChat str ["spawn",_spawnPos,"_despawnPos",_despawnPos,"dir",_dir];
{
	_x addCuratorEditableObjects [[_plane], true];	
} forEach allCurators;
{
	//systemChat str _x;
	_x call _createDBMarker;
} forEach [[_spawnPos,"spawn"],[_despawnPos,"despawn"]];

//create bomb impact positions
_bombPosArr = [];
_offset = 50;
_bombCount = 5;
for "_i" from -0.5 *_bombCount to 0.5 *_bombCount do {
	_bombPos = _helper getRelPos [_offset * _i,_dir];
	_bombPos = _bombPos vectorAdd [-5 + random 10,-5 + random 10,0];
	_bombPos set [2,1 + (getTerrainHeightASL _bombPos)];
	_bombPosArr pushBack _bombPos;
};
//systemChat str _bombPosArr;
while {alive _plane} do {
	if (_plane distance2D _pos < 100) exitWith {
		//systemChat "bombs away";
		sleep 3;
		{
			[_x,str _forEachIndex] call _createDBMarker;
			//systemChat str ["bombpos: ",str _x];
			_bomb = "Bo_GBU12_LGB" createVehicle (_x vectorAdd [0,0,10]);
			_bomb setPosASL _x;
			{
				_x addCuratorEditableObjects [[_bomb], true];	
			} forEach allCurators;
			sleep random 0.5;
			//systemChat str _bomb;
		} forEach _bombPosArr;
		deleteVehicle _helper;
	};
	sleep 0.2;
}

    