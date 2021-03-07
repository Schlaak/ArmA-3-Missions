

if (!isServer) exitWith {};

_unit = (_this select 0);
_anim = (_this select 1);

private ["_aCount","_Pos","_dummy","_unit","_anim","_nearestunits","_dragger","_hls","_emptyHouse","_nearesthouses",
"_houseList","_randomHouse","_dis", "_randomSmoke", "_unitGrp","_draggerGrp","_ls","_noDragger"];

 if (isNil {_unit getVariable "doomed"}) then {_unit setVariable ["doomed", 0, false];};
 //checking if unit got any local variables, if it not, then add one

 if (_unit getvariable "doomed" == 0) then {                //This will check if this unit got already spawn function. Cause we dont want to fire it twice or more...
    _doomtimer = [_unit,_anim] spawn {
    private ["_unit","_ls","_anim","_aCount"];
    _unit = _this select 0;
    _anim = _this select 1;
    _unit setVariable ["doomed", 1, false];                 //Mark the unit with this variable. then script above check for it later if something gets wrong with rescue team...
    _aCount = 0;
    while { (alive _unit) } do {
    _ls = lifeState _unit;
    if (_ls != "INCAPACITATED") exitWith {};
    _unit playMove _anim;
    _aCount = _aCount + 1;
    if (_aCount == 20) then { _unit setDamage 1};
    sleep ((random 4)+4);
};
 _unit setVariable ["doomed", 0, false]; //if unit got healed then reset variable
};
};

_unitGrp = group _unit;
[_unit] joinSilent grpNull;

//_arr = [];
_noDragger = [];
//_unitdir = getDir _unit;
_nearestunits = _unit nearEntities ["CAManBase", 150];
if (_nearestunits isEqualTo _noDragger) exitWith {};
_dragger = selectRandom (_nearestunits - (playableUnits + switchableUnits + [_unit]));
///////////////////Find dragger loop////////////////////////////////////////
/*while {true}
do {
    //hint "searching dragger...";
    _nearestunits = _unit nearEntities ["CAManBase", 50];
    _dragger = selectRandom (_nearestunits - (playableUnits + switchableUnits + [_unit]));
    sleep 1;
    if ((alive _unit) && ((side _dragger) != civilian) && ((lifeState _dragger) != "INCAPACITATED") && (alive _dragger) && ((AnimationState _dragger) != "AcinPknlMwlkSrasWrflDb")) exitWith {};
    if (!alive _unit) exitWith {};
};
*/

//if ((alive _unit) && ((side _dragger) != civilian) && ((lifeState _dragger) != "INCAPACITATED") && (alive _dragger) && ((AnimationState _dragger) != "AcinPknlMwlkSrasWrflDb")) exitWith {};
if (_dragger isEqualTo objNull) exitWith {};
if (_dragger isEqualTo _noDragger) exitWith {};




if ((!alive _unit) or (!alive _dragger)) exitWith {};
_hls = lifeState _dragger;

//hint "dragger found";

