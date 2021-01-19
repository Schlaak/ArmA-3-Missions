// [this] execvm "infected.sqf";
if (isServer) then {
_unit = _this select 0;
_face = selectrandom ["GreekHead_A3_01_sick",
"GreekHead_A3_02_sick",
"GreekHead_A3_03_sick",
"GreekHead_A3_04_sick"];



	[_unit, _face] remoteExec ["setFace", 0, _unit]
};

/*
"AfricanHead_01_sick",
"AfricanHead_02_sick",
"AfricanHead_03_sick",
"AsianHead_A3_01_sick",
"AsianHead_A3_02_sick",
"AsianHead_A3_03_sick",
"AsianHead_A3_04_sick",
"AsianHead_A3_05_sick",
"AsianHead_A3_06_sick",
"AsianHead_A3_07_sick",
"GreekHead_A3_01_sick",
"GreekHead_A3_02_sick",
"GreekHead_A3_03_sick",
"GreekHead_A3_04_sick",
"PersianHead_A3_01_sick",
"PersianHead_A3_02_sick",
"PersianHead_A3_03_sick",
"TanoanHead_A3_01_sick",
"TanoanHead_A3_02_sick",
"TanoanHead_A3_03_sick",
"TanoanHead_A3_04_sick",
"TanoanHead_A3_05_sick",
"TanoanHead_A3_06_sick",
"TanoanHead_A3_07_sick",
"TanoanHead_A3_08_sick",
"WhiteHead_16_sick",
"WhiteHead_17_sick",
"WhiteHead_18_sick",
"WhiteHead_19_sick",
"WhiteHead_20_sick",
"WhiteHead_21_sick"