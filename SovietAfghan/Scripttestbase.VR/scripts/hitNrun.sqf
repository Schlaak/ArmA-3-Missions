//[this,0.9] execvm "scripts\hitNrun.sqf";
//if (isserver) then
{

sleep 3;
_gruppe = group (_this select 0);
_threshold = _this select 1;	//0-1 percentile threshold when to flee/surrender




//_anzahl = count (units _gruppe);	//count groupsize

//waitUntil {_gruppe knowsAbout (leader _gruppe findNearestEnemy leader _gruppe) == 4};	//wait until group is size or below size of threshold



	for "_i" from count waypoints _gruppe - 1 to 0 step -1 do
	{
		deleteWaypoint [_gruppe, _i];
	};
	sleep 1;

	[leader _gruppe] call lambs_wp_fnc_taskReset;	
	_reldir = (leader _gruppe) getRelDir (leader _gruppe findNearestEnemy leader _gruppe);
	hint "grp Fleeing";
	player sidechat "grp Fleeing";
	_dir = _reldir - 180;
	_pos = (leader _gruppe) getRelPos [1000, _dir];
	[(leader _gruppe), _pos, true] spawn lambs_wp_fnc_taskAssault;
	_wp = _gruppe addWaypoint [_pos, 0];
	_wp setWaypointStatements ["true", "{deletevehicle _x} foreach units group this;"];







/*
Script will apply hit and run tactics to the group.
[this,0.9] execvm "scripts\hitNrun.sqf";

TODO

*/
//if (isserver) then
//{
/*
_gruppe = group (_this select 0);

_threshold = _this select 1;	//0-1 percentile threshold when to flee/surrender

_anzahl = count (units _gruppe);	//count groupsize

hint "do stuff";
player sidechat "dostuff";
////if ((count  (units _gruppe)) <= (_anzahl * _threshold) ) then {

//waitUntil ((count  (units _gruppe)) <= (_anzahl * _threshold));

if ( 
	
	//(combatMode _gruppe) == "RED"
	//count  (units _gruppe) <= (_anzahl * _threshold)
	true;
	
	) then {

	for "_i" from count waypoints _gruppe - 1 to 0 step -1 do
	{
		deleteWaypoint [_gruppe, _i];
	};


	hint "grp engaging";
	player sidechat "grp engaging";
	//sleep 30 + (random 15);
	[leader _gruppe] call lambs_wp_fnc_taskReset;
	_reldir = (leader _gruppe) getRelDir ((leader _gruppe) findNearestEnemy (leader _gruppe));
	hint "grp Fleeing";
	player sidechat "grp Fleeing";
	_dir = _reldir - 180;
	_pos = (leader _gruppe) getRelPos [1000, _dir];
	[(leader _gruppe), _pos, true] spawn lambs_wp_fnc_taskAssault;
	_wp = _gruppe addWaypoint [_pos, 0];
	_wp setWaypointStatements ["true", "{deletevehicle _x} foreach units group this;"];

};

//};
/*
//OR ((count  (units _gruppe)) <= (_anzahl * _threshold))
(combatMode _gruppe == "RED")