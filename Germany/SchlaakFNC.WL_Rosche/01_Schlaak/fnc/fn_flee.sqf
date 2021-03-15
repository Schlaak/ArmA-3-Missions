//[group this] call Schlaak_fnc_flee
params ["_gruppeF"]; 
/*
function should work properly now...

although Schlaak units routed_E etc gets not broadcastet or smthng....
*/

{removeallweapons _x} foreach units _gruppeF;
_pos = selectrandom ["middle","up","down","auto"];
{_x setunitpos _pos} foreach units _gruppeF;
_grpSide = side leader _gruppeF;

systemchat "fleescript:";
systemchat str leader _gruppeF;

switch (_grpSide) do
{
    case west:
    {
        _Retreatpoint = (selectrandom Schlaak_Retreat_West);
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppeF;
		hint format ["%1", getpos _retreatpoint];
		_gruppeF setSpeedMode "FULL";

		for "_i" from count waypoints _gruppeF - 1 to 0 step -1 do
		{
		deleteWaypoint [_gruppeF, _i];
		};

		_retreatWP = _gruppeF addWaypoint [(position _retreatpoint), 0];
		_retreatWP setWaypointStatements ["true", 
		"Schlaak_Units_routed_w = Schlaak_Units_routed_w + ({ alive _x } count units (group this)); {deletevehicle _x} foreach units group this; publicVariable 'Schlaak_units_routed_E';"
		];
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppeF;
		[leader _gruppeF, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;
    };
    case east:
    {
        _Retreatpoint = (selectrandom Schlaak_Retreat_East);
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppeF;
		hint format ["%1", getpos _retreatpoint];
		for "_i" from count waypoints _gruppeF - 1 to 0 step -1 do
		{
		deleteWaypoint [_gruppeF, _i];
		};
		_gruppeF setSpeedMode "FULL";
		_retreatWP = _gruppeF addWaypoint [(getpos _retreatpoint), 0];
		_retreatWP setWaypointStatements ["true", "Schlaak_Units_routed_w = Schlaak_Units_routed_w + ({ alive _x } count units (group this)); {deletevehicle _x} foreach units group this; publicVariable 'Schlaak_units_routed_W';"];
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppeF;
		[leader _gruppeF, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;
    };
	case independent:
    {
        _Retreatpoint = (selectrandom Schlaak_Retreat_Independent);
		{_x domove (position _retreatpoint) ;} foreach units _gruppeF;
		hint format ["%1", getpos _retreatpoint];
		for "_i" from count waypoints _gruppeF - 1 to 0 step -1 do
		{
		deleteWaypoint [_gruppeF, _i];
		};
		_gruppeF setSpeedMode "FULL";
		_retreatWP = _gruppeF addWaypoint [(position _retreatpoint), 0];
		_retreatWP setWaypointStatements ["true", "Schlaak_Units_routed_w = Schlaak_Units_routed_w + ({ alive _x } count units (group this)); {deletevehicle _x} foreach units group this; publicVariable 'Schlaak_units_routed_I';"];
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppeF;
		[leader _gruppeF, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;
    };
};

//[leader _gruppeF, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;


{_x setBehaviour "CARELESS";} foreach units _gruppeF;
//{_x disableAI "FSM";} foreach units _gruppeF;
{_x setUnitPosWeak "UP";} foreach units _gruppeF;
{_x playAction "Panic";} foreach units _gruppeF;



//todo test #lastminutechange
_gruppeF setVariable ["lambs_danger_disableGroupAI",true];
/*
[_gruppeF] spawn {
	
	sleep 30;
	Schlaak_Units_routed = Schlaak_Units_routed + ({ alive _x } count units (_this select 0));
	{deletevehicle _x} foreach units (_this select 0);	
};



