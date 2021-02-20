/*/if (isServer) then
{
	_skill = [0.1, 0.5, 1] select (paramsArray select 0);
	{
		_x setSkill _skill;
	}
	forEach allUnits;
};
*/
if (isServer) then
{
	_DateY =  (paramsArray select 2);
	_DateM = (paramsArray select 3);
	_DateD = (paramsArray select 4);
	_DateH = (paramsArray select 5);
	setDate [_DateY, _DateM, _DateD, _DateH,(random 34)];
	_windX = (paramsArray select 6);
	_windY = (paramsArray select 7);
	setWind [_windX, _windY, false];
	0 setOvercast ((_windX + _windY)/100);
	1 setfog 0;
	1 setRain 0;
	1 setLightnings 0;
	forceweatherchange;
};
[] execvm "ambienteflyby.sqf";
//TODO spawn eventhandler
//[] execVM "scripts\spawn_EH.sqf";

route1mrks = [];
route2mrks = [];
route3mrks = [];
route4mrks = [];
route5mrks = [];

for "X" from 1 to 20 do {
				route1mrks pushBack ("Route1");
				route1mrks pushBack (format ["Route1_%1", X]);
				};
for "X" from 1 to 20 do {
				route2mrks pushBack ("Route2");
				route2mrks pushBack (format ["Route2_%1", X]);
				};
for "X" from 1 to 20 do {
				route3mrks pushBack ("Route3");
				route3mrks pushBack (format ["Route3_%1", X]);
				};
for "X" from 1 to 20 do {
				route4mrks pushBack ("Route4");
				route4mrks pushBack (format ["Route4_%1", X]);
				};
for "X" from 1 to 20 do {
				route5mrks pushBack ("Route5");
				route5mrks pushBack (format ["Route5_%1", X]);
				};
{ _x setmarkeralpha 0; } foreach route1mrks;
{ _x setmarkeralpha 0; } foreach route2mrks;
{ _x setmarkeralpha 0; } foreach route3mrks;
{ _x setmarkeralpha 0; } foreach route4mrks;
{ _x setmarkeralpha 0; } foreach route5mrks;



[east, 5] call BIS_fnc_respawnTickets;



sleep 10;
//[random floor 5] execvm "scripts\route.sqf";
//[1] execvm "scripts\route.sqf";
sleep 3;
	1 setfog 0;
	1 setRain 0;
	1 setLightnings 0;
	forceweatherchange;
sleep 3;
1 setLightnings 0;
forceweatherchange;


sleep 10;
[] execvm "scripts\loudspeaker.sqf";
[] execvm "scripts\music.sqf";
//0 setOvercast

//_wind = selectrandom [1,2,3,4];
//_date = selectrandom [1,2,3,4];

