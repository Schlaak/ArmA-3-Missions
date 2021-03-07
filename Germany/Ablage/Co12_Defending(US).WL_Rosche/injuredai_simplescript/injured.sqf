
dam_warVoice = [_this, 0, true, [true]] call BIS_fnc_param;
dam_dropSmoke = [_this, 1, true, [true]] call BIS_fnc_param;
dam_dragcover = [_this, 2, true, [true]] call BIS_fnc_param;
dam_injured = [_this, 3, 50, [50]] call BIS_fnc_param;
dam_hitReact = [_this, 4, 20, [20]] call BIS_fnc_param;

if (dam_warVoice) then {[] execvm "injuredai_simplescript\voices.sqf";};

if (isServer) then {
//by Larrow
Lar_fnc_setunconscious = {
	params[ "_unit" ];
[ _unit, true ] remoteExec [ "setUnconscious", _unit ];

};

Lar_fnc_wake = {
	params[ "_unit" ];
[ _unit, false ] remoteExec [ "setUnconscious", _unit ];

};

};

sleep 1;
//[_unit, false] call ace_medical_fnc_setUnconscious;

//function injured
fnc_injured = {
     private ["_unit"];
	_unit = _this select 0;


_chance = random 100;
if ((_chance < dam_hitReact) && (!isNull _unit) && (unitPos _unit == "UP")) then {


	_unit forceSpeed 10;


_rnd = selectRandom [0,1,2,3,4];
if (_rnd == 0) then {_unit switchmove "AmovPercMevaSrasWrflDfl_AmovPknlMstpSrasWrflDnon";};
if (_rnd == 1) then {_unit switchmove "AmovPercMevaSrasWrflDfr_AmovPknlMstpSrasWrflDnon";};
if (_rnd == 2) then {_unit switchmove "AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon_old";};
if (_rnd == 3) then {_unit switchmove "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon";};
if (_rnd == 4) then {_unit switchmove "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright";};

        _unit forceSpeed -1;
		_unit setBehaviour "COMBAT";
		sleep 5;
		_unit switchmove "";



} else {


    _unit removeAllMPEventHandlers "MPHit";
	_unit removeAllMPEventHandlers "MPKilled";


[ _unit ] remoteExec [ "Lar_fnc_setunconscious", 2 ];

////////////////////////////////////// hit sound
//sound for WEST units



if (side _unit == west) then {
//add hit sounds here
_hitSound = selectRandom [

"hit_0","hit_1","hit_2","hit_3","hit_4","hit_5","hit_6","hit_7","hit_8","hit_9","hit_10","hit_11","hit_12","hit_13","hit_14","hit_15","hit_16","hit_17","hit_18","hit_19","hit_20","hit_21","hit_22","hit_23","hit_24","hit_25","hit_26","hit_27","hit_28","hit_29","hit_30"

];

_unit say3D _hitSound;
} else {

//sound for EAST units
if (side _unit == east) then {
//add hit sounds here
_hitSound = selectRandom [

"hit_0","hit_1","hit_2","hit_3","hit_4","hit_5","hit_6","hit_7","hit_8","hit_9","hit_10","hit_11","hit_12","hit_13","hit_14","hit_15","hit_16","hit_17","hit_18","hit_19","hit_20","hit_21","hit_22","hit_23","hit_24","hit_25","hit_26","hit_27","hit_28","hit_29","hit_30"

];
_unit say3D _hitSound;
} else {

//sound for independent/civilians units
_hitSound = selectRandom [

"hit_0","hit_1","hit_2","hit_3","hit_4","hit_5","hit_6","hit_7","hit_8","hit_9","hit_10","hit_11","hit_12","hit_13","hit_14","hit_15","hit_16","hit_17","hit_18","hit_19","hit_20","hit_21","hit_22","hit_23","hit_24","hit_25","hit_26","hit_27","hit_28","hit_29","hit_30"

];
_unit say3D _hitSound;
};



};

/////////////////////////////////////////////////////////////////////

_unit addMPEventHandler ["MPKilled", {_this execVM "injuredai_simplescript\killer.sqf";}];
//17.04.2020 temporär rausgenommen



sleep 3;

_anim = selectRandom [
"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveHead_A",
"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B",
"ace_unconscious_1_1","ace_unconscious_10","ace_unconscious_1","ace_unconscious_2","ace_unconscious_2_1","ace_unconscious_3","ace_unconscious_3_1","ace_unconscious_4","ace_unconscious_4_1","ace_unconscious_5","ace_unconscious_5_1","ace_unconscious_6","ace_unconscious_6_1","ace_unconscious_7","ace_unconscious_7_1","ace_unconscious_8","ace_unconscious_9","Acts_StaticDeath_01","Acts_StaticDeath_02","Acts_StaticDeath_03","Acts_StaticDeath_04","Acts_StaticDeath_05","Acts_StaticDeath_06","Acts_StaticDeath_07","Acts_StaticDeath_08","Acts_StaticDeath_09"
];

//[_unit, false] call ace_medical_fnc_setUnconscious;

sleep 2;
_unit playmove "";
// [_unit, false] call ace_medical_status_fnc_setUnconsciousState; // 17.04.2020 WIP
[_unit] execVM "injuredai_simplescript\blutlachen.sqf"; // 17.04.2020 WIP
//_null = [_unit, _anim] spawn inCap;

////////////////////////////////////////////// in pain sound loop
//play sounds while man is injured, not dead yet
while {(alive _unit)} do {

//change sound play loop time here
sleep (10 + random 20);

_ls = lifeState _unit;
if (_ls != "INCAPACITATED") exitWith {};

//sound for WEST units
if (side _unit == west) then {
//add in pain sound here
_sound = selectRandom [

"suffer_0","suffer_1","suffer_2","suffer_3","suffer_4","suffer_5","suffer_6","suffer_7","suffer_8","suffer_9","suffer_10","suffer_11","suffer_12","suffer_13","suffer_14","suffer_15","suffer_16","suffer_17","suffer_18","suffer_19","suffer_20","suffer_21","suffer_22","suffer_23","suffer_24","suffer_25","suffer_26","suffer_27","suffer_28","suffer_29","suffer_30","suffer_31","suffer_32","suffer_33","suffer_34","suffer_35","suffer_36","suffer_37","suffer_38","suffer_39","suffer_40","suffer_41","suffer_42","suffer_43","suffer_44","suffer_45","suffer_46","suffer_47","suffer_48","suffer_49","suffer_50","suffer_51","suffer_52","suffer_53","suffer_54","suffer_55","suffer_56","suffer_57","suffer_58","suffer_59","suffer_60","suffer_61","suffer_62"
];
_unit say3D _sound;
} else {

//sound for EAST units
if (side _unit == east) then {
//add in pain sound here
_sound = selectRandom [

"suffer_0","suffer_1","suffer_2","suffer_3","suffer_4","suffer_5","suffer_6","suffer_7","suffer_8","suffer_9","suffer_10","suffer_11","suffer_12","suffer_13","suffer_14","suffer_15","suffer_16","suffer_17","suffer_18","suffer_19","suffer_20","suffer_21","suffer_22","suffer_23","suffer_24","suffer_25","suffer_26","suffer_27","suffer_28","suffer_29","suffer_30","suffer_31","suffer_32","suffer_33","suffer_34","suffer_35","suffer_36","suffer_37","suffer_38","suffer_39","suffer_40","suffer_41","suffer_42","suffer_43","suffer_44","suffer_45","suffer_46","suffer_47","suffer_48","suffer_49","suffer_50","suffer_51","suffer_52","suffer_53","suffer_54","suffer_55","suffer_56","suffer_57","suffer_58","suffer_59","suffer_60","suffer_61","suffer_62"

];
_unit say3D _sound;

} else {
//sound for independent/civilians units
//add in pain sound here
_sound = selectRandom [

"suffer_0","suffer_1","suffer_2","suffer_3","suffer_4","suffer_5","suffer_6","suffer_7","suffer_8","suffer_9","suffer_10","suffer_11","suffer_12","suffer_13","suffer_14","suffer_15","suffer_16","suffer_17","suffer_18","suffer_19","suffer_20","suffer_21","suffer_22","suffer_23","suffer_24","suffer_25","suffer_26","suffer_27","suffer_28","suffer_29","suffer_30","suffer_31","suffer_32","suffer_33","suffer_34","suffer_35","suffer_36","suffer_37","suffer_38","suffer_39","suffer_40","suffer_41","suffer_42","suffer_43","suffer_44","suffer_45","suffer_46","suffer_47","suffer_48","suffer_49","suffer_50","suffer_51","suffer_52","suffer_53","suffer_54","suffer_55","suffer_56","suffer_57","suffer_58","suffer_59","suffer_60","suffer_61","suffer_62"

];
_unit say3D _sound;

};

};



sleep (6 + random 3);

};

	};


};



sleep 3;

//loop
if (isServer) then {

_units = [];

while { (true) } do {

{




		 if ((_x isKindOf "Man") && (!isplayer _x)) then
            {
				_uls = lifeState _x;


            if ((_uls != "INCAPACITATED") &&
			   !(_x getVariable ["dam_ready",false])) then
			   {
				_units pushBack _x;
				_x removeItems "FirstAidKit";
                _x removeItem "Medikit";

				_x removeAllMPEventHandlers "MPHit";
				_x setVariable ["dam_ready",true];

				call compile format["
			%1 addMPEventHandler ['MPHit',{
				if (vehicle %1 == %1) then {
					_rand = random 100;

					if (_rand < dam_injured) then {
						[%1] spawn fnc_injured;
					};
				};
			}]
 	",[_x] call BIS_fnc_objectVar];
	};

	};

} forEach allUnits;

sleep 10;

};

};






