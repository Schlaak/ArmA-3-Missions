// ****************************************************************
// JBOY_scream.sqf
//
// ****************************************************************

_man = _this select 0;
_emitter = _this select 1;

_rand = floor(random 2);
switch ( _rand )  do
{
   case 0: { _man say "scream"; };
   case 1: { _man say "scream2"; };
   default { _man say "scream"; };
};
_case = floor(random 10);
switch (_case) do
{
  case 0:
  {
	_man action ["SwitchWeapon", _man, _man, 2];
	sleep 1 + random 3;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep 1;
	_man playmove "AinjPpneMstpSnonWrflDnon_rolltoback";
	sleep 1;
	_man action ["SwitchWeapon", _man, _man, 2];
	 _man forceWeaponFire [currentWeapon _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	[_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
  case 1:
  {
	_man action ["SwitchWeapon", _man, _man, 2];
    sleep 1+random 3;
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man switchmove "GetOutPara";
	 sleep .5;
	 _man switchmove "";
	 [_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
  case 2:
  {
 	_man action ["SwitchWeapon", _man, _man, 2];
    sleep 2+ random 4;
	 _man forceWeaponFire [currentWeapon _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon  _man, "FullAuto"];
	 _man forceWeaponFire [currentWeapon _man, "FullAuto"];
	_man switchmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep 1;
	 _man switchmove "HaloFreeFall_non_HaloFreeFall_F";
	 sleep .3;
	 _man switchmove "HaloFreeFall_non_HaloFreeFall_F";
	 sleep .5;
	 _man switchmove "";
	 [_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
  case 3:
  {
 	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .5;
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .5;
	 _man playmove "AmovPercMevaSnonWnonDf";
    sleep .5;
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .5;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep .3;
	 [_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
  case 4:
  {
     //_man setUnitPos "Middle";
	 sleep 2;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep .3;
	 _man switchmove "unconscious";
	 sleep .3;
	 _man switchmove "unconscious";
	 sleep 2;
	 _man switchmove "";
  };
  case 5:
  {
     //_man setUnitPos "Middle";
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
	 sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
	 sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
	 sleep .3;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep .5;
	 [_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
  case 6:
  {
     //_man role to put out fire
	_man playmove "AmovPercMsprSnonWrflDf_AmovPpneMstpSnonWrflDnon";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWprflDnon_AmovPpneMevaSlowWrflDr";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
	 detach _emitter;
	 _emitter attachTo [G_OBJ_AWAY,[0,0,0]];
	 };
  case 7:
  {
    //_man roll to put out fire
	_man playmove "AmovPercMsprSnonWrflDf_AmovPpneMstpSnonWrflDnon";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWprflDnon_AmovPpneMevaSlowWrflDr";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
 	 detach _emitter;
	 _emitter attachTo [G_OBJ_AWAY,[0,0,0]];
 };
  case 8:
  {
    sleep 2+ random 4;
	_man switchmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep 1;
	 _man switchmove "HaloFreeFall_non_HaloFreeFall_F";
	 sleep .5;
	 _man switchmove "";
	 [_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
  case 9:
  {
    sleep 2+ random 3;
	 [_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
  case 10:
  {
    sleep 2+ random 2;
	 [_man,"body",0.2,objNull,"rhs_ammo_556x45_M855A1_Ball",7,objNull] call ace_medical_fnc_handleDamage;
  };
};
