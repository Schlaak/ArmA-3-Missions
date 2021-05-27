params ["_unit"];
if !(isserver) exitwith {};
if (!isNil {_unit getVariable "Schlaak_sauerei"}) exitWith {};
//if (hasInterface)  exitwith {};
_unit setVariable ["Schlaak_sauerei", 0, false];
[_unit] spawn {
	params ["_unit"];
	_rndmsplat = selectRandom ["BloodSplatter_01_Large_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F"];
	sleep 2;
	_splat = [_rndmsplat, getpos _unit, (getDir (_unit)) -90,true] call BIS_fnc_createSimpleObject;

	_splat setpos getpos _unit;
	_splatdirection = getDir (_this select 0);
	_splat setDir _splatdirection;
	_splat setVectorUp surfaceNormal position _unit;
	[_splat, 0.2] remoteExec ["setobjectscale", 0];


	[(_this select 0),_splat] spawn {
		sleep 1;
		(_this select 1) setpos
		[(getPos (_this select 0)) select 0, (getPos (_this select 0)) select 1, 0];		//letz see if shit works.
		(_this select 1) setDir getDir (_this select 0);
	};


	//[(_this select 0), _splat] call BIS_fnc_attachToRelative;	//should not be used unless u want stiff corpses...

	//[(_x), _anim] remoteExec ["setobjectscale", 0];
	[_splat, 0.2] remoteExec ["setobjectscale", 0];


	[_splat,_unit] spawn {
		[((_this select 0)), 0.2] remoteExec ["setobjectscale", 0];
		for "_i" from 1 to (3 + (random 9)) do {
		_scl = getobjectscale (_this select 0);
		sleep 10;
		[(_this select 0), (_scl*1.05)] remoteExec ["setobjectscale", 0];

		_this select 0 setobjectscale (_scl*1.05);
		(_this select 0) setVectorUp surfaceNormal getpos (_this select 1);
		sleep 10;
		};
	 	sleep 3600;


		deletevehicle (_this select 0);
		deletevehicle (_this select 1);
	};


};
