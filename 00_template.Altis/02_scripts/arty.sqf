/*////////////////////////////////////

Script by J.Shock

Open to editing and public use!!!

I do ask that this header remain with
the script.

*////////////////////////////////////



// null = ["A", 100, false, 1, 15, 5, 300] execVM "02_scripts\arty.sqf";



/*
To use the Simple Mortar Script (SMS):

1. Put down a marker and name it.

2. Alter the following call line to suit your needs, default values defined below:

null = ["A", 100, false, 1, 15, 5, 300] execVM "02_scripts\arty.sqf";

			1 - Your marker's name (default is empty string, "")
			2 - Radius around marker for bombardment (default is 100m)
			3 - Use smoke rounds instead of HE (default false)
			4 - Number of bombardments (default 1)
			5 - Number of rounds (default 10)
			6 - Time before bombardment starts after script call (default 5 seconds)
			7 - If more than 1 bombardment, as defined by argument #4
				time between each bombardment (default 300 seconds, 5 minutes)

3. Enjoy the Show!
*/

_marker = [_this, 0, "", [""]] call BIS_fnc_param;
_radius = [_this, 1, 100, [0]] call BIS_fnc_param;
_useSmk = [_this, 2, false, [true]] call BIS_fnc_param;
_iter = [_this, 3, 1, [0]] call BIS_fnc_param;
_numRounds = [_this, 4, 10, [0]] call BIS_fnc_param;
_startTime = [_this, 5, 5, [0]] call BIS_fnc_param;
_timeBetween = [_this, 6, 30, [0]] call BIS_fnc_param;
_shell = _this select 7;
_firebase = _this select 8;

if (isServer) then {

if (_startTime > 0) then {
sleep _startTime;
_firebase sidechat "Impact!";
_firebase sideradio "Radio2";
if (!isServer) exitWith {};
};

	for "_i" from 0 to _iter step 1 do

	{
		if (_useSmk) then {
			for "_s" from 0 to (_numRounds) step 1 do
			{
				_pos = [[[(getMarkerPos _marker), _radius]]] call BIS_fnc_randomPos;



				//_pos1 = [ getPos _pos select 0, getPos _pos select 1, 50];



				_smkRnd = createVehicle [_shell, _pos, [], 0, "NONE"];
				sleep 5;
			};

		} else {

			for "_m" from 0 to (_numRounds) step 1 do
			{
				_pos = [[[(getMarkerPos _marker), _radius]]] call BIS_fnc_randomPos;

				//_pos1 = _pos getpos [ getPos _pos select 0, getPos _pos select 1, 50];

				//Sh_82mm_AMOS
				//M_Mo_82mm_AT_LG
				//Sh_155mm_AMOS
				//Sh_120mm_HE
				_mrtRnd = createVehicle [_shell,_pos, [], 0, "NONE"];
				_mrtRnd setPosATL [_pos select 0, _pos select 1, (_pos select 2) + 500];
				_mrtRnd setVectorUp [0,0,-1];
				_mrtRnd SetVelocity [0,0,-200];
				sleep 5;
			};
		};

	if (_iter > 1) then {
	sleep _timeBetween;
	};

	};

};



// _pos = [[[(getMarkerPos _marker), _radius]]] call BIS_fnc_randomPos;