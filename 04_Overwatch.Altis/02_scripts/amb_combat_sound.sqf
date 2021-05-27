if (not local player) exitWith {};

private ["_AsoundSource","_AsoundPitch","_Avolume","_Adistance","_ATarget","_AMaxDistance","_AMinDistance","_AMedDistance","_AMinWait","_AMedWait","_AMaxWait","_soundsArray","_dir","_dis","_AsoundPosition","_SoundNumber","_ASound","_Waitfor"];
//Object - the object emitting the sound. If sound position is specified this param is ignored
_AsoundSource = player;

//Sound Pitch (Number) - 1: Normal, 0.5: Darth Vader, 2: Chipmunks, etc. Default: 1
_AsoundPitch = 0.8;

//Volume (Number) Default: 1
_Avolume = 3;

//Number : How far is sound audible (0 = no max distance) Default: 0.
_Adistance =  0;

//Target object (varible name) you want the sound to emmit from Default: player
_ATarget = player;

//Maxiumu random distance (Number) you wish the sound to eminate from
_AMaxDistance = 400;

//Minimum random distance (Number) you wish the sound to eminate from
_AMinDistance = 550;

//Avrage or Medium random distance (Number) you wish the sound to eminate from
_AMedDistance = 250;

//Minimum time between sounds played (Number)
_AMinWait = 30;

//Avrage or Medium time between sounds played (Number)
_AMedWait = 45;

//Maximum time between sounds played (Number)
_AMaxWait = 60;

_soundsArray = [
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions1.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions2.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions3.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions4.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions5.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight1.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight2.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight3.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight4.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight1.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight2.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight3.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight4.wss"
];

while {true} do
{
_dir = round random 360;

_dis = round random [_AMinDistance,_AMedDistance,_AMaxDistance];
_AsoundPosition = _ATarget getRelPos [_dis, _dir];
//_SoundNumber = round random count _soundsArray;
//_ASound = _soundsArray select _SoundNumber;
_ASound = selectrandom _soundsArray;
playSound3d [_ASound, _AsoundSource, false, _AsoundPosition, _Avolume, _AsoundPitch, _Adistance];
_Waitfor = round random [_AMinWait,_AMedWait,_AMaxWait];
sleep _Waitfor
};