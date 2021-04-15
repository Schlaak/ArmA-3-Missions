//[this] call Schlaak_fnc_incap
params ["_unit"]; 

if (!isserver OR (isNull _unit) OR (isNil "Log_Schlaak_Retreat_E") OR (isNil "Log_Schlaak_Retreat_W")) exitWith {};
[_unit] spawn {
	if ( isplayer (_this select 0)) exitWith {};
	if (!isNil {(_this select 0) getVariable "Schlaak_incap"}) exitWith {};
	 if (isNil {(_this select 0) getVariable "Schlaak_incap"}) then {(_this select 0) setVariable ["Schlaak_incap", 0, false];};
	 
while {alive (_this select 0)}
    do {
waitUntil { lifestate (_this select 0) == "INCAPACITATED" };
_anim1 = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
_anim2 = selectrandom ["ace_unconscious_1_1","ace_unconscious_10","ace_unconscious_1","ace_unconscious_2","ace_unconscious_2_1",
"ace_unconscious_3","ace_unconscious_3_1","ace_unconscious_4","ace_unconscious_4_1","ace_unconscious_5",
"ace_unconscious_5_1","ace_unconscious_6","ace_unconscious_6_1","ace_unconscious_7","ace_unconscious_7_1",
"ace_unconscious_8","ace_unconscious_9","Acts_StaticDeath_01","Acts_StaticDeath_02","Acts_StaticDeath_03",
"Acts_StaticDeath_04","Acts_StaticDeath_05","Acts_StaticDeath_06","Acts_StaticDeath_07","Acts_StaticDeath_08","Acts_StaticDeath_09","UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveHead_A",
"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_anim = selectrandom [_anim1];
if (!(underwater (_this select 0)) or ((getPosASLW (_this select 0) select 2) > -1.5)) then {

	//Spawns flies around position.
	//https://community.bistudio.com/wiki/BIS_fnc_flies
	_rndmsplat = selectRandom ["BloodSplatter_01_Large_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F"];
	
	
	
	_splat = [_rndmsplat, getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
	//_splat = _rndmsplat createVehicle (getposatl (_this select 0));
	_splat setpos getpos (_this select 0);
	_splatdirection = getDir (_this select 0);
	_splat setDir _splatdirection;
	[(_this select 0),_splat] spawn {sleep 1; (_this select 1) setpos (getpos (_this select 0));  (_this select 1) setDir getDir (_this select 0)};

	//[(_this select 0)] call ace_medical_statemachine_fnc_resetStateDefault;
	(_this select 0) disableai "RADIOPROTOCOL";
	(_this select 0) setVariable ["lambs_danger_disableAI",true];
	(_this select 0) switchmove "";
	(_this select 0) playmove "";											//17.04.2020 WIP
	(_this select 0) setObjectMaterialGlobal [0, "A3\Characters_F\Common\Data\basicbody_injury.rvmat"];
	(_this select 0) setcaptive true;
	removeallweapons (_this select 0);
	removeallitems (_this select 0);
	(_this select 0) switchmove _anim;
	(_this select 0) playmove _anim;
	[_this select 0, true] call ace_medical_engine_fnc_setUnconsciousAnim;
	[(_this select 0)] call ace_medical_statemachine_fnc_resetStateDefault;
	[(_this select 0), true] call ace_medical_fnc_setUnconscious;
	[(_this select 0), true] call ace_medical_engine_fnc_setUnconsciousAnim;
	[(_this select 0), _anim] call ace_medical_engine_fnc_applyAnimAfterRagdoll;
	[[(_this select 0),""] remoteExec ["switchMove"]];
	(_this select 0) playMove _anim;
	(_this select 0) disableAI "FSM";
	
	(_this select 0) unlinkItem "itemmap";
	(_this select 0) unlinkItem "itemradio";



/*
	[(_this select 0)] spawn 
	{
		hint str (_this select 0);
		waitUntil ( ((lifestate (_this select 0)) NOT "INJURED") OR (lifestate (_this select 0) == "HEALTHY"));
		[cursorTarget,0,["ACE_Actions"]] call ace_interact_menu_fnc_removeActionFromObject; //remove ace actions
		(_this select 0) playmove (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"]);
		sleep 60 + (random 300);
		(_this select 0) setdamage 1;
	};
*/


while {lifestate (_this select 0) == "INCAPACITATED"}
    do {
		if ( isplayer (_this select 0)) exitWith {};
		
		_moansound = selectrandom schlaak_suffersounds;
		[(_this select 0), _anim1] call ace_medical_engine_fnc_applyAnimAfterRagdoll;

		//(_this select 0) playMove _anim;
		
        (_this select 0) setDamage (damage (_this select 0) + 0.1);
		sleep 3;
		if (_anim == _anim1) then {[ (_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;};
		
		sleep 5;
		if (damage  (_this select 0) < 0.2) then { (_this select 0) setUnconscious false;}
    };

[(_this select 0)] spawn {
	waitUntil { (!(lifestate (_this select 0) == "INCAPACITATED"))};
	[(_this select 0), (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"])] remoteExec ["switchMove", 0];
	};

while {(!(lifestate (_this select 0) == "INCAPACITATED")) AND !(lifestate (_this select 0) == "DEAD")}
    do {
		if ( isplayer (_this select 0)) exitWith {};
		
		_moansound = selectrandom schlaak_suffersounds;
		
		//[(_this select 0), (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"])] remoteExec ["switchMove", 0];
		//_this select 0) switchMove (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"]);
        (_this select 0) setDamage (damage (_this select 0) + 0.1);
		sleep 3;
		[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		
		sleep 5;
		[(_this select 0),_moansound, (10+ (random 20)) ] call Schlaak_fnc_say;
		sleep 5;
		[(_this select 0), (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"])] remoteExec ["playmove", 0];
		(_this select 0) disableAI "FSM";
		(_this select 0) setVariable ["lambs_danger_disableAI",true];
		dostop (_this select 0);
	};
//if ( lifestate (_this select 0) != "INCAPACITATED") exitWith {(_this select 0) switchmove (selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"])};
_flies = [position _splat, 0.2, 1.5] call BIS_fnc_flies;
[(_this select 0)] spawn {
	waitUntil {!alive (_this select 0)};
	sleep Schlaak_bodybagtime;
	switch (faction (_this select 0)) do
	{
		case "cwr3_faction_usa":
		{	

			//["cwr3_body_us", [(getPosWorld (_this select 0)) select 0,(getPosWorld (_this select 0)) select 1,(getposatl (_this select 0))], (getDir (_this select 0)) -90,true] call BIS_fnc_createSimpleObject;
			_testo = ["cwr3_body_us", getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
			_testo setPos [getPos _testo select 0, getPos _testo select 1, 0.3];
			[_testo] spawn {
				sleep Schlaak_bagremovaltime;
				deleteVehicle (_this select 0);
				};
		};

		case "cwr3_faction_rus":
		{
			//_corpse = createSimpleObject ["\cwr3\general\cwr3_misc\cwr3_deadbody_ru.p3d", [(position (_this select 0))select 0,(position (_this select 0))select 1,((position (_this select 0)) select 2) + 1]];
			//["cwr3_body_ru", [(getPosWorld (_this select 0)) select 0,(getPosWorld (_this select 0)) select 1,(getposatl (_this select 0))], (getDir (_this select 0)) -90,true] call BIS_fnc_createSimpleObject;
			_testo = ["cwr3_body_ru", getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
			_testo setPos [getPos _testo select 0, getPos _testo select 1, 0.3];
			[_testo] spawn {
				sleep Schlaak_bagremovaltime;
				deleteVehicle (_this select 0);
			};
		};
		default
		{
			//["Body", [(getPosWorld (_this select 0)) select 0,(getPosWorld (_this select 0)) select 1,(getposatl (_this select 0))], (getDir (_this select 0)) -90,true] call BIS_fnc_createSimpleObject;
			_testo = ["Body", getposworld (_this select 0), (getDir ((_this select 0))) -90,true] call BIS_fnc_createSimpleObject;
			_testo setPos [getPos _testo select 0, getPos _testo select 1, 0.3];
			[_testo] spawn {
				sleep Schlaak_bagremovaltime;
				deleteVehicle (_this select 0);
				};
		};
	};
	
	deleteVehicle (_this select 0);
	sleep 60;

	}; 	//delete unit






[_splat,_flies] spawn {
	sleep Schlaak_bagremovaltime; 
	deletevehicle (_this select 0)};				//delete blood
	deletevehicle (_this select 1);
};
};
};