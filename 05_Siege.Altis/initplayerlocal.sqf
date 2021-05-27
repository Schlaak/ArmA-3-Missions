[] execvm "briefing.sqf";
removeGoggles player;
player addGoggles "CUP_G_ESS_BLK_Facewrap_Black";
[player] joinsilent black0;

_vestitems = vestItems player;
_items = uniformItems player;
_vest = selectrandom ["CUP_V_B_RRV_Scout","CUP_V_B_RRV_Scout2","CUP_V_B_RRV_Scout3_GRN","CUP_V_B_RRV_TL",
"CUP_V_JPC_communicationsbelt_rngr","CUP_V_JPC_Fastbelt_rngr","CUP_V_JPC_lightbelt_rngr","CUP_V_JPC_weaponsbelt_rngr","CUP_V_JPC_tlbelt_rngr"];
removevest player;
sleep 0.5;
player addvest _vest;
{
	player addItemToVest _x
} foreach _vestitems;
_uniform = selectrandom ["U_I_CombatUniform_shortsleeve","U_I_CombatUniform","SLTS_U_AAFex_TankTopGreen","SLTS_U_AAFex_Sweater",
"CUP_U_B_BDUv2_gloves_dirty_Tigerstripe","CUP_U_B_BDUv2_roll2_gloves_dirty_Tigerstripe","CUP_U_B_BDUv2_roll_gloves_dirty_Tigerstripe",
"CUP_U_CRYE_RGR_Roll"];
player forceAddUniform _uniform;
sleep 0.5;
{
	player addItemToUniform _x
} foreach _items;




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

