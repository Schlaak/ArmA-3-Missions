//[this] call Schlaak_fnc_incap


params ["_unit"]; 
if (!isserver OR (isNull _unit) OR (isNil "Log_Schlaak_Retreat_E") OR (isNil "Log_Schlaak_Retreat_W")) exitWith {};
/* 
//================================================================
// Exitfunctions
//================================================================
*/
if ( isplayer (_this select 0)) exitWith {};
if (!isNil {(_this select 0) getVariable "Schlaak_incap"}) exitWith {};
if (isNil {(_this select 0) getVariable "Schlaak_incap"}) then {(_this select 0) setVariable ["Schlaak_incap", 0, false];};
	 
/* 
//================================================================
// Create blood if unit has more than damage 0.2 and is lifestate "injured"
//================================================================
*/

waitUntil {
		(_unit call ACE_medical_ai_fnc_isInjured)
		//AND (lifestate _unit == "INCAPACITATED")
		};
systemchat format ["%1 is %2 damaged",_unit ,_unit call ACE_medical_ai_fnc_isInjured];		//debug


[_unit] spawn {
	_rndmsplat = selectRandom ["BloodSplatter_01_Large_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F"];
	sleep 2;
	_splat = [_rndmsplat, getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
	//_splat = _rndmsplat createVehicle (getposatl (_this select 0));
	_splat setpos getpos (_this select 0);
	_splatdirection = getDir (_this select 0);
	_splat setDir _splatdirection;
	[(_this select 0),_splat] spawn {sleep 1; (_this select 1) setpos (getpos (_this select 0));  (_this select 1) setDir getDir (_this select 0)};
	_splat setobjectscale 0.1;
	[_splat] spawn {
		for "_i" from 1 to (3 + (random 9)) do {
		_scl = getobjectscale (_this select 0);
		_this select 0 setobjectscale (_scl + 0.1);
		};
	 	sleep 0.5;
	}


};



/* 
//================================================================
// recheck if injured. and animation + screams and moans
//================================================================
*/

while {alive _unit} do {
waitUntil {lifestate _unit == "INJURED"};
[_unit] spawn {
	waitUntil {
		sleep 3;
		(!(lifestate (_this select 0) == "INCAPACITATED"))
		};
		
	[(_this select 0), (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"])] remoteExec ["switchMove", 0];
	};
	(_this select 0) disableai "RADIOPROTOCOL";
	(_this select 0) disableAI "FSM";
	dostop (_this select 0);
	(_this select 0) unlinkItem "itemmap";
	(_this select 0) unlinkItem "itemradio";
	(_this select 0) setVariable ["lambs_danger_disableAI",true];
	(_this select 0) setObjectMaterialGlobal [0, "A3\Characters_F\Common\Data\basicbody_injury.rvmat"];
	(_this select 0) setcaptive true;
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
//================================================================
// pack up body & deletion
//================================================================
*/