if ((alive _unit) && (side _dragger != civilian) && (!isPlayer _dragger) && (_dragger != _unit) && (_hls != "INCAPACITATED") && (alive _dragger) && ((AnimationState _dragger) != "AcinPknlMwlkSrasWrflDb")) then {

_draggerGrp = group _dragger;

[_dragger] joinSilent grpNull;
_dragger removeAllMPEventHandlers "MPHit";
_dragger setUnitPos "MIDDLE";
_dragger doMove getpos _unit;


waituntil { sleep 1; (_dragger distance _unit < 2) or !(alive _unit) or !(alive _dragger)  };

if (!alive _dragger) exitWith {sleep ((random 15)+15);
_unit playMove _anim;
// _null = [_unit, _anim] spawn inCap;//Exit script to repeat it all over again, to find another dragger
};
if (!alive _unit) exitwith {};

_randomSmoke = selectRandom [1,2,3];

If (_randomSmoke == 2) then {
createVehicle ["SmokeShell", _unit, [], (random 6), "CAN_COLLIDE"];
};


[ _unit ] remoteExec [ "dam_fnc_wake", 2 ];
sleep 2;
_dragger playAction "grabDrag";
[[_unit,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"]];
Sleep (0.01);

waitUntil { ((AnimationState _dragger) == "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2") || ((AnimationState _dragger) == "AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2")};


    _unit attachTo [_dragger, [0, 1.2, 0]];
    _unit setDir 180;

_DummyClone = {
    private ["_dummy", "_dummygrp", "_dragger"];
    _dragger = _this;

    _dummygrp = createGroup civilian;
    _dummy = _dummygrp createUnit ["C_man_polo_1_F", Position _dragger, [], 0, "FORM"];
    _dummy setUnitPos "up";
    _dummy hideObjectGlobal true;
    _dummy allowdammage false;
    _dummy setBehaviour "CARELESS";
    _dummy disableAI "FSM";
     _dummy forceSpeed 0.2;
    _dragger attachTo [_dummy, [0, -0.2, 0]];
    _dragger setDir 180;

    _dummy

};

_dummy = _dragger call _DummyClone;


_emptyHouse = [];
_nearesthouses = _dragger nearObjects ["House",100];
_houseList = [];
{
    for "_i" from 0 to 3 do {
        if ( [(_x buildingPos _i), [0,0,0]] call BIS_fnc_arrayCompare ) exitWith {
            if (_i > 0) then {
                _houseList set [count _houseList, [_x, _i]];
            };
        };
    };
}forEach _nearesthouses;

if !(_houseList isEqualTo _emptyHouse) then

{

_randomHouse = _houseList select (floor (random (count _houseList)));
_Pos = (_randomHouse select 0) buildingPos (floor (random (_randomHouse select 1)));


} else {

_dis = (30 + random 20);
_Pos = [_dragger, _dis, random 360] call BIS_fnc_relPos;

    };

_dragger playMove "AcinPknlMwlkSrasWrflDb"; _dragger disableAI "ANIM"; _dummy doMove _Pos;

waituntil {(_dummy distance _Pos < 5) or !(alive _dragger) or !(alive _unit) };

if (!alive _dragger) then {
detach _unit;
detach _dragger;
detach _dummy;
_dummy stop true;
deleteVehicle _dummy;
[[_unit,""] remoteExec ["switchMove"]];
[_unit] remoteExec [ "dam_fnc_setunconscious", 2 ];
_unit playMove _anim;

if (true) exitwith {};

//sleep ((random 15)+15);
// _null = [_unit, _anim] spawn inCap; //Repeat again if dragger was killed or injured in drag action. Pay attention to _animN.


} else {

if !(alive _unit) then {
detach _unit;
detach _dragger;
detach _dummy;
_dummy stop true;
deleteVehicle _dummy;
[[_dragger,""] remoteExec ["switchMove"]];
_dragger enableAI "ANIM";
_dragger setCombatMode "RED";
_dragger setBehaviour "AWARE";
{ _dragger reveal _x; } forEach allUnits;
[_dragger] joinSilent _draggerGrp;

if (true) exitwith {};

} else {

if (_dummy distance _Pos < 10) then {
detach _unit;
detach _dragger;
detach _dummy;
_dummy stop true;
deleteVehicle _dummy;
[[_dragger,"Acts_TreatingWounded01"] remoteExec ["playMove"]];
[[_unit,""] remoteExec ["switchMove"]];
[[_unit,"UnconsciousReviveDefault_C"] remoteExec ["playMove"]];
_unit attachTo [_dragger, [0, 0.6, 0]];
_unit setDir 90;
sleep (15 + random 15);
detach _unit;

[[_dragger,"Acts_TreatingWounded_Out"] remoteExec ["switchMove"]];
sleep 3;
_unit setDamage 0;
[[_unit,"UnconsciousOutProne"] remoteExec ["switchMove"]];
_dragger enableAI "ANIM";
_dragger setCombatMode "RED";
_dragger setBehaviour "AWARE";
_unit enableAI "FSM";
_unit setCombatMode "RED";
_unit setBehaviour "COMBAT";
{ _dragger reveal _x; } forEach allUnits;
{ _unit reveal _x; } forEach allUnits;

[_unit] joinSilent _unitGrp;
[_dragger] joinSilent _draggerGrp;

if (true) exitwith {};

};

};

};

if (true) exitwith {};

} else {
// [_unit, false] call ace_medical_fnc_setUnconscious;


    _unit disableAI "TARGET";
    _unit disableAI "AUTOTARGET";
    _unit disableAI "MOVE";
    _unit disableAI "TEAMSWITCH";
    _unit disableAI "FSM";
    _unit disableAI "AIMINGERROR";
    _unit disableAI "SUPPRESSION";
    _unit disableAI "COVER";
    _unit disableAI "AUTOCOMBAT";
    _unit disableAI "PATH";
 sleep 3;

_unit playMove _anim;

// _null = [_unit, _anim] spawn inCap; //Repeat...



};
