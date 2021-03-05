params ["_unit","_mode"];
_grp = group _unit;
_grp deleteGroupWhenEmpty false;
_size = count units _grp;
//add suppressed EH to all group units
{
	doStop _x;
	_x addEventHandler ["Suppressed", {
		params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];
		systemChat "oh no!";
		_unit removeEventHandler ["Suppressed",0];
		(group _unit) setVariable ["run",true,true];
	}];
} forEach units _grp;

waitUntil {
	//in firefight
	(count units _grp < _size || _grp getVariable ["run",false]) //at least one casualty or suppressed
};
_rallyPoint = rally_01;
systemChat "retreating now";
{
	_smk = createVehicle ["SmokeShell",getPos _x];
	_smk setPos ([-1 + random 2,-1 +random 2,2] vectorAdd (getPos _x));
} forEach units _grp;
sleep 3;
{

	[_x] joinSilent (createGroup east);
	_grpX = group _x;
	_wp = _grpX addWaypoint [getPos _rallyPoint,0,1,"rally"];
	_grpX setBehaviour "careless";
	_grpX setCombatMode "BLUE";
	_grpX setSpeedMode "FULL";
	_x setVariable ["orgGroup",_grp,true];
	diag_log ['orggroup',_x getVariable ['orgGroup','uwu']];
	_wp setWaypointStatements ["true","
	_list = (this nearEntities ['Man', 50]) select {side _x == side this};
	_list = _list - thisList;
	if (count _list == 0) then {
		systemChat 'noone here';
	} else {
		_guy = selectRandom _list;
		_ngrp = group _guy;
		_ngrp setBehaviour 'combat';
		_ngrp setCombatMode 'red';
		thisList joinSilent (group _guy);
		systemChat ('joining: ' + str _guy);
		diag_log ['thislist',thisList,'group wanted',group _guy];
	};
	 systemChat 'rejoining';
	"];

} forEach units _grp;

//find nearest unit of same grp
