//[group this] call Schlaak_fnc_surrender
params ["_gruppe"]; 

if (!isserver) exitWith {};

{removeallweapons _x} foreach units _gruppe;

{[_x, true] call ACE_captives_fnc_setSurrendered} foreach units _gruppe;
{_x disableai "FSM"} foreach units _gruppe;
{_x disableai "PATH"} foreach units _gruppe;
[_gruppe] spawn {
	
	sleep 10;
	
	{[_x, false] call ACE_captives_fnc_setSurrendered} foreach units (_this select 0);
	sleep 2;
	{_x action ["SitDown", _x]} foreach units  (_this select 0);
	sleep 5;
	Schlaak_Units_Captured = Schlaak_Units_Captured + ({ alive _x } count units (_this select 0));
	{deletevehicle _x} foreach units (_this select 0);
	
};


