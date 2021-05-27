//Todo:
/*
feed\kia -> due to ace all units will count as civs.
Make it class based or faction based.
*/

// Sit on chair script
this addAction ["<t color='#0099FF'>Sit Down</t>","02_scripts\Chair\sitdown.sqf"]

// Take and tie unit
this addaction["<img size='4'  image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa' />","02_scripts\grab.sqf",nil,0,true,true,"","((_target distance _this) <2) && alive _target && ((lifeState _target) == 'HEALTHY') "];

//make unit assassin
nul = [this,"CUP_hgun_Makarov",(2+random 35),floor random 50 + 5,resistance,1,1] execVM "02_scripts\ws_assassins.sqf";


// let unit say something
 line1 = ["Dude", "Hey, hast du ein paar Zigaretten?", dude];

[[line1],"DIRECT",0.12,true] remoteExec ["fn_simpleConv", (allPlayers select {((_x distance dude) <= 15)})]


// endmission with radio feedback
[] execvm "Schlaak\feed\endmission.sqf"

// cinematic feedback
[] execvm "Schlaak\feed\introText.sqf"

//make unit say lines
if (alive dude) then {
_line1 = ["Dude", "", dude];  
_line2 = ["Dude", "", dude]; 
[[_line1,_line2],"DIRECT",0.15,true] remoteexec ["fn_simpleConv", (allPlayers select {((_x distance dude) <= 15)})];
};




// make addaction with conversation


this addaction ["<img size='4'  image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa' />",

"
_line1 = [ name (_this select 1), 'yo imma fuck you up', _this select 1];  
_line2 = [name (_this select 0), 'oh no',  _this select 0]; 

{[[_line1,_line2],'DIRECT',0.15,true] remoteExec ['fn_simpleConv', _x]} foreach ((allPlayers select {((_x distance (_this select 0)) <= 15)}));

(_this select 0) removeaction (_this select 2);
[_this select 0,_this select 2] remoteExec ['removeAction', 0, true];
",
[_caller,_target,_actionId],0,true,true,"",
"((_target distance _this) <2) && alive _target && ((lifeState _target) == 'HEALTHY') "];


//Rappel
[HELI_NAME] call AR_Rappel_All_Cargo

//This function will rappel the cargo units at 25m at the heli's current position. 
//If the heli is currently moving, it will stop so units can rappel.
//If you want more control, there are addtional parameters you can set:

[HELI_NAME,RAPPEL_HEIGHT,POSITION_ASL] call AR_Rappel_All_Cargo



// create garbage clutter ground shit
_decal = ["Land_Decal_Garbage_01_F", getPosWorld this, getDir this] call BIS_fnc_createSimpleObject;
[_decal, 3] remoteExec ["setobjectscale", 0];
deletevehicle this;