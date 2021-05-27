//TODO:
// mapgridpos -> stimmt der marker?
// [] execvm "Schlaak\feed\introText.sqf";
// execute localy
//params ["_unit"];


    [
    	[
    		[format ["nahe %1", text nearestLocation [position player, "NameCity"]], "align = 'right' shadow = '1' size = '0.7' font='LucidaConsoleB'"],
    		["","<br/>"],
    		["COORD:" + str (mapGridPosition (getpos player)), "align = 'right' shadow = '1' size = '0.7' font='LucidaConsoleB'"],
    		["","<br/>"],
    		["YMD:" + format ["%1-%2-%3", date select 0,date select 1,date select 2],"align = 'right' shadow = '1' size = '0.7' font='LucidaConsoleB'"],
    		["","<br/>"],
    		["HH:MM:" + ([daytime, "HH:MM"] call BIS_fnc_timeToString),"align = 'right' shadow = '1' size = '0.7' font='LucidaConsoleB'"],
    		//["","<br/>"],

            //["ID:" + str (groupId  player),"align = 'right' shadow = '1' size = '0.7' font='LucidaConsoleB''"]
    		[str name playergroup,"align = 'right' shadow = '1' size = '0.7' font='LucidaConsoleB''"]
    	] ,	safeZoneX, safeZoneH / 2,
	true,
	"<t font='PuristaBold'>%1</t>",
	[],
	{ false },
	true
    ] spawn BIS_fnc_typeText2;