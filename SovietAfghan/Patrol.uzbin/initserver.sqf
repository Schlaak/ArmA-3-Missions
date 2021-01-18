{ _x setmarkeralpha 0; } foreach ["WProute1", "WProute1_1", "WProute1_2","WProute1_3","WProute1_4","WProute1_5","WProute1_6","WProute1_7","WProute1_8","WProute1_9","WProute1_10","WProute1_11","WProute1_12","WProute1_13"];
{ _x setmarkeralpha 0; } foreach ["WProute2", "WProute2_1", "WProute2_2","WProute2_3","WProute2_4","WProute2_5","WProute2_6","WProute2_7","WProute2_8","WProute2_9","WProute2_10","WProute2_11","WProute2_12","WProute2_13"];
{ _x setmarkeralpha 0; } foreach ["WProute3", "WProute3_1", "WProute3_2","WProute3_3","WProute3_4","WProute3_5","WProute3_6","WProute3_7","WProute3_8","WProute3_9","WProute3_10","WProute3_11","WProute3_12","WProute3_13"];
{ _x setmarkeralpha 0; } foreach ["WProute4", "WProute4_1", "WProute4_2","WProute4_3","WProute4_4","WProute4_5","WProute4_6","WProute4_7","WProute4_8","WProute4_9","WProute4_10","WProute4_11","WProute4_12","WProute4_13"];
{ _x setmarkeralpha 0; } foreach ["WProute5","WProute5_1","WProute5_2","WProute5_3","WProute5_4","WProute5_5","WProute5_6","WProute5_7","WProute5_8","WProute5_9","WProute5_10","WProute5_11","WProute5_12","WProute5_13"];
[east, 10] call BIS_fnc_respawnTickets;
execvm "scripts\route.sqf";
0 setfog 0;
_wind = selectrandom [1,2,3,4];
_date = selectrandom [1,2,3,4];
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