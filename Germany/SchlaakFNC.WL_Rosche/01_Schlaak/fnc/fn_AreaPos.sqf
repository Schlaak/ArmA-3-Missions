// WIP

params ["_OBJ","_Type","_dieOut","_burntime"];


_finalpos = [_pos, _mindist, _maxdist, _objdist, 0, 0.3, 0] call BIS_fnc_findSafePos;
getMarkerSize

_area = triggerArea sensor1; // result is [200, 120, 45, false, -1];
inAreaArray