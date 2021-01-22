/*
lets units surrender or flee with a reward for not playing wargrimes johnsson.

TODO
give fleeing units the ability to setunitpos middle, up and down. currently only middle.
make surrendering units sit before deletion.
*/
if (isserver) then
{

sleep 3;
_gruppe = group (_this select 0);
_threshold = _this select 1;	//0-1 percentile threshold when to flee/surrender
_captive = _this select 2; //BOOL is captive yes or no.



_anzahl = count (units _gruppe);	//count groupsize

waitUntil {(count  (units _gruppe)) <= (_anzahl * _threshold)};	//wait until group is size or below size of threshold
if (_captive == true) then	//set em captive
{
	{_x setCaptive true;} foreach units _gruppe;
};

_eighterOR = selectrandom [1,2];	//flee or surrender
switch (_eighterOR) do
{
	case 1:
	{
		//{["ACE_captives_setSurrendered", [_this, true], _this] call CBA_fnc_targetEvent;} foreach units _gruppe;
		{removeallweapons _x} foreach units _gruppe;
		{_x action ["surrender", _x]} foreach units _gruppe;

		sleep 300;
		{_x action ["SitDown", _x]} foreach units _gruppe;
		sleep 30;
		if ((count (units _gruppe))>0) then
		{
			["ScoreAdded",["Kriegsgefangene gemacht!",(count (units _gruppe))]] call BIS_fnc_showNotification;	//reward for takeing captives
			//{_x addScore (count (units _gruppe))} foreach allplayers;
			west addScoreSide (count (units _gruppe));
		};


		{deletevehicle _x} foreach units _gruppe;

	};
	case 2:
	{
		{_x setunitpos "middle"};
		_Retreatpoint = [ getpos (leader _gruppe), 2000, (random 180) ] call BIS_fnc_relPos;
		[leader _gruppe, _Retreatpoint, true] spawn lambs_wp_fnc_taskAssault;

		sleep 150;
		if (((count (units _gruppe))*0.5)>0) then
		{
			["ScoreAdded",["Gnade mit fliehendem Feind gehabt!",((count (units _gruppe))*0.5)]] call BIS_fnc_showNotification;	//reward for mercy
			//{_x addScore ((count (units _gruppe))*0.5)} foreach allplayers;
			west addScoreSide ((count (units _gruppe))*0.5);
		};
		{deletevehicle _x} foreach units _gruppe;

	};
};
};