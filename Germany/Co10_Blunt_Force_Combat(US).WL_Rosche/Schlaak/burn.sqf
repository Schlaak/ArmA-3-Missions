if (!alive Brandlogic) exitWith {};
{[_x , true , false , 0] call Schlaak_fnc_fireeffects} foreach (synchronizedObjects Brandlogic);
if (!alive Brandlogic2) exitWith {};
{[_x , true , false , 0] call Schlaak_fnc_fireeffects2} foreach (synchronizedObjects Brandlogic2);
if (!alive Smokelogic) exitWith {};
{[_x , false , false , 0] call Schlaak_fnc_fireeffects} foreach (synchronizedObjects Smokelogic);