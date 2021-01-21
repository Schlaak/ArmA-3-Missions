//will add an eventhandler to all classes that fires when their init is called
//[] execVM "scripts\spawn_EH.sqf";
diag_log ["#################################### spawn eventhandler init called"];
["Man", "init", {
	//systemChat str _this;
	diag_log ["spawn EH fired with ",_this,"at",time];
	_dude = _this select 0;
	if (faction _dude == "BLU_F") then {
		//systemChat "faction is NATO";
		[_dude] execvm "scripts\dushman.sqf";
	};
	if (faction _dude == "BLU_G_F") then {
		//make sniper
		//systemChat "faction is FIA, make sniper";
		[_dude] execVM "scripts\dushman.sqf";
		[_dude] spawn {
			params ["_dude"];
			sleep 2;
			removeAllWeapons _dude;
			removeAllItems _dude;
			removeAllAssignedItems _dude;
			removeUniform _dude;
			removeVest _dude;
			removeBackpack _dude;
			removeHeadgear _dude;
			removeGoggles _dude;

			_dude addWeapon "CUP_srifle_SVD";
			_dude addPrimaryWeaponItem "CUP_optic_PSO_3";
			_dude addPrimaryWeaponItem "CUP_10Rnd_762x54_SVD_M";

			_dude forceAddUniform "CUP_O_TKI_Khet_Partug_08";
			_dude addVest "CUP_V_OI_TKI_Jacket4_05";

			_dude addItemToUniform "FirstAidKit";
			_dude addItemToUniform "Chemlight_blue";
			_dude addItemToVest "HandGrenade";
			_dude addItemToVest "MiniGrenade";
			for "_i" from 1 to 6 do {_dude addItemToVest "CUP_10Rnd_762x54_SVD_M";};
			_dude addHeadgear "CUP_H_TK_Lungee";

			_dude linkItem "ItemMap";
			_dude linkItem "ItemCompass";
			_dude linkItem "ItemWatch";
		};


		[_dude] execVM "scripts\sniper.sqf";
	}
	}] call CBA_fnc_addClassEventHandler;