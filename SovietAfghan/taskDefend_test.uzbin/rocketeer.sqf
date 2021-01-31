
_firedCode = {
	//diag_log ["fired EH fired with ",_this,"at",time];
	//[O Alpha 1-1:1 (IR0NSIGHT),"CUP_arifle_AK74_GL","CUP_arifle_AK74_GL","FullAuto","CUP_B_545x39_Ball","CUP_30Rnd_545x39_AK_M",666652: tracer_white.p3d,O Alpha 1-1:1 (IR0NSIGHT)]
	params ["_unit","_weapon","_muzzle(?)","_firemode","_ammo","_magazine","_bulletobj"];
	if (!(isPlayer _unit) &&( _weapon isKindOf "MissileLauncher")) then {
		diag_log ["AI fired Rocket:",_weapon,_ammo];
	};

};
["CAManBase", "fired", _firedCode] call CBA_fnc_addClassEventHandler;



/**
params ["_guy"];

//make unit more likely to fire an RPG
while {alive _guy} do {
	sleep Random 15 + 10;
	//check if guy has an RPG

	//disable primary weapon
	//Vanilla rpg 7V round macht viel effekt, wenig schaden
	//cup FRAG round macht wenig effekt, viel schaden.
};