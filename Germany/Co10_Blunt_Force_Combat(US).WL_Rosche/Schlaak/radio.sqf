//nil = [this] execvm "Schlaak\radio.sqf";
private ["_radio","_snd"];
if (!isserver) exitwith
{
	/* code */
};
_radio = _this select 0;
while { alive _radio } do
{
	_snd = selectrandom ["POradio0","POradio1","POradio2","POradio3","POradio4","POradio5","POradio6","POradio7","POradio8","POradio9","POradio10","POradio11","POradio12","POradio13","POradio14","POradio15","POradio16","POradio17","POradio18"];
	sleep 40;

	[_radio,_snd,40] call Schlaak_fnc_Schlaaksay;

	_snd = selectrandom ["POradio0","POradio1","POradio2","POradio3","POradio4","POradio5","POradio6","POradio7","POradio8","POradio9","POradio10","POradio11","POradio12","POradio13","POradio14","POradio15","POradio16","POradio17","POradio18"];
	sleep 15;
	[_radio,_snd,40] call Schlaak_fnc_Schlaaksay;
//[_radio, _snd, 20] call CBA_fnc_globalSay3d;
};

/*
_snd = select random ["POradio0","POradio1","POradio2","POradio3","POradio4","POradio5","POradio6","POradio7","POradio8","POradio9","POradio10","POradio11","POradio12","POradio13","POradio14","POradio15","POradio16","POradio17","POradio18"];