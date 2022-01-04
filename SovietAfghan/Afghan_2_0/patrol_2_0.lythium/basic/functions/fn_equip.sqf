params[
	["_dude",objNull,[objNull]]
];
diag_log["equipping ",_dude];

if (isNull _dude) exitWith {
	["cant equip null soldier. "] call BIS_fnc_error;
};
//get equipment from global, or set
_stuff = missionNamespace getVariable ["irn_equip_stuff",[]];
if (_stuff isEqualTo []) exitWith {
	["equipment for irn_fnc_equip is not defined in irn_equip_stuff"] call BIS_fnc_error;	
	diag_log ["equipment for irn_fnc_equip is not defined in irn_equip_stuff"];
};
_stuff params [
	["_primWpn",[],[[]]],
	["_scnWpn",[],[[]]],
	["_handWpn",[],[[]]],
	["_uniform",[]],
	["_vest",[]],
	["_backpack",[]],
	["_helmet",[]],
	["_facewear",[]]
];
_loadout = getUnitLoadout _dude;

if !(_primWpn isEqualTo []) then {_primWpn = [] + selectRandom selectRandom _primWpn} else {_primWpn = _loadout select 0;};
if !(_scnWpn isEqualTo [])  then {_scnWpn  = [] + selectRandom selectRandom _scnWpn;} else {_scnWpn = _loadout select 1;};
if !(_handWpn isEqualTo []) then {_handWpn = [] + selectRandom selectRandom _handWpn} else {_handWpn = _loadout select 2;};

if !(_uniform isEqualTo []) then {_uniform = [] +[(selectRandom _uniform) select 0 select 0,[]]} else {_uniform = _loadout select 3;};
if !(_vest isEqualTo [])    then {_vest = [] +[(selectRandom _vest) select 0 select 0,[]]} else {_vest = _loadout select 4;};
if !(_backpack isEqualTo []) then {_backpack =[] + [(selectRandom _backpack) select 0 select 0,[]]} else {_backpack = _loadout select 5;};

if !(_helmet isEqualTo []) then {_helmet = selectRandom _helmet} else {_helmet = _loadout select 6;};
if !(_facewear isEqualTo []) then {_facewear = selectRandom _facewear} else {_facewear = _loadout select 7;};

if !(_facewear isEqualType "") then {_facewear = ""};
if !(_helmet isEqualType "") then {_helmet = ""};

_loadout = [
	_primWpn,
	_scnWpn,
	_handWpn,
	_uniform,
	_vest, //4
	_backpack,
	_helmet, //6
	_facewear, //7
	[], //binocular
	["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]
];

(_uniform select 1) pushBack ["FirstAidKit", 2];
(_vest select 1) pushBack ["SmokeShell", 2 ,1];

if !(random 100 < 30) then {
	_scnWpn resize 0; //no RPG

	_ammo = []+(_primWpn select 4);
	_ammo insert [1,[4+ round(random 4)],false];
	(_vest select 1) pushBack _ammo;

	if !(_primWpn select 5 isEqualTo []) then { //UGL
		_ammo = []+(_primWpn select 5);
		_ammo insert [1,[8+ round(random 4)],false];
		(_backpack select 1) pushBack _ammo;
	} else {
		if !(random 100 < 40) then { //remove backpack only on non-rpg;
			_backpack resize 0;
		};
	};
	diag_log["vest ",_vest];
} else {
	if !(_scnWpn isEqualTo []) then { //check needed, sometimes fails otherwise
		_ammo = []+(_scnWpn select 4);
		_ammo insert [1,[2],false];
		(_backpack select 1) pushBack _ammo;
	} else {
		diag_log ["faulty scn loadout: ", _loadout];
	};
};
//apply loadout
_dude setUnitLoadout _loadout;

_setNameACE = {
	params ["_unit","_name"];
//	diag_log ["setting ace name for ", _unit,_name];

	if (isNull _unit || {!alive _unit}) exitWith {};

	if (_unit isKindOf "CAManBase") then {
		_unit setVariable ["ACE_Name", _name, true];
		_unit setVariable ["ACE_NameRaw", _name, true];
	}; 

	[_unit, _name] remoteExec ["setName",0,_unit];
};
//set voice and name
_firstNames = [
	"Aabid ",
	"Abdullah ",
	"Hamzah ",
	"Eachan ",
	"Ector ",
	"Mohammed ",
	"Ayran "
];
_lastNames = [
	"Safran",
	"Sultan",
	"Erdogan",
	"Abdullah",
	"bin Bong",
	"al Dente",
	"Sayüt"
];
_name = (selectRandom _firstNames) + (selectRandom _lastNames);
[_dude, _name] call _setNameACE;

_voices = [
	"Male01PER",
	"Male02PER",
	"Male03PER"
];
[_dude, selectRandom _voices] remoteExec ["setSpeaker", 0, _dude];

{
	_dude unlinkItem _x;
	_dude removeitem _x;
} forEach ["itemmap","itemradio"];





