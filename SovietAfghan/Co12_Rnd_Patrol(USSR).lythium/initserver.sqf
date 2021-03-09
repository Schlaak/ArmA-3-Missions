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
[] execVM "scripts\spawn_EH.sqf";

route1mrks = [];
route2mrks = [];
route3mrks = [];
route4mrks = [];
route5mrks = [];
route6mrks = [];
route7mrks = [];
route8mrks = [];
route9mrks = [];
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
for "X" from 1 to 20 do {
				route6mrks pushBack ("Route6");
				route6mrks pushBack (format ["Route6_%1", X]);
				};
for "X" from 1 to 20 do {
				route7mrks pushBack ("Route7");
				route7mrks pushBack (format ["Route7_%1", X]);
				};
for "X" from 1 to 20 do {
				route8mrks pushBack ("Route8");
				route8mrks pushBack (format ["Route8_%1", X]);
				};
for "X" from 1 to 20 do {
				route9mrks pushBack ("Route9");
				route9mrks pushBack (format ["Route9_%1", X]);
				};
{ _x setmarkeralpha 0; } foreach route1mrks;
{ _x setmarkeralpha 0; } foreach route2mrks;
{ _x setmarkeralpha 0; } foreach route3mrks;
{ _x setmarkeralpha 0; } foreach route4mrks;
{ _x setmarkeralpha 0; } foreach route5mrks;
{ _x setmarkeralpha 0; } foreach route6mrks;
{ _x setmarkeralpha 0; } foreach route7mrks;
{ _x setmarkeralpha 0; } foreach route8mrks;
{ _x setmarkeralpha 0; } foreach route9mrks;


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
