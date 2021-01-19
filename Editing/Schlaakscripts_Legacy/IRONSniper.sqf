
//BY IRONSIGHT
//=============================================================================================
//hint "sniper script started";

_sniper2 = (_this select 0);
_sniper2 disableAI "PATH";
_sniper2 setUnitPos "DOWN";
_sniper2 setSkill ["spotDistance", 1];
_sniper2 setSkill ["spotTime",1];


//_sniper2 dowatch (this getrelpos [150,0]);

while {true} do {
   _Dtargets = [];
   {if ((_x distance2D _sniper2) < 2000 && (side _x == west) && (alive _x)) then {_sniper2 reveal _x;_Dtargets pushBack _x}} forEach allunits;

   _Tcount = count _Dtargets;
  // hint "sniper choose new target";
   if (_Tcount > 0) then {_Target = (selectRandom _Dtargets);_sniper2 dotarget _Target;_sniper2 doFire _Target;};
   _sniper2 setVehicleAmmo 1;

   uiSleep 20;
};