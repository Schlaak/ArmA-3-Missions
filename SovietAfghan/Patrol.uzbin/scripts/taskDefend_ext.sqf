//WIP script that activates "cba_fnc_taskDefend" for a group once its in combat.

//active lambs camp
//loop over unit behaviour, if combat, activate garrison.
//lambs camp splits up the group
[this] spawn {
	params ["_guy"];
	_thisGroup = group _guy;
	_listGuys = units _thisGroup;
	diag_log ["script called. guy is",_guy,"group: ",_thisGroup];
	[_thisGroup, getPos (leader _thisGroup), 1, [], true, true] call lambs_wp_fnc_taskCamp;
	_groupAlive = {
		params ["_members"];
		_alive = false;
		{
			if (alive _x) exitWith {
				_alive = true;
			}
		} forEach units _members;
		_alive
	};
	_run = true;
	_i = 0;
	while {([_listGuys] call _groupAlive) && _run} do {
		{
			if (behaviour leader _thisGroup == "COMBAT") exitWith {
				systemChat "group was alerted.";
				[_thisGroup] call CBA_fnc_taskDefend;
				_run = false;
			};
		} forEach _listGuys;
		_i = _i + 1;
		systemChat ("everything is quiet. " + str _i); 
		sleep 5;
	};
};