/*
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


KeineRoute = true;

[this , "Patrouillenbefehle", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
"_this distance _target < 1.5; KeineRoute == true; _caller iskindof 'cwr3_o_soldier_sl'",  
"KeineRoute == true ; _target distance _caller < 1.5; _caller iskindof 'cwr3_o_soldier_sl'"    
, {}, {}, {[random floor 5] execvm "scripts\route.sqf"; ; keineRoute = false;
[ _target,0 ] call BIS_fnc_holdActionRemove;
[ _target,1 ] call BIS_fnc_holdActionRemove;
[ _target,2 ] call BIS_fnc_holdActionRemove;
[ _target,3 ] call BIS_fnc_holdActionRemove;
[ _target,4 ] call BIS_fnc_holdActionRemove;
[ _target,5 ] call BIS_fnc_holdActionRemove;
[ _target,6 ] call BIS_fnc_holdActionRemove;}, { }, 
[], 1.5, 0, true, false, true] remoteExec ["BIS_fnc_holdActionAdd",0, true];

[this , "Patrouillenbefehle Route 1", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 1.5; KeineRoute == true; _caller iskindof
 'cwr3_o_soldier_sl'",  " KeineRoute == true; _target distance _caller < 1.5; _caller iskindof 'cwr3_o_soldier_sl'"   
  , {}, {}, {[1] execvm "scripts\route.sqf"; 
  [ _target,0 ] call BIS_fnc_holdActionRemove;
[ _target,1 ] call BIS_fnc_holdActionRemove;
[ _target,2 ] call BIS_fnc_holdActionRemove;
[ _target,3 ] call BIS_fnc_holdActionRemove;
[ _target,4 ] call BIS_fnc_holdActionRemove;
[ _target,5 ] call BIS_fnc_holdActionRemove;
[ _target,6 ] call BIS_fnc_holdActionRemove; keineRoute = false;}, { }, [], 1.5, 0, true, false, true] remoteExec ["BIS_fnc_holdActionAdd",0, true];

[this , "Patrouillenbefehle Route 2", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 1.5; KeineRoute == true; _caller iskindof
 'cwr3_o_soldier_sl'",  "KeineRoute == true; _target distance _caller < 1.5; _caller iskindof 'cwr3_o_soldier_sl'"   
  , {}, {}, {[2] execvm "scripts\route.sqf"; 
  [ _target,0 ] call BIS_fnc_holdActionRemove;
[ _target,1 ] call BIS_fnc_holdActionRemove;
[ _target,2 ] call BIS_fnc_holdActionRemove;
[ _target,3 ] call BIS_fnc_holdActionRemove;
[ _target,4 ] call BIS_fnc_holdActionRemove;
[ _target,5 ] call BIS_fnc_holdActionRemove;
[ _target,6 ] call BIS_fnc_holdActionRemove; keineRoute = false;}, { }, [], 1.5, 0, true, false, true] remoteExec ["BIS_fnc_holdActionAdd",0, true];

[this , "Patrouillenbefehle Route 3", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 1.5; KeineRoute == true; _caller iskindof 
'cwr3_o_soldier_sl'",  "KeineRoute == true; _target distance _caller < 1.5; _caller iskindof 'cwr3_o_soldier_sl'"   
 , {}, {}, {[3] execvm "scripts\route.sqf"; 
 [ _target,0 ] call BIS_fnc_holdActionRemove;
[ _target,1 ] call BIS_fnc_holdActionRemove;
[ _target,2 ] call BIS_fnc_holdActionRemove;
[ _target,3 ] call BIS_fnc_holdActionRemove;
[ _target,4 ] call BIS_fnc_holdActionRemove;
[ _target,5 ] call BIS_fnc_holdActionRemove;
[ _target,6 ] call BIS_fnc_holdActionRemove; keineRoute = false;}, { }, [], 1.5, 0, true, false, true] remoteExec ["BIS_fnc_holdActionAdd",0, true];

[this , "Patrouillenbefehle Route 4", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 1.5; KeineRoute == true;
 _caller iskindof 'cwr3_o_soldier_sl'",  "KeineRoute == true; _target distance _caller < 1.5; _caller iskindof 'cwr3_o_soldier_sl'"    
 , {}, {}, {[4] execvm "scripts\route.sqf";
 [ _target,0 ] call BIS_fnc_holdActionRemove;
[ _target,1 ] call BIS_fnc_holdActionRemove;
[ _target,2 ] call BIS_fnc_holdActionRemove;
[ _target,3 ] call BIS_fnc_holdActionRemove;
[ _target,4 ] call BIS_fnc_holdActionRemove;
[ _target,5 ] call BIS_fnc_holdActionRemove;
[ _target,6 ] call BIS_fnc_holdActionRemove;
  ; keineRoute = false;}, { }, [], 1.5, 0, true, false, true] remoteExec ["BIS_fnc_holdActionAdd",0, true];

[this , "Patrouillenbefehle Route 5", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 1.5; 
KeineRoute == true; _caller iskindof 'cwr3_o_soldier_sl'",  "KeineRoute == true; 
_target distance _caller < 1.5; _caller iskindof 'cwr3_o_soldier_sl'"    , {}, {}, {[5] execvm "scripts\route.sqf"; 
keineRoute = false;
[ _target,0 ] call BIS_fnc_holdActionRemove;
[ _target,1 ] call BIS_fnc_holdActionRemove;
[ _target,2 ] call BIS_fnc_holdActionRemove;
[ _target,3 ] call BIS_fnc_holdActionRemove;
[ _target,4 ] call BIS_fnc_holdActionRemove;
[ _target,5 ] call BIS_fnc_holdActionRemove;
[ _target,6 ] call BIS_fnc_holdActionRemove;
}, { }, [], 1.5, 0, true, false, true] remoteExec ["BIS_fnc_holdActionAdd",0, true];