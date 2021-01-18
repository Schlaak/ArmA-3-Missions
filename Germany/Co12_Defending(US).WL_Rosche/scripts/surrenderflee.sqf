if (isserver) then
{


_gruppe = group (_this select 0);

_anzahl = count (units _gruppe);
waitUntil {(count  (units _gruppe)) <= (_anzahl * 0.45)};


_eighterOR = selectrandom [1,2];
switch (_eighterOR) do
{
	case 1:
	{
		//{["ACE_captives_setSurrendered", [_this, true], _this] call CBA_fnc_targetEvent;} foreach units _gruppe;
		{removeallweapons _x} foreach units _gruppe;
		{_x action ["surrender", _x]} foreach units _gruppe;
		groupsrouted = groupsrouted+1;
		sleep 500;
		{_x setdamage 1} foreach units _gruppe;
		sleep 60;
		{deletevehicle _x} foreach units _gruppe;

	};
	case 2:
	{
		{_x setunitpos "middle"};
		[leader _gruppe, getPos EastRetreatpoint, true] spawn lambs_wp_fnc_taskAssault;
		groupsrouted = groupsrouted+1;
		sleep 300;
		{deletevehicle _x} foreach units _gruppe;

	};
};
};