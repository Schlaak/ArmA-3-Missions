execvm "scripts\defineTroops.sqf";
_USSR = [];
{if ((side _x) == east) then {_USSR pushBack _x}} forEach allUnits;
sleep 35;
["Huraa"] remoteExec ["playsound", 0, true];
{_x action ["salute", _x]} foreach (_USSR);
sleep 17;



{_x domove (getpos _x)} foreach (_USSR);
{_x disableai "RADIOPROTOCOL"} foreach (_USSR);
{_x setunitpos "auto"} foreach (_USSR);
