// [_x , false , false , 0] call Schlaak_fnc_fireeffects
	params ["_OBJ","_Type","_dieOut","_burntime"];

	if (isDedicated)  exitwith {};
//private ["_OBJ","_Type","_dieOut"];


	_PS = "#particlesource" createVehiclelocal getpos _OBJ;


	switch (_Type) do
	{
		case true:
		{
			//fire
			_PS setParticleCircle [0, [0, 0, 0]];
			_PS setParticleRandom [0.2, [1, 1, 0], [0.5, 0.5, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
			_PS setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.5], 0, 1, 0.9, 0.3, [1.5], [[1, 0.7, 0.7, 0.2]], [1], 0, 0, "", "", _obj];
			_PS setDropInterval 0.03;
			//smoke1
			_PS2 = "#particlesource" createVehiclelocal getpos _OBJ;
			_PS2 setParticleCircle [0, [0, 0, 0]];
			_PS2 setParticleRandom [0, [0, 0, 0], [0.33, 0.33, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
			_PS2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 1], "", "Billboard", 1, (10+random 25), [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.01, 0.01, 0.01, 0.33], [0.4, 0.4, 0.4, 0.33], [0.2, 0.2, 0, 0]], [0, 1], 1, 0, "", "", _obj];
			_PS2 setDropInterval 0.5;

			//smoke2
			_PS3 = "#particlesource" createVehiclelocal getpos _OBJ;
			_PS3 setParticleCircle [0, [0, 0, 0]];
			_PS3 setParticleRandom [0, [0, 0, 0], [0.5, 0.5, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
			_PS3 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 1], "", "Billboard", 1, (15+random 25), [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.02, 0.02, 0.02, 0.75], [0.4, 0.4, 0.4, 0.5], [1, 1, 1, 0.2]], [0], 1, 0, "", "", _obj];
			_PS3 setDropInterval 0.25;
			//light
			_PS4 = "#lightpoint" createVehiclelocal (getposATL _OBJ);
			_PS4 lightAttachObject [_OBJ,[0,0,5]];
			_PS4 setLightAttenuation [/*start*/0.2,/*constant*/0,/*linear*/50, /*quadratic*/0, /*hardlimitstart*/3/8,/* hardlimitend*/3*5];
			_PS4 setLightBrightness 20;
			_PS4 setLightAmbient [1,0.1,0];
			_PS4 setLightColor [1,0.2,0];
			_PS4 setLightDayLight true;

			_firesound = createSoundSource ["Sound_Fire", position _OBJ, [], 0];
			if (_dieOut) then
			{
				sleep (_burntime + (random (_burntime/8)));
				deletevehicle _PS;
				deletevehicle _PS4;
				deletevehicle _firesound;
				sleep (_burntime/8) +(random (_burntime/8));
				deletevehicle _PS2;
				sleep (_burntime/8) ;
				deletevehicle _PS3;
				sleep 2;


			};

		};

		case false:
		{
			// SMOKE
			_ps = "#particlesource" createVehiclelocal getpos _OBJ;
			_ps setParticleCircle [0, [0, 0, 0]];
			_ps setParticleRandom [0, [0, 0, 0], [0.33, 0.33, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
			_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 1], "", "Billboard", 1, (10+random 25), [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.01, 0.01, 0.01, 0.33], [0.4, 0.4, 0.4, 0.33], [0.2, 0.2, 0, 0]], [0, 1], 1, 0, "", "", _obj];
			_ps setDropInterval 0.5;
/*
			_ps setParticleCircle [0, [0, 0, 0]];
			_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, (15+random 25), [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.01, 0.01, 0.01, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _OBJ];
			_ps setDropInterval 0.05;
*/

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

//};







// SCHLAAK - V2 2020.03.18
//nul = [this,true,true] execvm "scripts\fireeffects.sqf";
//nul = [this,false,true] execvm "scripts\fireeffects.sqf";
//Type: true -Fire oder false-Smoke
/*
0 = objekt
1 = Feuer/Rauch
2 = Ausbrennen
*/
//test_EmptyObjectForSmoke test_EmptyObjectForFireBig
