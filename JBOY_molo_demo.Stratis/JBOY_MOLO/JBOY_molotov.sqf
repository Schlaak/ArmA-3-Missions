// *****************************************************
// ** JBOY_molotov.sqf 
// ** by JohnnyBoy
// **
// ** Simulates throwing a molotov cocktail.
// **
// ** Put this in soldier's init:  
// **    this addEventHandler ["fired",{if (_this select 4 == "smokeShellRed") then {[nearestObject [_this select 0, "smokeShellPurple"], "Land_BottlePlastic_V2_F"] execvm "JBOY_MOLO\JBOY_molotov.sqf";}}]; 
// **
// ** Parameter 1: "smokeShellRed" is object to replace.
// ** Parameter 2: "AAMI103" is bottle object to replace with.
// ** Parameter 3; unit that threw the cocktail.
// for player, add action that does this;  joe fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShellPurple"]
// *****************************************************
// TO DO LIST:
// 0. Throwing at sharp angle up causes air burst.  Fix this!
// 1. Before assigning fire to a vehicle, check that height is close also,
//    not just 2D distance.
// 2. If cocktail within 2 meters of man, light up man AND the static
//    or vehicle location.
//
_obj_to_replace = _this select 0;
_obj_to_create  = _this select 1; 
_thrower = _this select 2;

// To prevent an object being created per client, exit if object is not local.
// if (local _obj_to_replace) then {exit;};  // No idea if I need this local stuff?

// *** Create the bottle object and light it up!
_cocktail = _obj_to_create createVehicle [0,0,0];

//_pos = _obj_to_replace modelToWorld [0,0,0]; 
_dir = getdir _obj_to_replace;
_vel = velocity _obj_to_replace;
_vdir = vectorDir _obj_to_replace;
// *** speed of thrown grenade is 81.  So let's have cocktail speed be less than that.

_speed = 0.0;

//_speed = speed _obj_to_replace;
_speed = 18 + random(7); 
//_obj_to_replace setVelocity [(_vdir select 0)*_speed, (_vdir select 1)*_speed, (_vel select 2)/2];
_obj_to_replace setVelocity [(_vdir select 0)*_speed, (_vdir select 1)*_speed, (_vel select 2)];
// hideObject _obj_to_replace;



// *** Wait a bit so bullet spawn location will be in front of thrower's shoulder
// *** else spawned bullet hits thrower.
sleep .08;
_pos = getpos _obj_to_replace ;
//_bullet = "B_9x21_Ball" createVehicle [10,10,1000];
_bullet = "B_556x45_dual" createVehicle [10,10,1000];
 
//_bullet = "Land_Can_V3_F" createVehicle [10,10,1000];

_bullet disableCollisionWith _cocktail;
_bullet disableCollisionWith _thrower;
_bullet setMass 10;
_bullet setVelocity [0,0,0];
//[_bullet, 0,45] call BIS_fnc_setPitchBank;
[_cocktail, 0,-90] call BIS_fnc_setPitchBank;
_bullet setdir _dir;

_bullet setVelocity (velocity _obj_to_replace); 

_obj_to_replace setpos [0,0,0];
_bullet setpos _pos;
_bullet say "burn";
sleep .02; 
deletevehicle _obj_to_replace; 

// *** Set the bottle on fire
nul=[   _cocktail,   [0,1,0],  10,      .001,         .01 ] execvm "JBOY_MOLO\JBOY_createFire.sqf";
//_fireArray = [];
//_fireArray = [ _cocktail, [0,0,1], 10, .005, .01 ] call JBOY_createFire;
_once = 1;

 _prevSpeed = speed _bullet;
 _prevPos = getpos _bullet;
  _dirTo = _dir;
// *** Track bullet until it hits th ground, or its direction changes by ricochet.
// *** The position of the bullet when it hits ground or ricochets is impact point for molotov.
// *** Ricochet is determined by a change in dirTo during the loop.
 while { ( (_pos select 2) > .1) and (abs(_dir - _dirTo) < 2 )  } do 
{
[_cocktail, 0,-90] call BIS_fnc_setPitchBank;
   _cocktail setdir _dir;
   _cocktail setpos _pos;
   _prevPos = _pos;
   sleep .05;
   _pos = getpos _bullet;
   _dirTo = [_prevpos, _pos] call BIS_fnc_dirTo; // if ricochet, then dir to previous pos will differ from dir alot.
   //_dir = getdir _bullet;
};   // end while

