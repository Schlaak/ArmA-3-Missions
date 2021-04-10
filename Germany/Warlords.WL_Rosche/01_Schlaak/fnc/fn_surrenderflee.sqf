/*
lets units surrender or flee with a reward for not playing wargrimes johnsson.

TODO
give fleeing units the ability to setunitpos middle, up and down. currently only middle.
make surrendering units sit before deletion.
*/
//[group this] call Schlaak_fnc_surrenderflee
params ["_gruppe"]; 

if (!isserver) exitWith {};


_threshold = selectrandom [0.3,0.4,0.5,0.6];	//0-1 percentile threshold when to flee/surrender
_captive = selectrandom [true,false]; //BOOL is captive yes or no.

waitUntil {count (units _gruppe) > 3;};


hint "surrenderflee initialized";
_anzahl = count (units _gruppe);	//count groupsize
_lebende = { alive _x } count units _gruppe; 




waitUntil {_lebende < 5};	//wait until group is size or below size of threshold
hint "surrenderflee: squadmorale broken!";


if (_captive == true) then	//set em captive
{
	{_x setCaptive true;} foreach units _gruppe;
};

_eighterOR = selectrandom [1,2];	//flee or surrender
switch (_eighterOR) do
{
	case 1:	//surrender
	{
		
		{removeallweapons _x} foreach units _gruppe;
		{_x action ["surrender", _x]} foreach units _gruppe;

		//sleep 300;
		//{_x action ["SitDown", _x]} foreach units _gruppe;
		//sleep 30;
		if ((count (units _gruppe))>0) then
		{
			Schlaak_Units_Captured = Schlaak_Units_Captured + (count (units _gruppe));
		};


		//{deletevehicle _x} foreach units _gruppe;

	};
	case 2:	//flee
	{
		{_x setunitpos "middle"};
		_Retreatpoint = [ getpos (leader _gruppe), 2000, (random 180) ] call BIS_fnc_relPos;
		[leader _gruppe, _Retreatpoint, true] spawn lambs_wp_fnc_taskAssault;

		
		if ((count (units _gruppe))>0) then
		{
			Schlaak_Units_routed = Schlaak_Units_routed + (count (units _gruppe));
		};

		//{deletevehicle _x} foreach units _gruppe;

	};
};
