


//________________  Author : GEORGE FLOROS [GR] ___________ 02.11.18 _____________

/*
________________ GF Breath Script ________________

https://forums.bohemia.net/forums/topic/220057-gf-breath-script/?tab=comments#comment-3321376

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


diag_log "//________________ GF_Breath Script initializing ________________";


//________________	adjust here the FPS Limit	________________
GF_Breath_FPS_Limit 			= 10;
GF_Breath_Systemchat_info		= true;

/*
if (GF_Breath_Systemchat_info) then {
systemchat "GF_Breath Script initializing";
};

*/
//________________	GF_Breath	________________

GF_Breath = {

	_this setVariable ["Var_GF_Breath",true];

	_this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit setVariable ["Var_GF_Breath",false];
	}];


	_Headgear_List = [
	"H_RacingHelmet_1_F",
	"H_RacingHelmet_2_F",
	"H_RacingHelmet_3_F",
	"H_RacingHelmet_4_F",
	"H_RacingHelmet_1_black_F",
	"H_RacingHelmet_1_blue_F",
	"H_RacingHelmet_1_green_F",
	"H_RacingHelmet_1_red_F",
	"H_RacingHelmet_1_white_F",
	"H_RacingHelmet_1_yellow_F",
	"H_RacingHelmet_1_orange_F",

	"H_CrewHelmetHeli_B",
	"H_CrewHelmetHeli_I",
	"H_CrewHelmetHeli_O",

	"H_PilotHelmetFighter_B",
	"H_PilotHelmetFighter_O",
	"H_PilotHelmetFighter_I",

	"H_HelmetO_ViperSP_hex_F",
	"H_HelmetO_ViperSP_ghex_F"
	];


	while {true} do {

	private _Fatigue = getFatigue _this;
	private _Dammage = getDammage _this;
	private _Speed = speed  _this;

	if (!((headgear _this) in _Headgear_List)) then {

	if (
	(alive _this)
	&& (!(underwater _this) or ((getPosASLW _this select 2) > -1.5))
	&& (_Speed < 20)
	&& diag_fps > GF_Breath_FPS_Limit
	) then {

	_Sleep_Fatigue = _Fatigue * 3;
	_Sleep = (3 + random 2) - _Sleep_Fatigue;

	sleep _Sleep;

	_this setRandomLip true;


	_Breath = "#particlesource" createVehicle [0,0,0];

	_Breath setParticleParams [
	["A3\Data_F\ParticleEffects\Universal\Universal",16,12,13,0],
	"",
	"Billboard",
	0.1,
	1,
	[0,0,0],
	[0,0.2,0.4],
	1,1.275,1,0.2,
	[0,0.2,0],
	[[1,1,1,0.005],
	[1,1,1,0.01],
	[1,1,1,0]],
	[1000],
	1,
	0.04,
	"",
	"",
	_breath
	];

	_Breath setParticleRandom [
	_Fatigue - random 0.5,
	[0,0,0],
	[0.25,0.25,0.25],
	0,0.5,
	[0,0,0,0.1],
	0,
	0,
	2
	];

	_Breath setDropInterval 0.001;

	_Breath attachto [_this,[0,0.16,-0.12], "neck"];

	if (
	(_Speed > 5)
	or (_Dammage > 0.75)
	or (_Fatigue > 0.5)
	) then {
		sleep 0.25;
		}else{
		sleep 0.5;
	};

	_this setRandomLip false;
	deletevehicle _Breath;
};
	}else{

	sleep 5;
	};
};
};


[] spawn {
	while {true} do {

		{
		if (
			((alive _x))
			&& (!(_x getVariable ["Var_GF_Breath",false]))) then {
			_x spawn GF_Breath;
			};

			_x setVariable ["Var_GF_Breath",true];

			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_Breath",false];
			};
		}forEach allunits;
		sleep 15;
	};
};


if (GF_Breath_Systemchat_info) then {
systemchat "GF_Breath Script initialized";
};

diag_log "//________________ GF_Breath Script initialized ________________";