deleteVehicle _bullet; // prevent bullet ricochets that make no sense for molotov
if (surfaceIsWater getpos _cocktail ) then 
{
  deleteVehicle _cocktail; 
}
else
{
	_logic = (createGroup west) createUnit ["Logic", [0,0,0], [], 0, "NONE"];

	_logic disableCollisionWith _cocktail;
	_logic say "fxGlassBreak2";
	//_logic enablesimulation false;
	_logic setpos _prevPos;

	_staticFlame = true;
	_nearArr = [];
	_nearArr = nearestObjects [ getpos _cocktail, ["Man"], 2];
	if (count _nearArr == 0) then {_nearArr = nearestObjects [ getpos _cocktail, ["Land"], 6];};
	_nearArr = _nearArr - [_thrower];
	_cnt = 0;
	_cnt = count _nearArr;
	//if (not((_pos select 0) > 0)) then 
	if (_cnt > 0) then 
	{
	   // *** If there are near objects, then a vehicle or man may have been hit.
	   if (_cnt > 0) then 
	   {
		  _nearObj = _nearArr select 0;
		  // player sidechat format ["_nearObj=%1, distance=%2",_nearObj,( (_nearObj modelToWorld [0,0,0]) distance (_cocktail modelToWorld [0,0,0]) )];
		  // *** If near object is Man and cocktail is close to him...
		 if ( (_nearObj isKindOF "Man") && alive _nearObj && (  (_nearObj distance _cocktail) <= 2 ) ) then 
		  { 
			  // *** Man hit, then attach a mansized fire to the man.
			 // player sidechat "attach to man";
			 // fire damage 1 kills man in about 20 seconds
			  nul=[ _nearObj, [0,0,.9], 75 + random 50, .001, .5 ] execvm "JBOY_MOLO\JBOY_createFire.sqf";
			  (group _nearObj) setBehaviour "COMBAT";
			  _nearObj allowfleeing 1;
			  _nearObj forcespeed 15;
			 // [_nearObj] joinSilent grpNull;
			  _staticFlame = false;
		   } else
		   {
			  // *** If Vehicle hit, attach fire at point of impact.
			 if ( _nearObj isKindOF "LandVehicle") then 
			 {
				// *** Use worldToModel to calculate relative position to vehicle struck.
				_relpos = ( _nearObj) worldTomodel getpos  _cocktail;
				  nul=[ _nearObj,_relpos, 90 + random 50, 1, 1 ] execvm "JBOY_MOLO\JBOY_createFire.sqf";
				_staticFlame = false;
		   };
		   // *** Splash flame on man too, if he's close enough.
		   if (_cnt > 1) then 
		   {
				_nearObj = _nearArr select 1;
				if ( (_nearObj isKindOF "Man") && (  (_nearObj distance _cocktail) <= 2.5 ) ) then
				{
				   //player sidechat "vehicle AND man fire";
				   nul=[ _nearObj, [0,0,.9], 70+ random 50, .001, .5] execvm "JBOY_MOLO\JBOY_createFire.sqf";
				}; 
			};
		  };
	   };
	};
	// staticFlame is true if no near men or vehicles
	if (_staticFlame) then
	{
		_building = nearestObject [_logic, "HouseBase"];
		if (_building != objnull) then
		{
			_bbr = boundingBoxReal _building;
			_p1 = _bbr select 0; 
			_p2 = _bbr select 1; 
			_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
			if ((_prevpos select 2) > _maxHeight) then
			{
				_logic setposatl [_prevpos select 0, _prevpos select 1, _maxHeight];
			};
		};
		_logic setposatl _prevpos;
		nul=[ _logic, [0,0,-.2], 75 + random 50, .0001, .5 ] execvm "JBOY_MOLO\JBOY_createFire.sqf";
		deleteVehicle _cocktail;  
	 }
	 else {
		deleteVehicle _cocktail;  
		// *** Wait before deleting logic so the break glass sound will play completely.
		sleep 1;
		deleteVehicle _logic; // only delete logic if flame attached to non-static object man or vehicle
	};
};



