params ["_unit"];
if !(isserver) exitwith {};


if (!isNil {_unit getVariable "Schlaak_counted"}) exitWith {};
_unit setVariable ["Schlaak_counted", 0, false];
switch (faction _unit) do


{
    case "OPF_G_F":
    {
    missionNamespace setVariable ["L917_KIA_Opf", ((missionNamespace getVariable ["L917_KIA_Opf",0]) + 1), false] ;
		//(missionNamespace setVariable ["L917_KIA_Opf", 0]) + 1;
		[L917_KIA_NameEast,_unit] remoteExec ["pushback", 2, true];
    };

    case "CIV_F":
    {
    missionNamespace setVariable ["L917_KIA_Civ", ((missionNamespace getVariable ["L917_KIA_Civ",0]) + 1), false] ;
		//(missionNamespace setVariable ["L917_KIA_Civ", 0]) + 1;
		[L917_KIA_Name,_unit] remoteExec ["pushback", 2, true];
    };
    case "IND_F":
    {
        missionNamespace setVariable ["L917_KIA_AAF", ((missionNamespace getVariable ["L917_KIA_AAF",0]) + 1), false] ;
		//(missionNamespace setVariable ["L917_KIA_AAF", 0]) + 1;
		[L917_KIA_NameAAF,_unit] remoteExec ["pushback", 2, true];
    };
    case "BLU_F":
    {
    missionNamespace setVariable ["L917_KIA_west", ((missionNamespace getVariable ["L917_KIA_west",0]) + 1), false] ;
		//(missionNamespace setVariable ["L917_KIA_west", 0]) + 1;
		[L917_KIA_NameWest,_unit] remoteExec ["pushback", 2, true];
    };
};
_unit removeAllMPEventHandlers "MPHit";
_unit removeAllMPEventHandlers "MPKilled";