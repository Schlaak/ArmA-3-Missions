/**
Made by Schlaak
edited by ir0nsight
*/
/**
	following code is local, needs to be run clientside.
 */
if (hasInterface) then //check if running machine == player
{	//NOTE: only running on client from here
	//hint "offroad running";

	//---------------------check for already running instances------start
	//private _allowRun = true;
	private _allowRun = (player getVariable ["offRoadRunning",true]);
	if (!_allowRun) exitWith { //only continue if skript isnt already running
		debugLog "offroadSkript already running.";
	};
	player setVariable ["offRoadRunning",true,false]; //prevent other instances from intialising
	//---------------------check for already running instances------end

	//params to run loop with:
	//list of "road" surfaces that dont produces shake:
	_surfacearray = ["#SurfRoadDirt","#SurfRoadConcrete","#SurfRoadTarmac","#concrete","#dirtrunway","#road","#road_exp","#concrete_exp","#GdtConcrete","#GdtSoil","#GdtConcrete","#GdtConcrete",/** "#GdtDirt",*/"concrete_out","concrete_inside","#concrete_in_exp","#concrete_hall_exp","#GdtGrassShort","#GdtAsphalt","#UTCONCRETE "];
	private _kill = false; //create breakout var
	private _skip = false; //create ignore var.

	//----------------------------CBA SETTINGS Init--------------START
	[ //cba settings ENABLE ALL
		"offroad_enable", //display name
		"CHECKBOX", //GUI type
		"enable offroad camera shake script", //tooltip
		"offroad script", //category
		true,	//default value
		true, 	//isglobal (same setting for everyone)
		{
			if (!isNil "offroad_debug" && offroad_debug ) then {
				hint ("offroad_enable changed to " + str _this);
			}

		}, //execute on change
		false //requires restart
	] call CBA_fnc_addSetting;

	[ //cba setting DEBUG MODE
		"offroad_debug", //display name
		"CHECKBOX", //GUI type
		"enable offroad debug mode", //tooltip
		"offroad script", //category
		false,	//default value
		true, 	//isglobal (same setting for everyone)
		{
			if (!isNil "offroad_debug" && offroad_debug ) then {
				hint ("offroad_enable changed to " + str _this);
			}
		}, //execute on change
		false //requires restart
	] call CBA_fnc_addSetting;

	[ //cba setting WOBBLE STRENGTH
		"offroad_wobble", //display name
		"SLIDER", //GUI type
		"camera shake strength", //tooltip
		"offroad script", //category
		[1,100,50,1],	//default value
		true, 	//isglobal (same setting for everyone)
		{
			if (!isNil "offroad_debug" && offroad_debug ) then {
				hint ("offroad_enable changed to " + str _this);
			}
		}, //execute on change
		false //requires restart
	] call CBA_fnc_addSetting;
	//----------------------------CBA SETTINGS Init--------------END


	//----------------------------wobble code----------------------START
	private _code = {
		waitUntil { //suspend code till vars are initialized
			(!isNil "offroad_debug" && !isNil "offroad_enable")
		};

		private _enableCamShake = false;
		private _i = 0;
		private _isoffroad = false;
		//LOOP START
		while {!_kill} do
		{
			_kill = missionNamespace getVariable ["killOffroad",false];
			offroad_debug = missionNamespace getVariable ["offroad_debug",false];
			_skip = !offroad_enable;

			if (!_skip) then {
				//_isoffroad = ((vehicle player) isKindOf "car" && !(isOnRoad (vehicle player)) && !((surfaceType getpos player) in _surfacearray) && (vehicle player != player) &&((speed (vehicle player) >= 3) OR (speed (vehicle player) < -3)) && (vehicle player) isKindOf "car" );
				_isoffroad = (vehicle player) isKindOf "car" && !isOnRoad (getPos vehicle player) &&( abs speed (vehicle player) >= 5);
				if (_isoffroad) then {
					_enableCamShake = true;
					_speed = abs (speed (vehicle player));
					_coeff = 0.02 * _speed + 0.02*(_speed ^ 2);
					_camshakepower = offroad_wobble/100 * _coeff * 0.2;
					_camshakefreq = 0.14 * _speed; //value = 10 for 70 kmh
					enableCamShake true;
					addCamShake [_camshakepower, 8, _camshakefreq];
				//	addCamShake [10, 2, 10];	//no matter duration, lasts max ~2 seconds
					if (offroad_debug) then {
						hint ("off road: " + str round _camshakepower + "|" + str round _coeff + " on: " + surfaceType getpos player);
					};
				} else {
					resetCamShake;
					if (offroad_debug) then {
						hint ("on road: " + surfaceType getpos player);
					};
				}
			} else {
				//enableCamShake false; //TODO does this conflict with other wobble mods?
			};
			_i = _i + 1;
			if (offroad_debug && (_i mod 10) == 0 ) then {
				hint ("offroad at iteration: " + str _i);
			};
			sleep 1;
		}; //LOOP END
	}; //_code end
	sleep 1;
	call _code;
	//----------------------------wobble code----------------------end
};



