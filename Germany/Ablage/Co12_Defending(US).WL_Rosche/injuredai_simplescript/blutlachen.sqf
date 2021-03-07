_victim = _this select 0;
_Time_to_delete	= 1800;
_anim = selectRandom ["UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveHead_A",
"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B",
"ace_unconscious_1_1","ace_unconscious_10","ace_unconscious_1","ace_unconscious_2","ace_unconscious_2_1","ace_unconscious_3","ace_unconscious_3_1","ace_unconscious_4","ace_unconscious_4_1","ace_unconscious_5","ace_unconscious_5_1","ace_unconscious_6","ace_unconscious_6_1","ace_unconscious_7","ace_unconscious_7_1","ace_unconscious_8","ace_unconscious_9","Acts_StaticDeath_01","Acts_StaticDeath_02","Acts_StaticDeath_03","Acts_StaticDeath_04","Acts_StaticDeath_05","Acts_StaticDeath_06","Acts_StaticDeath_07","Acts_StaticDeath_08","Acts_StaticDeath_09"];


if (isServer) then {

if (!(underwater _victim) or ((getPosASLW _victim select 2) > -1.5)) then {

	//Spawns flies around position.
	//https://community.bistudio.com/wiki/BIS_fnc_flies
	_rndmsplat = selectRandom ["BloodSplatter_01_Large_New_F","BloodPool_01_Large_New_F","BloodSplatter_01_Medium_New_F"];
	_splat = _rndmsplat createVehicle (getposatl _victim);
	_splat setpos getpos _victim;
	_splatdirection = getDir _victim;
	_splat setDir _splatdirection;


/* TODO
Mehrere verwundetenstadien!
eines wo sie ohne waffe rumlaufen
eines wo se nur panik schieben
eines wo die gedärme rausfallen
Texturlayer 0 für blutlachen
3rdScripts\injuredai_simplescript\bloodnguts3.paa
3rdScripts\injuredai_simplescript\bloodnguts2.paa
3rdScripts\injuredai_simplescript\bloodnguts1.paa
*/
	//17.04.2020 WIP
	sleep 3;


	[_victim] call ace_medical_statemachine_fnc_resetStateDefault; 	//17.04.2020 WIP

	_victim disableai "RADIOPROTOCOL";
	_victim switchmove "";
	_victim playmove "";											//17.04.2020 WIP
	_victim setdamage 0.8;
	_victim setcaptive true;
	removeallweapons _victim;
	_victim switchmove _anim;
	_victim playmove _anim;
	_victim disableAI "FSM";

	//_null = [_victim, _anim] spawn inCap;							//17.04.2020 WIP




	//17.04.2020 WIP

	sleep (600 + (random 220));
	_Flies = [position _victim, 1.8, 0.2] call BIS_fnc_flies;
		sleep (600 + (random 220));
	deletevehicle _victim;
	{deleteVehicle _x;} forEach _Flies;
	deletevehicle _splat;
	};
	};

/*
	_Flies_Sound = "#particlesource" createVehicle ASLToAGL getPosWorld _victim;
//
// Delete_Flies_Sound vielleicht als lokale variable definieren.
//
	_Delete_Flies_Sound = false;
	publicVariable "Delete_Flies_Sound";

	[] spawn{
	while {!_Delete_Flies_Sound} do
		{
			[_Flies_Sound, "Flies_SFX", 45] call CBA_fnc_globalSay3d;
	//_Flies_Sound say3D "Flies_SFX";
	//systemchat "say3D Flies_SFX";
    sleep 20;
		};
	};

	sleep _Time_to_delete;

	//	systemchat "delete Flies";
	_Delete_Flies_Sound = true;
	deleteVehicle _Flies_Sound;
	deletevehicle _victim;
	{deleteVehicle _x;} forEach _Flies;
	deletevehicle _splat;
	};
	sleep _Time_to_delete;
	deletevehicle _victim;

	};
//if !(isServer) exitWith {};








