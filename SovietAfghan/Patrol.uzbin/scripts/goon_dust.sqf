/**
README:
Originally made by goon (from armaholic)
edited by schlaak & ironsight

script is executed through initPlayerLocal.sqf:
place line below there:
[] execVM "goon_dust.sqf";
!! this requires you to have goon_dust in your mission main folder. if you place it in a subfolder, you will have to edit the line above.
Adjusting values:

changing dust color:
GoonDust_color = [0.86,0.82,0.55]]; //format rgb, run globally (on every client)

changing dust alpha multiplier (0..100): (how opaque the dust will get)
GoonDust_alphaMulti = 100; //default is 50, run globally (on every client)
Note: set this to zero to pause script until you put the value back to > 0

!!changing values takes ~30 seconds to take effect!!

debug values:
Current sand opaqueness (0..1) (on your client)
hint str missionNamespace getVariable ["GoonDust_alpha","undefined"];

how the script works:
The script spawns a donut of dust particles around the player. the particles gradually appear from complete transparancy and die after some time (~30 seconds)
The particles get stronger opaqueness and moving speed with stronger wind. (20 m/s wind will cause a real sandstorm)

limitations of the script:
 at steep mountains, it might be possible to look under the donut.
extreme alpha values + extreme steepness => might make donut ring noticable
fast + strong changes to wind strength/alpha multiplier might cause visible sudden change in dust opaquness
script not suited for helicopter/plane operations, as pilot might notice donut.

Note: script can also be used for gas attacks, supporting snowstorms, (probably) huge fires. just feed it a different color.
 */
if (isDedicated) exitWith {};
_interpolate = {
  params["_low","_high","_pos"];
  _dist = _high - _low;
  ((_dist * _pos) + _low)
};
while{!(missionNamespace getVariable ["goon_kill",false])}do{
//get wind parameters


_windStrength = 20 min vectorMagnitude wind; //caps at 20m/s

_windMulti = 0 max ((_windStrength/20) min 1);//[0..1]
_size = [40,1200,1-_windMulti] call _interpolate;  //size of particle
_height = [40,200,1-_windMulti] call _interpolate;//maximum height of particle above ground
_donutThickness = [100,800,1-_windMulti] call _interpolate; //radius of cloud around player
_radius = [10,1600,1-_windMulti] call _interpolate;
_lifeTime = 5; //lifetime of particle
_pos = (getPos player) vectorAdd (wind vectorMultiply (-0.5 * _lifeTime)); //offset sourcepos into wind direction * 0.5 lifetime -> particles fully mature when reaching player
_rotationSpeed = [0.5,10,_windMulti] call _interpolate;
if (vehicle player isKindOf "air") then {
  _size = [800,1200,1-_windMulti] call _interpolate;  //size of particle
  _donutThickness = [800,800,1-_windMulti] call _interpolate; //radius of cloud around player
  _radius = [800,1600,1-_windMulti] call _interpolate;
};
//color and alpha params
_color= missionNamespace getVariable["GoonDust_color",[0.86,0.82,0.55]];
_alphaMulti = (missionNamespace getVariable ["GoonDust_alphaMulti",50])/100;
_alpha = _alphaMulti * ([0,0.6,_windMulti] call _interpolate);
missionNamespace setVariable ["GoonDust_alpha",_alpha];

//suspend until alpha > 0
if (_alpha == 0) then {
  waitUntil {
    sleep 3;
    _alphaM =( missionNamespace getVariable["GoonDust_alphaMulti",0]) select 1;
    (_alphaM > 0)
  };
};

_dust= "#particlesource" createVehicleLocal _pos; //_pos is overwritten by helper
_helper = "Land_HelipadEmpty_F" createVehicle _pos;
_dust setParticleParams[
    ["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,0],
    "", //adnimationname
    "Billboard", //particletype
    1,  //timerperiod
    _lifeTime, //lifetime
    [0,0,0],  //position
    [0,0,0],  //movevelocity
    _rotationSpeed,  //rotationvelocity
    1.275,  //weight
    1,  //volume
    1,  //rubbing
    [_size],//size
    [_color + [0],_color + [_alpha],_color + [0]],//colour in rgba
    [1000],//animationspeed
    1,//radnomdirectionperiod
    1,//randomdirectionintensity
    "",//ontimerscript
    "",//beforedestroyscript
    _helper //object
];


_dust setParticleRandom[
  3,
  [_donutThickness,_donutThickness,_height], //thickness of donut, position
  [0,0,0],  //moveVelocity
  1,  //rotationVelocity
  0,  //size
  [0,0,0,0.01],
  0,
  0
  ];
_dust setParticleCircle[_radius,[0,0,0]];
_dust setDropInterval 0.019;
systemChat str["windmulti",_windMulti,"size",_size,"radius",_radius,"rotSpeed",_rotationSpeed,"alpha",_alpha];
sleep _lifeTime;
deletevehicle _dust;
deleteVehicle _helper;

};

