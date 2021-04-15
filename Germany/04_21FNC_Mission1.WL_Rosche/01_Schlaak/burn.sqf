if (isNull  Log_Schlaak_Brand1) exitWith {};
{[_x , true , false , 0] call Schlaak_fnc_fireeffects} foreach (synchronizedObjects Log_Schlaak_Brand1);
if (isNull  Log_Schlaak_Brand2) exitWith {};
{[_x , true , false , 0] call Schlaak_fnc_fireeffects2} foreach (synchronizedObjects Log_Schlaak_Brand2);
if (isNull  Log_Schlaak_Smoke) exitWith {};
{[_x , false , false , 0] call Schlaak_fnc_fireeffects} foreach (synchronizedObjects Log_Schlaak_Smoke);
sleep 30;
if (true) exitwith {};