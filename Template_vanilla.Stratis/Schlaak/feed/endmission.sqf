sleep 5;
{ !alive _x } count L917_KIA_NameAAF;
{ !alive _x } count L917_Captives;
{ !alive _x } count L917_KIA_NameWest;
{ !alive _x } count L917_KIA_NameEast;

TOC sidechat "Gefallene Feinde während der Operation:";
sleep 2;
TOC sidechat str (missionNamespace getVariable ["L917_KIA_Opf", 0]);
// + str (floor random 6);
sleep 2;
TOC sidechat "Getötete Zivilisten:";
sleep 2;
TOC sidechat str (missionNamespace getVariable ["L917_KIA_Civ", 0]);
// - str (floor random 6);
sleep 2;
TOC sidechat "Gefallene Armeeangehörige:";
sleep 2;
TOC sidechat str (missionNamespace getVariable ["L917_KIA_AAF", 0]);
// - str (floor random 3);
sleep 2;
TOC sidechat "Getötete Sekundärkräfte:";
sleep 2;
TOC sidechat str (missionNamespace getVariable ["L917_KIA_west", 0]);
sleep 2;


sleep 300;
"end1" call BIS_fnc_endMission;