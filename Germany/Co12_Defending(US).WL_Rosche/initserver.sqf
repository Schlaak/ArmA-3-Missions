[west, 10] call BIS_fnc_respawnTickets;
groupsrouted = 0;
DefendUniform = false;
DefendVictor = false;
DefendWhiskey = false;



//0 setfog 0;
_wind = selectrandom [1,2,3,4];
//_date = selectrandom [1,2,3,4];
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
/*
_day = floor random 25;
_month = selectrandom [4,5,6,7,8];
_hour = selectrandom [5,6,7,8,9,11,15,16,18,19];
switch (_date) do
{
	case 1:
	{
		setDate [1986, _month, _day, _hour, 20];
	};
	case 2:
	{
		setDate [1986, _month, _day, _hour, 20];
	};
	case 3:
	{
		setDate [1986, _month, _day, _hour, 20];
	};
	case 4:
	{
		setDate [1986, _month, _day, _hour, 20];
	};
};
*/
sleep 5;
execvm "scripts\Mission.sqf";