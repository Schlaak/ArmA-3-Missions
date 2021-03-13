//[group this] call Schlaak_fnc_flee
params ["_gruppe"]; 

if (!isserver OR (isNull _gruppe) OR (isNil "Log_Schlaak_Retreat_E") OR (isNil "Log_Schlaak_Retreat_W")) exitWith {};


{removeallweapons _x} foreach units _gruppe;
_pos = selectrandom ["middle","up","down","auto"];
{_x setunitpos "middle"} foreach units _gruppe;
_grpSide = side leader _gruppe;

switch (_grpSide) do
{
    case west:
    {
        _Retreatpoint = (selectrandom Schlaak_Retreat_West);
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppe;
		hint format ["%1", getpos _retreatpoint];
		_gruppe setSpeedMode "FULL";

		for "_i" from count waypoints _gruppe - 1 to 0 step -1 do
		{
		deleteWaypoint [_gruppe, _i];
		};

		_retreatWP = _gruppe addWaypoint [(getpos _retreatpoint), 0];
		_retreatWP setWaypointStatements ["true", "Schlaak_Units_routed_w = Schlaak_Units_routed_w + ({ alive _x } count units (group this)); {deletevehicle _x} foreach units group this;"];
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppe;
		[leader _gruppe, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;
    };
    case east:
    {
        _Retreatpoint = (selectrandom Schlaak_Retreat_East);
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppe;
		hint format ["%1", getpos _retreatpoint];
		for "_i" from count waypoints _gruppe - 1 to 0 step -1 do
		{
		deleteWaypoint [_gruppe, _i];
		};
		_gruppe setSpeedMode "FULL";
		_retreatWP = _gruppe addWaypoint [(getpos _retreatpoint), 0];
		_retreatWP setWaypointStatements ["true", "Schlaak_Units_routed_w = Schlaak_Units_routed_w + ({ alive _x } count units (group this)); {deletevehicle _x} foreach units group this;"];
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppe;
		[leader _gruppe, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;
    };
	case independent:
    {
        _Retreatpoint = (selectrandom Schlaak_Retreat_Independent);
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppe;
		hint format ["%1", getpos _retreatpoint];
		for "_i" from count waypoints _gruppe - 1 to 0 step -1 do
		{
		deleteWaypoint [_gruppe, _i];
		};
		_gruppe setSpeedMode "FULL";
		_retreatWP = _gruppe addWaypoint [(getpos _retreatpoint), 0];
		_retreatWP setWaypointStatements ["true", "Schlaak_Units_routed_w = Schlaak_Units_routed_w + ({ alive _x } count units (group this)); {deletevehicle _x} foreach units group this;"];
		{_x domove (getpos _retreatpoint) ;} foreach units _gruppe;
		[leader _gruppe, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;
    };
};

//[leader _gruppe, (getpos  _Retreatpoint), true] spawn lambs_wp_fnc_taskAssault;


{_x setBehaviour "CARELESS";} foreach units _gruppe;
{_x disableAI "FSM";} foreach units _gruppe;
{_x setUnitPosWeak "UP";} foreach units _gruppe;
{_x playAction "Panic";} foreach units _gruppe;

/*
[_gruppe] spawn {
	
	sleep 30;
	Schlaak_Units_routed = Schlaak_Units_routed + ({ alive _x } count units (_this select 0));
	{deletevehicle _x} foreach units (_this select 0);	
};



