//DONT USE BROKEN; CRASHES ARMA


params[
	["_units",[],[[]]],
	["_primaryWeapon",true,[true]],
	["_secondaryWeapon",true,[true]],
	["_handgunWeapon",true,[true]],

	["_uniform",true,[true]],
	["_vest",true,[true]],
	["_backpack",true,[true]],

	["_helmet",true,[true]],
	["_facewear",true,[true]]
];
if (_units isEqualTo []) exitWith  {
	["units is null, cant collect loadouts."] call BIS_fnc_error;
};
_primaryWeapons = createHashMap;
_secondaryWeapons = createHashMap;
_handgunWeapons = createHashMap;
_uniforms = createHashMap;
_vests = createHashMap;
_backpacks = createHashMap;
_helmets = createHashMap;
_facewears = createHashMap;

private ["_loadout"];
_guns = [];
if (_primaryWeapon) then {_guns pushBack [_primaryWeapons,0]};
if (_secondaryWeapon) then {_guns pushBack [_secondaryWeapons,1]};
if (_handgunWeapon) then {_guns pushBack [_handgunWeapons,2]};

_clothes = [];
if (_uniform) then {_clothes pushBack [_uniforms,3]};
if (_vest) then {_clothes pushBack [_vests,4]};
if (_backpack) then {_clothes pushBack [_backpacks,5]};

_headwear = [];
if (_helmet) then {_headwear pushBack [_helmets,6]};
if (_facewear) then {_headwear pushBack [_facewears,7]};

{
	//get loadout, add it to array
	_unit = _x;
	_loadout = getUnitLoadout [_unit,true];

	//handle guns && clothing
	{
		_map = _x select 0;
		_idx = _x select 1;
		if (count (_loadout select _idx) == 0) then {continue;};
		_name = _loadout select _idx select 0;
		_map set [_name, ((_map getOrDefault [_name,[]]) + ([_loadout select _idx]))];
	} forEach (_guns + _clothes);

	//handle facewear
	{
		_map = _x select 0;
		_idx = _x select 1;
		if (_loadout select _idx == "") then {continue;};
		_map set [_loadout select _idx, _loadout select _idx];
	} forEach _headwear;
} forEach _units;

diag_log ["collector: vest: ",values _vests];
//print into nice string:
_out = [
	(values _primaryWeapons) ,
	(values _secondaryWeapons) ,
	(values _handgunWeapons) ,
	(values _uniforms) ,
	(values _vests),
	(values _backpacks) ,
	(values _helmets) ,
	(values _facewears)
];
{
	diag_log _x;
} forEach _out;

{
	_x enableSimulationGlobal false;
	_x hideObjectGlobal true;
} forEach _units;
//return
_out


