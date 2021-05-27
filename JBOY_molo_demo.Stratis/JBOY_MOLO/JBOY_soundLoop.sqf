// JBOY_soundLoop.sqf 
// Version 0.6
// by johnnboy
//
// Will play the same sound over and over, until object is dead, or times out.
//
// Sample call:
// dmy=[objectToSay,soundName,soundLength,maxPlays] execvm "JBOY_soundLoop.sqf";
// dmy=[car1, "fireBurning", 3.2 , 10000] execvm "JBOY_soundLoop.sqf";
//
// Parameters:
// 1: Object that will 'say' the sound.
// 2: Name of the sound to play (from your description.ext file).
// 3: Length of sound in seconds.
// 4: Maximum times to play the loop.  Use -1 if you want it to be infinite.
// *****************************************************************************
// Change History:
// v0.6 Added Wolfrugs good suggestions:
//      - Don't play sound if no player nearby.
//      - Add -1 as _maxPlays parameter that is infinite.
// v0.5 Created.
_obj = _this select 0;
_sound = _this select 1;
_lengthInSeconds = _this select 2;
_maxPlays = _this select 3;

// We won't play the sound if player is further than this away.
_toggleOffDistance = 250;

_i = 0;
while { (alive _obj) and ((_i < _maxPlays) or (_maxPlays == -1)) } do
{
	if ((_obj distance player) < _toggleOffDistance) then
	{
		_obj say _sound;
	};
	sleep _lengthInSeconds;
	_i = _i + 1;
};
