//[this] call Schlaak_fnc_incap

/*
//[this] execVM "Schlaak\Immers\incap.sqf";

this addMPEventHandler ["MPHit", {
	 [player] spawn {
		 sleep 3 + (random 15);
		  [_this select 0, false] call ace_medical_fnc_setUnconscious;
	 };
}];


*/


params ["_unit"]; 
if !(isserver) exitwith {};

if !( (vehicle _unit) iskindof "man") exitwith {

};
/* 
//================================================================
// Exitfunctions
//================================================================
*/
if !(isNil {_unit getVariable "Schlaak_incap"}) exitWith {};	// Abort function if already called.
if ( isplayer _unit) exitWith {};								// Abort if player
_unit setVariable ["Schlaak_incap", 0, false];	
_random = floor random 5;										// Random 1 to 5

waituntil {
	sleep 5;
	(lifeState _unit) != "HEALTHY"; 
	};
sleep 1.5;
[_unit, false] call ace_medical_fnc_setUnconscious;
sleep 0.5;
//if !(_random == 3) exitWith {};									// do it just in one of 5 cases




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
	
	_unit setunitpos "DOWN";
	_anim = selectRandom ["Acts_CivilInjuredLegs_1","Acts_CivilInjuredHead_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredArms_1"];
	[(_unit), "AmovPpneMstpSrasWrflDnon"] remoteExec ["switchmove", 0,true];
	sleep 0.1;
	_unit disableAI "ANIM";
	_unit joinSilent grpNull;


	while {alive _unit} do {
		if !(animationState _unit == _anim) then {
			[(_unit), _anim] remoteExec ["switchmove", 0,true];
		};
		
		sleep 1;
		//_snd = selectrandom ["ACE_hit_Male01GRE_mid_5","ACE_hit_Male01GRE_mid_3","ACE_hit_Male01GRE_mid_2","ACE_hit_Male01GRE_mid_1","ACE_hit_Male01GRE_mid_4"];
		//[_unit,[_snd,60,1,true]] remoteExec ["say3D", 0, false];
		if (!alive _unit) exitwith {};
		sleep 1;
		//_snd = selectrandom ["ACE_hit_Male01GRE_mid_5","ACE_hit_Male01GRE_mid_3","ACE_hit_Male01GRE_mid_2","ACE_hit_Male01GRE_mid_1","ACE_hit_Male01GRE_mid_4"];
		//[_unit,[_snd,60,1,true]] remoteExec ["say3D", 0, false];
		if (!alive _unit) exitwith {};
		sleep 1;
		_snd = selectrandom ["ACE_hit_Male01GRE_mid_5","ACE_hit_Male01GRE_mid_3","ACE_hit_Male01GRE_mid_2","ACE_hit_Male01GRE_mid_1","ACE_hit_Male01GRE_mid_4"];
		[_unit,[_snd,60,1,true]] remoteExec ["say3D", 0, false];
		if (!alive _unit) exitwith {};
	};
	//sleep 30;
	/*
	[(_unit), "AmovPpneMstpSrasWrflDnon"] remoteExec ["switchmove", 0,true];
	_unit enableAI "FSM";
	_unit enableAI "RADIOPROTOCOL";
	_unit setUnitPos "AUTO";
	_unit setVariable ["lambs_danger_disableAI",false];
	[_unit, true] call ace_medical_fnc_setUnconscious;
