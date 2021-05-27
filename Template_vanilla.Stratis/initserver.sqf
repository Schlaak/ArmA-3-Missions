[60,30,1] execVM "02_scripts\AbandonedRoads\init.sqf";


missionNamespace setVariable ["L917_Units", nil, true];


missionNamespace setVariable ["L917_Captured", 0, true];
//Caputred Units - INT
L917_Captives = [];
//Captured Units - Array of Units


missionNamespace setVariable ["L917_KIA_AAF", 0, true];
//killedaaf units - INT
L917_KIA_NameAAF = [];
//Killed Units - Array of Units

missionNamespace setVariable ["L917_KIA_Opf", 0, true];
//killedOpfor units - INT
L917_KIA_NameEast = [];
//Killed Units - Array of Units

missionNamespace setVariable ["L917_KIA_Civ", 0, true];
//killedCivs units - INT
L917_KIA_Name = [];
//Killed Units - Array of Units

missionNamespace setVariable ["L917_KIA_west", 0, true];
//killedWest units - INT
L917_KIA_NameWest = [];
//Killed Units - Array of Units