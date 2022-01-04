/*
  SHK_moveObjects

  Version 0.31
  Author: Shuko (miika@miikajarvinen.fi, shuko@quakenet)
  http://forums.bistudio.com/showthread.php?163871-SHK_moveObjects

  Moves set of objects from A to B, retaining the direction and distance from
  a point of reference.

  Parameters:
    0: Object or Position   Anchor, point of origin.
    1: Object or Position   Center position to which objects are moved around.
    2: Number               Range in meters to search for objects.
    3: Array or String      Optional. Type of objects to search for.
    4: Number or Object     Optional. Direction adjustment. Affects position of objects, not the dir they will be facing.
    5: Number or Object     Optional. Direction the objects will be facing after they are moved.

  Examples:
    nul = [gl1,gl2,50] execvm "scripts\shk_moveobjects.sqf"
    nul = [start,destination,100,"Man"] execvm "scripts\shk_moveobjects.sqf"
    nul = [[3243,5234,0],gl2,50,["Man","Car"]] execvm "scripts\shk_moveobjects.sqf"
    nul = [gl1,gl2,50,[],gl2] execvm "scripts\shk_moveobjects.sqf"
    nul = [gl1,gl2,50,[],45] execvm "scripts\shk_moveobjects.sqf"
    nul = [gl1,gl2,50,[],45,270] execvm "scripts\shk_moveobjects.sqf"

*/
params ["_anchor","_objects","_target"];
_aPos = _anchor;
_dPos = _target;


if (typename _aPos == typename objNull) then {_aPos = getpos _aPos};
if (typename _dPos == typename objNull) then {_dPos = getpos _dPos};



//_objects = nearestobjects [_aPos,_types,_range];

{
  _xPos = getpos _x;
  _dir = ((_xPos select 0) - (_aPos select 0)) atan2 ((_xPos select 1) - (_aPos select 1));
  _dst = _aPos distance _xPos;

  _x setpos [((_dPos select 0) + (_dst * sin _dir)),
            ((_dPos select 1) + (_dst * cos _dir)),
            0];
 // _x setVectorUp surfaceNormal position _x;
} foreach _objects;