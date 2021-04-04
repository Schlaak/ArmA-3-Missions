//[this] call Schlaak_fnc_killed
params ["_unit"]; 
if ((paramsArray select 8) == 0) exitwith {};	//allow wounded?
if !( (vehicle _unit) iskindof "man") exitwith {};
if ( isplayer _unit) exitWith {};	


if (!isNil {_unit getVariable "Schlaak_incap"}) exitWith {};	// Abort function if already called.
if (!isNil {_unit getVariable "Schlaak_dead"}) exitWith {};

_unit setVariable ["Schlaak_dead", 0, false];


/// =================================
// DO STUFF
/// =================================

[_unit] spawn {
	_unit = _this select 0;
	//systemchat str _unit;
	//systemchat str _this select 0;
	//systemchat str getpos _unit;
	_rndmsplat = selectRandom ["BloodSplatter_01_Large_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F"];
	sleep 20;
	_splat = [_rndmsplat, getpos _unit, (getDir (_unit)) -90,true] call BIS_fnc_createSimpleObject;
	//_splat = _rndmsplat createVehicle (getposatl (_this select 0));
	_splat setpos getpos _unit;
	_splatdirection = getDir (_this select 0);
	_splat setDir _splatdirection;
	_splat setVectorUp surfaceNormal position _splat;
	[(_this select 0),_splat] spawn {sleep 1; 
	(_this select 1) setpos 
	[(getPos (_this select 0)) select 0, (getPos (_this select 0)) select 1, 0];		//letz see if shit works.
	(_this select 1) setDir getDir (_this select 0)};
	(_this select 1) setVectorUp surfaceNormal position (_this select 1);

	_splat setobjectscale 0.02;
	[(_splat), 0.5] remoteExec ["setobjectscale", 0]; 
	
	[_splat] spawn {
		[((_this select 0)), 0.5] remoteExec ["setobjectscale", 0]; 
		for "_i" from 1 to (3 + (random 5)) do {
		_scl = getobjectscale (_this select 0);
		[(_this select 0), (_scl*1.05)] remoteExec ["setobjectscale", 0];
		_this select 0 setobjectscale (_scl*1.05);
		(_this select 0) setVectorUp surfaceNormal position (_this select 0);
		sleep 20;
		};
	 	sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);
		sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);	//ultra lazy option to get sure blood stays a while....
		sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);
		sleep 300;
		sleep 300;
		deletevehicle (_this select 0);
	};


};



[_unit] spawn {
	_unit = _this select 0;
	sleep (paramsArray select 4);
	_testo = ["Land_HumanSkeleton_F", getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
	_testo setPos [getPos _testo select 0, getPos _testo select 1, 0.3];
	deleteVehicle (_this select 0);
	[_testo] spawn {
		sleep (paramsArray select 5);
		deleteVehicle (_this select 0);
	};
};