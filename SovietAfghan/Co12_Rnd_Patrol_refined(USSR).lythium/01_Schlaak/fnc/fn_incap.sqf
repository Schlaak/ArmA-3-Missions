//[this] call Schlaak_fnc_incap


params ["_unit"]; 
if ((paramsArray select 8) == 0) exitwith {};	//allow wounded?


//if (! isserver OR (isNull _unit) OR (isNil "Log_Schlaak_Retreat_E") OR (isNil "Log_Schlaak_Retreat_W")) exitWith {};
if !( (vehicle _unit) iskindof "man") exitwith {
	//systemchat str _unit;
	//systemchat "this unit can not be inCap ed. cause of vehicle.";
	//systemchat str vehicle _unit;
};
/* 
//================================================================
// Exitfunctions
//================================================================
*/
if (!isNil {_unit getVariable "Schlaak_incap"}) exitWith {};	// Abort function if already called.
if ( isplayer _unit) exitWith {};								// Abort if player

_random = floor random 10;										// Random 1 to 5

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
	_splat setVectorUp surfaceNormal position _splat;
	[_splat, 0.2] remoteExec ["setobjectscale", 0]; 


//fixme
//sometimes blood floats.... so maybe something like 
/*
    _obj setPos [getPos _obj select 0, getPos _obj select 1, 0.1];
*/


	[(_this select 0),_splat] spawn {sleep 1; 
	(_this select 1) setpos 



		//(getpos (_this select 0))		//worked.
		
		
		[(getPos (_this select 0)) select 0, (getPos (_this select 0)) select 1, 0]		//letz see if shit works.
		;  
		(_this select 1) setDir getDir (_this select 0)};
		(_this select 1) setVectorUp surfaceNormal position (_this select 1);
		[(_this select 1), 0.5] remoteExec ["setobjectscale", 0]; 




	//[(_this select 0), _splat] call BIS_fnc_attachToRelative;	//should not be used unless u want stiff corpses...
	
	//[(_x), _anim] remoteExec ["setobjectscale", 0]; 
	_splat setobjectscale 0.5;
	
	
	[_splat] spawn {
		[((_this select 0)), 0.5] remoteExec ["setobjectscale", 0]; 
		for "_i" from 1 to (3 + (random 9)) do {
		_scl = getobjectscale (_this select 0);
		sleep 10;
		[(_this select 0), (_scl*1.05)] remoteExec ["setobjectscale", 0];
		_this select 0 setobjectscale (_scl*1.05);
		sleep 10;
		};
	 	sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);
		sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);	//ultra lazy option to get sure blood stays a while....
		sleep (paramsArray select 3) + (paramsArray select 4) + (paramsArray select 5);
		sleep 300;
		sleep 300;
		deletevehicle (_this select 0);
	};


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


_InjuryKind = selectrandom [true,false];
//systemchat str _InjuryKind;




if (_InjuryKind) then {
//
// INJURYKIND TRUE (scream and twitch)
//
[_unit] spawn {
	sleep floor random 15;
	//_anim = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
	[(_this select 0), false] call ace_medical_status_fnc_setUnconsciousState;
	//[(_this select 0), _anim] remoteExec ["switchmove", 0];


	_anim = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
	while {alive (_this select 0)} do {
		_moansound = selectrandom schlaak_suffersounds;
		
		[(_this select 0), _anim] remoteExec ["switchmove", 0];
		sleep 3;
		[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		sleep 5;
		[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		sleep 3;
		[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		(_this select 0) setdamage (damage (_this select 0) + 0.05);
		};


	};


} else {
//
// INJURYKIND FALSE downed...
//
[_unit] spawn {
	sleep floor random 15;
	//_anim = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
	[(_this select 0), true] call ace_medical_status_fnc_setUnconsciousState;
	//[(_this select 0), _anim] remoteExec ["switchmove", 0];

	while {alive (_this select 0)} do {
		//_moansound = selectrandom schlaak_suffersounds;
		//_anim = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
		//[(_this select 0), _anim] remoteExec ["switchmove", 0];
		sleep 3;
		//[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		sleep 5;
		//[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		sleep 3;
		//[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		(_this select 0) setdamage (damage (_this select 0) + 0.05);
		[(_this select 0), true] call ace_medical_status_fnc_setUnconsciousState;
		};


	};



};




//================================================================
// Corpse cleanup		
//	TODO: WIP
//================================================================

//waituntil {! alive _unit};
[_unit] spawn {
_unit = _this select 0;
waitUntil { not alive _unit };
	
switch (faction (_this select 0)) do
	{
		case "cwr3_faction_usa":
		{	

			

				
				//
				sleep (paramsArray select 4);
				_testo = ["cwr3_body_us", getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
				_testo setPos [getPos _testo select 0, getPos _testo select 1, 0.3];
				deleteVehicle (_this select 0);
				[_testo] spawn {
					sleep (paramsArray select 5);
					deleteVehicle (_this select 0);

					
				};
		};

		case "cwr3_faction_rus":
		{

				sleep (paramsArray select 4);
				_testo = ["cwr3_body_ru", getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
				_testo setPos [getPos _testo select 0, getPos _testo select 1, 0.3];
				deleteVehicle (_this select 0);
				[_testo] spawn {
					sleep (paramsArray select 5);
					deleteVehicle (_this select 0);
				

			};
		};
		default
		{

			
			sleep (paramsArray select 4);
			_testo = ["Land_HumanSkeleton_F", getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
			_testo setPos [getPos _testo select 0, getPos _testo select 1, 0.3];
			deleteVehicle (_this select 0);
			[_testo] spawn {
				sleep (paramsArray select 5);
				deleteVehicle (_this select 0);
	
				};
		};
	};

};