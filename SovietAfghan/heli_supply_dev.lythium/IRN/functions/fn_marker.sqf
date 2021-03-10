/*
	Author:IR0NSIGHT

	Description:
	Will spawn a marker at position/object and (optional) attach it to the object.

	Parameter(s):
		0 :
			OBJECT - Object/unit/position where the marker is spawned.
		1 (optional):
			STRING - markertext, default is no text
		2 (optional) : 
			STRING - markertype (CfgMarkers), default hd_dot
		3 (optional) :
			BOOLEAN - attach to object, default false
	Returns:
	marker
*/
params [
	["_unit",	 objNull,	[objNull,[]],[2,3]], 
	["_name",	"",			["uwu"]],
	["_type",	"hd_dot",	["string"]],
	["_attach",	false,		[false]]
];
private _marker = ""; private _pos = [0,0,0];
if (_unit isEqualType objNull) then {
	_pos = getPosASL _unit;
} else {
	_pos = _unit;
};
_marker = createMarker [str time + selectRandom ["a","b","c","d","e"] + str random 100000 ,_pos];
_marker setMarkerType _type;
_marker setMarkerText _name;
if (_attach && _unit isEqualType objNull) then {
	[_unit,_marker] spawn {
		params ["_unit","_marker"];
		waitUntil {
			sleep 1;
			_marker setMarkerPos (getPos _unit);
			!(alive _unit);
		};
		deleteMarker _marker;
	};
};
_marker