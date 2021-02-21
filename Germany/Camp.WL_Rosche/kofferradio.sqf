if (!isserver) exitWith {};
[Kofferradio, "snd_music3", 100] call CBA_fnc_globalSay3d;
sleep 31;
//[dudes, "snd_yeah", 100] call CBA_fnc_globalSay3d;
removeAllActions Kofferradio;
sleep 345;
Kofferradio AddAction ["HEAVY METAL!","Kofferradio execvm 'Kofferradio.sqf'",nil,1.5,false,true,"","((player distance _this)<3)"];
