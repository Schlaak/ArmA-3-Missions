/*
TODO:
1: get rid of position based spawns. use getpos!
2: Dynamic Notifications via ["Benachrichtigung",["Feindtruppen aus X."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];
		_azimuth = player getDir tank;



*/
if (!isserver) exitWith {};

DefendUniform = true;
_spawnsuniform = [UniformE,UniformN,UniformNE,UniformNW];
_spawnsvictor = [VictorSW,VictorSE,VictorS,VictorNE,VictorE];

_spawnpos = selectrandom _spawnsuniform;
sleep 30;
switch (_spawnpos) do
{
	case UniformE:
	{
		//["Benachrichtigung", ["Feindtruppen aus OST."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus OST."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];

	};
	case UniformN:
	{
		//["Benachrichtigung", ["Feindtruppen aus NORD."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus NORD."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];

	};
	case UniformNE:
	{
		//["Benachrichtigung", ["Feindtruppen aus NORD-OST."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus NORD-OST."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];

	};
	case UniformNW:
	{
		//["Benachrichtigung", ["Feindtruppen aus NORD-WEST."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus NORD-WEST."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];

	};
};
for [{_i=0}, {_i<3}, {_i=_i+1}] do
{


_grpBMP1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
_grpBMP2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
_grpBTR = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
_grpMTLB = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
_grpmot = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Motorized" >> "cwr3_o_motorized_section");

_tospawn = selectrandom [_grpBMP1,_grpBMP2,_grpBTR,_grpMTLB];


_grpUniform1 = [[(getpos _spawnpos select 0) + random 30,(getpos _spawnpos select 1) + random 30,0], east, _tospawn] call BIS_fnc_spawnGroup;
[(leader _grpuniform1)] execvm "scripts\surrenderflee.sqf";
_wp =_grpUniform1 addWaypoint [getmarkerpos "uniform", 0];
[leader _grpuniform1, (getmarkerpos "uniform")] spawn lambs_wp_fnc_taskAssault;
//

sleep 60;
};

waitUntil {groupsrouted >= 3};
_spawnpos = selectrandom _spawnsuniform;
for [{_i=0}, {_i<3}, {_i=_i+1}] do
{


_grpBMP1 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp1");
_grpBMP2 = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_bmp2");
_grpBTR = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_btr");
_grpMTLB = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Mechanized" >> "cwr3_o_mechanized_infantry_mtlb");
_grpmot = (configfile >> "CfgGroups" >> "East" >> "CWR3_RUS" >> "Motorized" >> "cwr3_o_motorized_section");

_tospawn = selectrandom [_grpBMP1,_grpBMP2,_grpBTR,_grpMTLB];


_grpUniform1 = [[(getpos _spawnpos select 0) + random 30,(getpos _spawnpos select 1) + random 30,0], east, _tospawn] call BIS_fnc_spawnGroup;
[(leader _grpuniform1)] execvm "scripts\surrenderflee.sqf";
_wp =_grpUniform1 addWaypoint [getmarkerpos "uniform", 0];
[leader _grpuniform1, (getmarkerpos "uniform")] spawn lambs_wp_fnc_taskAssault;


sleep 60;
};

switch (_spawnpos) do
{
	case UniformE:
	{
		//["Benachrichtigung", ["Feindtruppen aus OST."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus OST."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];
	};
	case UniformN:
	{
		//["Benachrichtigung", ["Feindtruppen aus NORD."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus NORD."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];
	};
	case UniformNE:
	{
		//["Benachrichtigung", ["Feindtruppen aus NORD-OST."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus OST."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];
	};
	case UniformNW:
	{
		//["Benachrichtigung", ["Feindtruppen aus NORD-WEST."]] call BIS_fnc_showNotification;
		["Benachrichtigung",["Feindtruppen aus NORD-WEST."], "BIS_fnc_showNotification"] remoteExec ["BIS_fnc_showNotification", 0, true];
	};
};
