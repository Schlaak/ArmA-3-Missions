/*
Script will apply hit and run tactics to the group.
[this,0.9] execvm "scripts\hitNrun.sqf";

TODO

*/
//if (isserver) then
//{

sleep 3;
_gruppe = group (_this select 0);
player sidechat (text _gruppe);
_threshold = _this select 1;	//0-1 percentile threshold when to flee/surrender
player sidechat (text _threshold);
_anzahl = count (units _gruppe);	//count groupsize
player sidechat (text _anzahl);
hint "do stuff";
player sidechat "dostuff";
////if ((count  (units _gruppe)) <= (_anzahl * _threshold) ) then {

waitUntil ((count  (units _gruppe)) <= (_anzahl * _threshold));

	hint "grp engaging";
	player sidechat "grp engaging";
	sleep 30 + (random 15);
	[leader _gruppe] call lambs_wp_fnc_taskReset;
	_reldir = (leader _gruppe) getRelDir ((leader _gruppe) findNearestEnemy (leader _gruppe));
	hint "grp Fleeing";
	player sidechat "grp Fleeing";
	_dir = _reldir - 180;
	_pos = (leader _gruppe) getRelPos [1000, _dir];
	[(leader _gruppe), _pos, true] spawn lambs_wp_fnc_taskAssault;
	_wp = _gruppe addWaypoint [_pos, 0];
	_wp setWaypointStatements ["true", "{deletevehicle _x} foreach units group this;"];
//};
/*
//OR ((count  (units _gruppe)) <= (_anzahl * _threshold))
(combatMode _gruppe == "RED")