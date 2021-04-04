
params ["_vehicle","_case"];


//while {alive _vehicle} do {
	_vehicle addEventHandler ["HandleDamage", 
	{
	private ["_veh","_dmg","_overalldamage"];
	_veh = _this select 0;
	_dmg = _this select 2;
	_overalldamage = (damage _veh) + _dmg;
	if (_overalldamage > 0.95) then
		{ 
		_veh setDamage 0.9;
		}else
		{
		_veh setDamage _overalldamage;
		_veh setfuel 0;
		_veh setvehicleammo 0;
		_veh allowdamage false;
		};
	}
	];

waitUntil {sleep 1; damage _vehicle >= 0.75 };
_vehicle allowdamage false;
systemchat "vehicle cannot be damaged;";
sleep 3;

//if ( (damage _vehicle) >= 0.75) then {
{_x action ["Eject", _vehicle];} foreach (fullCrew _vehicle);
{_x action ["Eject", _vehicle];} foreach (fullCrew _vehicle);
_vehicle setVehicleLock "LOCKED";
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
_vehicle setfuel 0;
_vehicle setvehicleammo 0;






systemchat "vehicle is crap!";
sleep 3;

_random = floor random 6;										// Random 1 to 5

//diag_log str [_random];
systemchat str _random;


switch (_case) do
{
    case 0:
    {
		systemchat "burn,black";
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;
		sleep 30;
        _vehicle setdamage 1;
		_vehicle enableSimulationGlobal false;

    };

    case 1:
    {
		systemchat "burn";
        [_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

    };
    case 2:
    {
		systemchat "wait, burn";
        sleep 30;
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

    };
    case 3:
    {
		systemchat "wait,smoke";
        sleep 30;
		[_vehicle , false , true , 200] spawn Schlaak_fnc_fireeffects;

    };
    case 4:
    {
		systemchat "coockoff";
        sleep 10;
		_vehicle call ace_cookoff_fnc_cookOff;
		sleep 10;
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

    };
    case 5:
    {	
		systemchat "wait,smoke";
        sleep 60;
		[_vehicle , false , true , 200] spawn Schlaak_fnc_fireeffects;
    };
    case 6:
    {
		systemchat "wait,smoke, wait, burn";
        sleep 60;
		[_vehicle , false , true , 60] spawn Schlaak_fnc_fireeffects;
		sleep 80;
		[_vehicle , true , true , 600] spawn Schlaak_fnc_fireeffects;
    };

};


_rndmsplat = selectRandom ["Land_Decal_ScorchMark_01_large_F","Land_Decal_ScorchMark_01_small_F"];
sleep 20;
_splat = [_rndmsplat, getpos _vehicle, (getDir (_vehicle)) -(random 90),true] call BIS_fnc_createSimpleObject;
//_splat = _rndmsplat createVehicle (getposatl (_this select 0));
_splat setpos getpos _vehicle;
//_splatdirection = getDir _vehicle;
//_splat setDir _splatdirection;
_splat setVectorUp surfaceNormal position _splat;
[_vehicle,_splat] spawn {sleep 1; 
(_this select 1) setpos 
[(getPos (_this select 0)) select 0, (getPos (_this select 0)) select 1, 0];		//letz see if shit works.
(_this select 1) setDir getDir (_this select 0)};


_splat setVectorUp surfaceNormal position _vehicle;

_splat setobjectscale 0.02;
[(_splat), 0.5] remoteExec ["setobjectscale", 0]; 

[_splat] spawn {
	[((_this select 0)), 0.5] remoteExec ["setobjectscale", 0]; 
	for "_i" from 1 to (6 + (random 8)) do {
	_scl = getobjectscale (_this select 0);
	[(_this select 0), (_scl*1.05)] remoteExec ["setobjectscale", 0];
	_this select 0 setobjectscale (_scl*1.05);
	sleep 20;
	};
	 sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);
	sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);	//ultra lazy option to get sure blood stays a while....
	sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);
	sleep 300;
	sleep 300;
	deletevehicle (_this select 0);
};





/*
_effect = selectrandom [1,2,1,2,1,3,4,5,6];
switch (_effect) do {
{
	case 0:
	{
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

	};
	case 1:
	{
		[_vehicle , false , true , 200] spawn Schlaak_fnc_fireeffects;

	};
	case 2:
	{
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

	};
	case 3:
	{
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

	};
	case 4:
	{
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

	};
	case 5:
	{
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

	};
	case 6:
	{
		[_vehicle , true , true , 200] spawn Schlaak_fnc_fireeffects;

	};
};



};
*/
_vehicle enableSimulationGlobal false;
sleep 600;
_vehicle setdamage 1;
//};
//};