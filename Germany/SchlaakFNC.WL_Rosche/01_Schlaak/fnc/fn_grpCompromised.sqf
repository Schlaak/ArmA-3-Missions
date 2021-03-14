params ["_gruppe"]; 

if (!isserver  OR (isNull _gruppe)) exitWith {};

[_gruppe] spawn {
	sleep 3;
	_gruppengroesse = count units (_this select 0);
	_Cap = selectrandom [0.3,0.4,0.5,0.6];
	_captive = selectrandom [true,false];

	waitUntil {sleep 2;({ alive _x } count units (_this select 0)) < (_gruppengroesse * _Cap)};

	if (_captive) then
		{
			[_this select 0] call Schlaak_fnc_surrender;
		}
		else
		{
			[_this select 0] call Schlaak_fnc_flee;
		};
};

