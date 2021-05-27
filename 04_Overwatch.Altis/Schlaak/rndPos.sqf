// [this,500] execvm "schlaak\rndPos.sqf";
if (!isserver) exitwith {};
_dude = _this select 0;
_dist = _this select 1;
_safepos = [getpos _dude, 0, _dist, 15] call BIS_fnc_findSafePos;
{_x setpos ([( _safepos select 0) +(random 10), ( _safepos select 1) + (random 10) , 0])} forEach units (group _dude);
(group _dude)  setCombatMode "WHITE";
[_dude, _dude, _dist] call lambs_wp_fnc_taskPatrol;