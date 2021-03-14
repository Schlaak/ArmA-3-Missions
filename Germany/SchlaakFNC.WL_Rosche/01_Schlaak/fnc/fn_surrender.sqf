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
    {_x setCaptive true} foreach units (_this select 0);
	sleep 300;
	{_x action ["SitDown", _x]} foreach units  (_this select 0);
	sleep 50;
	switch (side leader (_this select 0)) do
{
    case West:
    {
        Schlaak_Units_Captured_W = Schlaak_Units_Captured_W + ({ alive _x } count units (_this select 0));

    };

    case East:
    {
        Schlaak_Units_Captured_E = Schlaak_Units_Captured_E + ({ alive _x } count units (_this select 0));

    };
    case Independent:
    {
        Schlaak_Units_Captured_I = Schlaak_Units_Captured_I + ({ alive _x } count units (_this select 0));

    };

};

	//Schlaak_Units_Captured_W = Schlaak_Units_Captured_W + ({ alive _x } count units (_this select 0));
	{deletevehicle _x} foreach units (_this select 0);
	
};


