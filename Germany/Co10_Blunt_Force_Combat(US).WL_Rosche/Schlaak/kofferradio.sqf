if (!isserver) exitWith {};
_Kofferradio = _this select 0;

[_Kofferradio,"snd_music3",100] call Schlaak_fnc_Schlaaksay;
removeAllActions _Kofferradio;
sleep 645;
_Kofferradio AddAction ["HEAVY METAL!","_Kofferradio execvm 'Schlaak\Kofferradio.sqf'",nil,1.5,false,true,"","((player distance _this)<3)"];
