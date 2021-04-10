//[group this] call Schlaak_fnc_surrender
params ["_gruppe"]; 


/*
script works really nice. although infantry sometimes turns around a bit
which looks awfully weird given their animation.

*/




//fixme.... lot of stuff dont workaround here.... just deletion and var push
if ((paramsArray select 6) == 0) exitwith {}; //allow surrender?

{removeallweapons _x} foreach units _gruppe;
{removeallitems _x} foreach units _gruppe;
_gruppe setVariable ["lambs_danger_disableGroupAI",true];       



{[_x, true] call ACE_captives_fnc_setSurrendered} foreach units _gruppe;
{_x disableai "FSM"} foreach units _gruppe;
{_x disableai "RADIOPROTOCOL"} foreach units _gruppe;
{_x disableai "PATH"} foreach units _gruppe;
{_x setCaptive true} foreach units _gruppe;
[_gruppe] spawn {



	sleep (paramsArray select 10);
	{removeheadgear _x} foreach units (_this select 0);
    {removevest _x} foreach units (_this select 0);
	//{[_x, false] call ACE_captives_fnc_setSurrendered} foreach units (_this select 0);
    {_x setCaptive true} foreach units (_this select 0);

	
{
[(_x)] spawn  
sleep (paramsArray select 11); 
_anim = selectrandom ["Acts_ExecutionVictim_KillTerminal","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_ExecutionVictim_Loop"]; 
{[_x, false] call ACE_captives_fnc_setSurrendered} foreach units (_this select 0);
{_x setCaptive true} foreach units (_this select 0);
[(_x), _anim] remoteExec ["switchmove", 0];  
} foreach units (_this select 0);
       

    
	sleep 50;
	sleep 300;
	switch (side leader (_this select 0)) do
{
    case West:
    {
        Schlaak_Units_Captured_W = Schlaak_Units_Captured_W + ({ alive _x } count units (_this select 0));
        publicVariable "Schlaak_Units_Captured_W";
    };

    case East:
    {
        Schlaak_Units_Captured_E = Schlaak_Units_Captured_E + ({ alive _x } count units (_this select 0));
        publicVariable "Schlaak_Units_Captured_E";
    };
    case Independent:
    {
        Schlaak_Units_Captured_I = Schlaak_Units_Captured_I + ({ alive _x } count units (_this select 0));
        publicVariable "Schlaak_Units_Captured_I";
    };

};

	//Schlaak_Units_Captured_W = Schlaak_Units_Captured_W + ({ alive _x } count units (_this select 0));
	{deletevehicle _x} foreach units (_this select 0);
	
};


