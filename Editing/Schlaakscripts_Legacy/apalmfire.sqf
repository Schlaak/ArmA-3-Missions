// SCHLAAK - V2 2020.03.18
//nul = [this,true,true] execvm "fireeffects.sqf";
//nul = [this,true,true] execvm "scipts\fireeffectsNapalm.sqf";
//Type: true -Fire oder false-Smoke
/*
0 = objekt
1 = Feuer/Rauch
2 = Ausbrennen
*/
//test_EmptyObjectForSmoke test_EmptyObjectForFireBig

if (!isServer)  exitwith {};
private ["_OBJ","_Type","_dieOut"];
_OBJ = _this select 0;
_Type = _this select 1;
_dieOut= _this select 2;
_burntime = 600;



_PS = "#particlesource" createVehicle getpos _OBJ;


switch (_Type) do
{
    case true:
    {
//\A3\data_f\ParticleEffects\Universal\Universal_02.p3d
//\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d
		//fire
		/*


		A3\data_f\ParticleEffects\Universal\Universal


		_PS setParticleCircle [0, [0, 0, 0]];
		_PS setParticleRandom [0.2, [1, 1, 0], [0.5, 0.5, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
		_PS setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 8, 5, 6], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.5], 1, 1, 0.9, 0.3, [1.5], [[1, 0.7, 0.7, 0.5]], [1], 0, 0, "", "", _obj];
		_PS setDropInterval 0.03;
		*/



		_PS setParticleCircle [0, [0, 0, 0]];
		_PS setParticleRandom [0.2, [1, 1, 0], [0.5, 0.5, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
		_PS setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.5], 0, 1, 0.9, 0.3, [12, 12, 12], [[1, 0.7, 0.7, 0.5]], [1], 0, 0, "", "", _obj];
		_PS setDropInterval 0.03;

		_PS2 = "#particlesource" createVehicle getpos _OBJ;
		_PS2 setParticleCircle [0, [0, 0, 0]];
		_PS2 setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_PS2 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 6], "", "Billboard", 1, 220, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [18, 18, 18], [[0.1, 0.1, 0.1, 0.8], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _OBJ];
		_PS2 setDropInterval 6;


		_PS3 = "#particlesource" createVehicle getpos _OBJ;
		_PS3 setParticleCircle [0, [0, 0, 0]];
		_PS3 setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_PS3 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 6], "", "Billboard", 1, 240, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [18, 18, 18], [[0.1, 0.1, 0.1, 0.8], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _OBJ];
		_PS3 setDropInterval 8;


		_PS4 = "#lightpoint" createVehicle (getposATL _OBJ);
		_PS4 lightAttachObject [_OBJ,[0,0,5]];
		_PS4 setLightAttenuation [/*start*/0.2,/*constant*/0,/*linear*/50, /*quadratic*/0, /*hardlimitstart*/3/8,/* hardlimitend*/3*5];
		_PS4 setLightBrightness 60;
		_PS4 setLightAmbient [1,0.1,0];
		_PS4 setLightColor [1,0.2,0];
		_PS4 setLightDayLight true;

		_firesound = createSoundSource ["Schlaak_fire_sound", position _OBJ, [], 0];
		if (_dieOut) then
		{
			sleep (_burntime + (random (_burntime/8)));
			deletevehicle _PS;
			deletevehicle _PS2;
			deletevehicle _PS3;
			sleep 2;
			deletevehicle _PS4;
			deletevehicle _firesound;

		};

    };

    case false:
    {
		// SMOKE
		_ps setParticleCircle [0, [0, 0, 0]];
		_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_ps setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _OBJ];
		_ps setDropInterval 0.05;
		if (_dieOut) then
		{
			sleep (_burntime + (_burntime/8));
			deletevehicle _PS;

		};


    };


        default //Optional DEFAULT - wenn keine Variable übereinstimmt.
    {

		_ps setParticleCircle [0, [0, 0, 0]];
		_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_ps setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _OBJ];
		_ps setDropInterval 0.05;

    };
};









