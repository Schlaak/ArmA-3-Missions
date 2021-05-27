[] execvm "briefing.sqf";

[player] joinsilent black0;
player addMPEventHandler ["MPHit", {
	 [player] spawn {
		 sleep 3 + (random 15);
		  [_this select 0, false] call ace_medical_fnc_setUnconscious;
	 };
}];
player setVariable ["ace_medical_medicclass",2, true];
[] execVM "Schlaak\Immers\antioffroad.sqf";

//It supports both classnames and object names, as well as player UIDs.

[["restricted vehicles"],["allowed drivers"], "Keine Befugnis für dieses Fahrzeug",true,true,true] execVM "02_scripts\restrictVehicles.sqf";

sleep 60;
[] execvm "Schlaak\Feed\introText.sqf";
/*
    	PP_colorC = ppEffectCreate ["ColorCorrections",1500];
		PP_colorC ppEffectEnable true;
		PP_colorC ppEffectAdjust [1.05,2,0,[0,0,0.48,0.03],[1,1,1,1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
		PP_colorC ppEffectCommit 0;
		PP_dynamic = ppEffectCreate ["DynamicBlur",500];
		PP_dynamic ppEffectEnable true;
		PP_dynamic ppEffectAdjust [0.1];
		PP_dynamic ppEffectCommit 0;

*/

