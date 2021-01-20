_unit = __unit select 0;

/*****************************************************************
	following section to run only on server.
	Note: duplicate respective code in the pve in the init.sqf
******************************************************************/
if(isServer) then{
	[_unit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
} else {
	bon_recruit_newunit = _unit;
	publicVariable "bon_recruit_newunit";
};

if (_unit isKindOf "cwr3_o_soldier_backpack") then
{
if (!local _unit) exitWith {};

// "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// "Add weapons";
_unit addWeapon "CUP_arifle_AK74";
_unit addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

// "Add containers";
_unit forceAddUniform "cwr3_o_uniform_m1982_lacers";
_unit addVest "cwr3_o_vest_harness_ak74";
_unit addBackpack "cwr3_o_backpack_rd54_ak74";

// "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 6 do {_unit addItemToUniform "CUP_30Rnd_545x39_AK_M";};
_unit addItemToVest "CUP_30Rnd_545x39_AK_M";
for "_i" from 1 to 4 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
_unit addItemToBackpack "FirstAidKit";
for "_i" from 1 to 19 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_1Rnd_HE_GP25_M";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
_unit addHeadgear "cwr3_o_headgear_ssh68";

// "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";


} else {
if (!local _unit) exitWith {};

// "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// "Add weapons";
_unit addWeapon "CUP_arifle_AK74";
_unit addPrimaryWeaponItem "CUP_30Rnd_545x39_AK_M";

// "Add containers";
_unit forceAddUniform "cwr3_o_uniform_m1982_lacers";
_unit addVest "cwr3_o_vest_harness_ak74";
_unit addBackpack "cwr3_o_backpack_rd54_ak74";

// "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 6 do {_unit addItemToUniform "CUP_30Rnd_545x39_AK_M";};
_unit addItemToVest "CUP_30Rnd_545x39_AK_M";
for "_i" from 1 to 4 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
_unit addItemToBackpack "FirstAidKit";
for "_i" from 1 to 19 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_1Rnd_HE_GP25_M";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
_unit addHeadgear "cwr3_o_headgear_ssh68";

// "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
removeBackpack _unit;
};


/*****************************************************************
	Client Stuff
******************************************************************/
_unit addAction ["<t color='#949494'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],-10,false,true,""];