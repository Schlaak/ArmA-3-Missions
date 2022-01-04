params[
	["_pos",[],[[]],[3]],	//marker position.
	["_crates",[],[[]]],	//list of objects arrays, each presenting one crate
	["_radius",500,[0]]	//radius of placing crate
];

_crate = selectRandom _crates;	//array of objects

//get position in proximity to marker
_blacklist = [] call IRN_fnc_getHQs;
_pos = [[[_pos,_radius]],_blacklist] call BIS_fnc_randomPos;
_pos = [_pos, 1, 500, 10, 0, 0.25, 0] call BIS_fnc_findSafePos;
if (_pos isEqualTo getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition" )) exitWith {
	//return empty array
	[]
};
_anchor = selectRandom _crate;
[_anchor,_crate,_pos] call IRN_fnc_moveObjects;

//wake up objects
{
	_x enableSimulationGlobal true;
} forEach _crate;
diag_log["populated ",_pos, " with crate: ",_crate];

//return
_crate;

