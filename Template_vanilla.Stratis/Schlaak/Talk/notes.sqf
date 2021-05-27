<arguments> remoteExec ['tag_fnc_myFunction',(allPlayers select {((_x distance <center_position>) <= <radius>)})];



[dude,[[line1],"SIDE",0.15,true]] remoteExec [execvm, (allPlayers select {((_x distance dude) <= 15)})]




/*
That's how you execute the script on all clients in MP:

*/
{[] execVM "fnc\dialogue1.sqf"} remoteExec ["bis_fnc_call",0];
/*
And then you put this at the top of your script:
*/

if ( (player distance anastasia) > 10 ) exitWith {};
/*
That way the script will be executed on ALL machines, but everything after the exitWith {}; will only be executed by the machines of players who are less than 10 meters in distance to anastasia.
*/





this addaction["<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa' />","02_scripts\grab.sqf",nil,1,true,true,"","((_target distance _this) <2) && alive _target && ((lifeState _target) == 'HEALTHY') "];








h = [this] spawn {
 sleep 1;

 disableSerialization;
 _display = findDisplay 46;
 _control = _display ctrlCreate [ "RscStructuredText", 999 ];

 [ "text", "onEachFrame", {
  _unit = _this select 0;


  _display = findDisplay 46;
  _control = _display displayCtrl 999;

  _name = ( name _unit ) splitString " ";

  _control ctrlSetStructuredText parseText format[ "<t align='center'>%1<br />%2</t>", _name select 0,  _name select 1 ];

  _w = ( ctrlPosition _control  ) select 2;
  _h = ( ctrlPosition _control  ) select 3;

  _pos2D = worldToScreen ( ( getPosVisual _unit ) vectorAdd [ 0, 0, 2 ] );

  if ( count _pos2D > 0 ) then {

   _control ctrlSetPosition [
    (_pos2D select 0) - _w/2,
    (_pos2D select 1) - _h/2,
    0.1,
    0.1
   ];

   _control ctrlSetFade 0;
   _control ctrlCommit 0;
  }else{
   _control ctrlSetFade 1;
   _control ctrlCommit 0;
  };

 }, _this ] call BIS_fnc_addStackedEventHandler;

};