//[this] call Schlaak_fnc_incap


params ["_unit"]; 
if (! isserver OR (isNull _unit) OR (isNil "Log_Schlaak_Retreat_E") OR (isNil "Log_Schlaak_Retreat_W")) exitWith {};
/* 
//================================================================
// Exitfunctions
//================================================================
*/
if (!isNil {_unit getVariable "Schlaak_incap"}) exitWith {};	// Abort function if already called.
if ( isplayer _unit) exitWith {};								// Abort if player

_random = floor random 6;										// Random 1 to 5

//diag_log str [_random];
//systemchat str _random;

if !(_random == 5) exitWith {};									// do it just in one of 5 cases
_unit setVariable ["Schlaak_incap", 0, false];					// unit already affected so give him the var





//================================================================
// Disable everything for that dude
//================================================================
	_unit disableai "RADIOPROTOCOL";
	_unit disableAI "FSM";
	dostop _unit;
	_unit unlinkItem "itemmap";
	_unit unlinkItem "itemradio";
	_unit setVariable ["lambs_danger_disableAI",true];
	_unit setObjectMaterialGlobal [0, "A3\Characters_F\Common\Data\basicbody_injury.rvmat"];
	_unit setcaptive true;


//diag_log ["Schlaak_fnc_incap: GREIFT"];
//systemchat "Schlaak_fnc_incap: GREIFT";
//	systemchat str _unit;
//	systemchat str _this select 0;
/* 
//================================================================
// Bloodsplats
//================================================================
*/

///systemchat format ["%1 is %2 damaged",_unit ,_unit call ACE_medical_ai_fnc_isInjured];		//debug


[_unit] spawn {
	_unit = _this select 0;
	//systemchat str _unit;
	//systemchat str _this select 0;
	//systemchat str getpos _unit;
	_rndmsplat = selectRandom ["BloodSplatter_01_Large_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F"];
	sleep 2;
	_splat = [_rndmsplat, getpos _unit, (getDir (_unit)) -90,true] call BIS_fnc_createSimpleObject;
	//_splat = _rndmsplat createVehicle (getposatl (_this select 0));
	_splat setpos getpos _unit;
	_splatdirection = getDir (_this select 0);
	_splat setDir _splatdirection;
	[(_this select 0),_splat] spawn {sleep 1; (_this select 1) setpos (getpos (_this select 0));  (_this select 1) setDir getDir (_this select 0)};
	_splat setobjectscale 0.05;
	[_splat] spawn {
		for "_i" from 1 to (3 + (random 9)) do {
		_scl = getobjectscale (_this select 0);
		_this select 0 setobjectscale (_scl + 0.05);
		sleep 20;
		};
	 	sleep Schlaak_dietime + Schlaak_bodybagtime + Schlaak_bagremovaltime;
		deletevehicle (_this select 0);
	}


};


/* 
//================================================================
// Animations		
//	TODO: WIP
//================================================================
*/
_unit setunitpos "DOWN";
//[_unit] call ace_medical_statemachine_fnc_resetStateDefault;
[_unit, true] call ace_medical_status_fnc_setUnconsciousState;
_bodypart = selectrandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
[_unit, 0.8, _bodypart, "bullet"] call ace_medical_fnc_addDamageToUnit;
_unit disableai "ANIM";


[_unit] spawn {
	sleep floor random 15;
	//_anim = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
	[(_this select 0), false] call ace_medical_status_fnc_setUnconsciousState;
	//[(_this select 0), _anim] remoteExec ["switchmove", 0];




	};


	_anim = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
	[(_this select 0), false] call ace_medical_status_fnc_setUnconsciousState;
	[(_this select 0), _anim] remoteExec ["switchmove", 0];


/*		!!! DIS SHIT WILL KILL DA GAME
while {alive (_unit)} do {
		sleep 3;
		[(_unit),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		sleep 5;
		[(_unit),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		sleep 3;
		[(_unit), _anim] remoteExec ["switchmove", 0];
	};
*/



/*
while {alive _unit} do {
waitUntil {lifestate _unit == "INJURED"};
[_unit] spawn {
	waitUntil {
		sleep 3;
		(!(lifestate (_this select 0) == "INCAPACITATED"))
		};
		
	[(_this select 0), (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"])] remoteExec ["switchMove", 0];
	};

	sleep 3;
	_moansound = selectrandom schlaak_suffersounds;
	[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
	sleep 5;
	_moansound = selectrandom schlaak_suffersounds;
	[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
	sleep 5;
	//[[(_this select 0),""] remoteExec ["switchMove"]];

};












/*
if (isNil {_unit getVariable "Schlaak_incap"}) then {(_this select 0) setVariable ["Schlaak_incap", 0, false];};
	 


	if (isNil {_unit getVariable "Schlaak_incap"}) exitWith {};