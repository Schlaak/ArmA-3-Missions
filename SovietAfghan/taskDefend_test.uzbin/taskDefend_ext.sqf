//WIP script that activates "cba_fnc_taskDefend" for a group once its in combat.

//active lambs camp
//loop over unit behaviour, if combat, activate garrison.
//lambs camp splits up the group
//suspend script until unit is activated



params ["_guy"];
waitUntil {
	sleep 1;
	simulationEnabled _guy
};
systemChat "defend script called.";
_thisGroup = group _guy;
_listGuys = units _thisGroup;
diag_log ["script called. guy is",_guy,"group: ",_thisGroup];
[_thisGroup, getPos (leader _thisGroup), 1, [], true, false] call lambs_wp_fnc_taskCamp;
_groupAlive = {
	params ["_members"];
	_alive = false;
	{
		if (alive _x) exitWith {
			_alive = true;
		}
	} forEach _members;
	_alive
};
_run = true;
_i = 0;
while {([_listGuys] call _groupAlive) && _run} do {
	{
		if (behaviour leader _thisGroup == "COMBAT") exitWith {
			_run = false;
		};
	} forEach _listGuys;
	if (!_run) exitWith {
		systemChat "group was alerted.";
	};
	_i = _i + 1;
	systemChat ("everything is quiet. " + str _i); 
	sleep 5;
};
//kill old orders
//set group to defend
for "_i" from count waypoints _thisGroup - 1 to 0 step -1 do
{
	deleteWaypoint [_thisGroup, _i];
};
_listGuys joinSilent _thisGroup;
_thisGroup setBehaviour "COMBAT";
sleep 2;
[_thisGroup] call CBA_fnc_taskDefend;


