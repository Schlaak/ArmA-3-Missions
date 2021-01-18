
sleep 5;
_variable = missionNamespace getVariable["GoonDust_alpha",["not defined"]];
[]spawn{
while{true}do{

    	_obj=(vehicle player);
    	_pos= getposASL _obj;

    _n=abs(wind select 0)+abs(wind select 1)+abs(wind select 2);
    _velocity = wind;
    _color= [0.36,0.18,0];
    _alpha = 0.05;
//    _color= (missionNamespace getVariable["GoonDust_alpha",[[0.4,0.6,0],0]]) select 0;
//    _alpha = (missionNamespace getVariable["GoonDust_alpha",[[1,1,1],0]]) select 1 + random 0.12;

      if (_alpha == 0) then {
      waitUntil {
        sleep 60;
        _alpha =( missionNamespace getVariable["GoonDust_alpha",[[0.5,0.5,0.5],0]]) select 1;
       (_alpha > 0)
      };
    };
    _dust="#particlesource" createVehicleLocal _pos;
    _dust setParticleParams[
        ["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8,0],
        "", //adnimationname
        "Billboard", //particletype
        1,  //timerperiod
        30, //lifetime
        [0,0,0],  //position
        _velocity,  //movevelocity
        (_n*12),  //rotationvelocity
        1.275,  //weight
        1,  //volume
        1,  //rubbing
        [75+(random 46)],//size
        [_color + [0],_color + [_alpha],_color + [0]],//colour in rgba
        [1000],//animationspeed
        1,//radnomdirectionperiod
        1,//randomdirectionintensity
        "",//ontimerscript
        "",//beforedestroyscript
        _obj//object
    ];
    _dust setParticleRandom[3,[800+(random 8),800+(random 10),75],[2,2,0],1,0,[0,0,0,0.01],0,0];
    _dust setParticleCircle[0.1,[0,0,0]];
    _dust setDropInterval 0.019;
    _delay=25+(random 5);
    sleep _delay;
    deletevehicle _dust;

  };
};