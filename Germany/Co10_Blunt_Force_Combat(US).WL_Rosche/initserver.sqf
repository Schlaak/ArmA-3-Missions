[west, 10] call BIS_fnc_respawnTickets;

_wind = selectrandom [1,2,3,4];
switch (_wind) do
{
	case 1:
	{
		setWind [0, 0, true];
	};
	case 2:
	{
		setWind [1, 1, true];
	};
	case 3:
	{
		setWind [3, 3, true];
	};
	case 4:
	{
		setWind [4, 4, true];
	};
};

sleep 5;

// Schlaak Variablen ausführen
[] execvm "Schlaak\Schlaak_vars.sqf";
