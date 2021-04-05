//TODO
/*
CLEANUP!
look at this
https://forums.bohemia.net/forums/topic/194844-creating-and-deleting-moduleeffectsfire_f/
IMPLEMENT IT!




*/
params ["_veh","_case"];

if (!isNil {_veh getVariable "Schlaak_vehicleDamage"}) exitWith {};


_veh setVariable ["Schlaak_vehicleDamage", 0, false];
//while {alive _vehicle} do {
_veh addEventHandler 
["HandleDamage", 
{
	private ["_vehicle","_dmg","_overalldamage"];
	_vehicle = _this select 0;
	_dmg = _this select 2;
	if ((_dmg) > 0.25) then 
	{
		[_vehicle] spawn 
		{
		//[(_this select 0) , false , true , floor random 6] spawn Schlaak_fnc_fireeffects;
		};
	};
	_overalldamage = (damage _vehicle) + _dmg;
	_vehicle setdamage ((damage _vehicle) + (_dmg * 0.05));
	if ((_overalldamage) > 0.75) then
		{ 
			_vehicle setdamage 0.8;
			_case = selectRandom [1,2,3,4,5,6,7,8];
			if (!isNil {_vehicle getVariable "Schlaak_vehicleDamage_2"}) exitWith {};
			_vehicle setVariable ["Schlaak_vehicleDamage_2", 0, false];
			[_vehicle,_case] spawn 
				{
				
				
				//waitUntil {sleep 1;(damage _vehicle) > 0.75};
				_vehicle = _this select 0;
				_case = _this select 1;
				_vehicle allowCrewInImmobile true;
				_vehicle setVehicleLock "LOCKED";
				_vehicle setdamage 0.8;
				_vehicle allowdamage false;
				_vehicle setfuel 0;
				_vehicle setvehicleammo 0;
				_vehicle setVehicleLock "LOCKED";
				
				clearMagazineCargoGlobal _vehicle;
				clearItemCargoGlobal _vehicle;
				clearWeaponCargoGlobal _vehicle;
				{_x setdamage (random [0.4,0.7,1])} foreach crew _vehicle;
				

				sleep random [8,15,30];
				{[_x]	spawn {sleep floor random [15,25,35];_dudesBurn = [ (_this select 0), [0,0,1], floor random 9 + 3, random [.05,.01,.015], .03 ] execvm "02_scripts\JBOY\JBOY_createFire.sqf"; sleep .01;  unassignVehicle (_this select 0); [_this select 0] allowgetin false ;}} foreach crew _vehicle;
				
				sleep 1;
				_vehicle enableSimulationGlobal false;
				//{_dudesBurn = [ _x, [0,0,1], .01, .01, .03 ] execvm "02_scripts\JBOY\JBOY_createFire.sqf";} foreach crew _vehicle;
				
				switch (_case) do
				{
					case 0:
					{
						systemchat "0:burn,black";
						sleep (floor random 30 + 30);
						[_vehicle , true , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;
						sleep (floor random 30 + 30);
						_vehicle setdamage 1;
						_vehicle enableSimulationGlobal false;

					};

					case 1:
					{
						systemchat "1:burn";
						sleep (floor random 30 + 30);
						[_vehicle , true , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;

					};
					case 2:
					{
						systemchat "2:wait, burn";
						sleep ((floor random 30) + 5);
						[_vehicle , true , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;

					};
					case 3:
					{
						systemchat "3:wait,smoke";
						sleep (floor random 30 + 30);
						[_vehicle , false , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;

					};
					case 4:
					{
						systemchat "4:coockoff";
						sleep (floor random 30 + 10);
						_vehicle call ace_cookoff_fnc_cookOff;
						sleep 10;
						[_vehicle , true , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;

					};
					case 5:
					{	
						systemchat "5:wait,smoke";
						sleep (floor random 60 + 30);
						[_vehicle , false , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;
					};
					case 6:
					{
						systemchat "6:wait,smoke, wait, burn";
						sleep (floor random 60 + 30);
						[_vehicle , false , true , 60] spawn Schlaak_fnc_fireeffects;
						sleep 40 + (random 30);
						[_vehicle , true , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;
					};
					case 7:
					{
						systemchat "7:coockoff engine fire";
						sleep (floor random 30 + 30);
						_vehicle call ace_cookoff_fnc_engineFire;
						sleep 40 + (random 30);
						[_vehicle , true , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;
					};
					case 8:
					{	
						systemchat "7:coockoff box";
						sleep (floor random 60 + 30);
						[_vehicle] call ace_cookoff_fnc_cookOffBox;
						sleep 15 + (random 10);
						[_vehicle] call ace_cookoff_fnc_cookOffBox;
						sleep 80 + (random 10);
						[_vehicle] call ace_cookoff_fnc_cookOffBox;
						[_vehicle , true , true , random [130,360,620]] spawn Schlaak_fnc_fireeffects;
						sleep 15 + (random 10);
						_vehicle setdamage 1;
					};
				};
				if ( true ) exitwith {

						if (isserver) then {
							_rndmsplat = selectRandom ["Land_Decal_ScorchMark_01_large_F","Land_Decal_ScorchMark_01_small_F"];
							sleep 20;
							_splat = [_rndmsplat, getpos _vehicle, (getDir (_vehicle)) -(random 90),true] call BIS_fnc_createSimpleObject;
							
							//_splat = _rndmsplat createVehicle (getposatl (_this select 0));
							_splat setpos getpos _vehicle;
							mower setpos getpos _vehicle;
							//_splatdirection = getDir _vehicle;
							//_splat setDir _splatdirection;
							_splat setVectorUp surfaceNormal position _splat;
							[_vehicle,_splat] spawn {sleep 1; 
							(_this select 1) setpos 
							[(getPos (_this select 0)) select 0, (getPos (_this select 0)) select 1, 0];		//letz see if shit works.
							(_this select 1) setDir getDir (_this select 0)};


							_splat setVectorUp surfaceNormal position _vehicle;

							//_splat setobjectscale 0.02;
							//[(_splat), 0.5] remoteExec ["setobjectscale", 0]; 
							if (typeOf _splat == "Land_Decal_ScorchMark_01_small_F") then 
							{
								[_splat, 4] remoteExec ["setobjectscale", 0];
							};
							[_splat] spawn {
								//[((_this select 0)), 0.5] remoteExec ["setobjectscale", 0]; 
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
							mower = ["Land_ClutterCutter_large_F", getpos _vehicle, (getDir (_vehicle)) -(random 90),true] call BIS_fnc_createSimpleObject;

							_vehicle enableSimulationGlobal false;
							sleep 600;
							_vehicle setdamage 1;
							[_vehicle , false , true , random [30,60,120]] spawn Schlaak_fnc_fireeffects;

						};



						};
				};





		
	};
	
}
	
];


//};
//};