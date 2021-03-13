// foreach
{_dude addItemToUniform _x} forEach _Uitems;



// Ambiente anim
[this,"SIT_HIGH2"] call BIS_fnc_ambientAnim;
[this,"SIT_HIGH2"] remoteExec ["BIS_fnc_ambientAnim", 0, true];

/*
	   > "STAND"		- standing still, slightly turning to the sides, with rifle weapon
	   > "STAND_IA"		- standing still, slightly turning to the sides, with rifle weapon
	   > "STAND_U1-3"	- standing still, slightly turning to the sides, no weapon
	   > "WATCH1-2"		- standing and turning around, with rifle weapon
	   > "GUARD"		- standing still, like on guard with hands behing the body
	   > "LISTEN_BRIEFING"  - standing still, hands behind back, recieving briefing / commands, no rifle.
	   > "LEAN_ON_TABLE"	- standing while leaning on the table
	   > "LEAN"		- standing while leaning (on wall)
	   > "BRIEFING"		- standing, playing ambient briefing loop with occasional random moves
	   > "BRIEFING_POINT_LEFT"	- contains 1 extra pointing animation, pointing left & high
	   > "BRIEFING_POINT_RIGHT"	- contains 1 extra pointing animation, pointing right & high
	   > "BRIEFING_POINT_TABLE"	- contains 1 extra pointing animation, pointing front & low, like at table
	   > "SIT1-3"		- sitting on chair or bench, with rifle weapon
	   > "SIT_U1-3"		- sitting on chair or bench, without weapon
	   > "SIT_AT_TABLE"	- sitting @ table, hands on table
	   > "SIT_HIGH1-2" 	- sitting on taller objects like a table or wall, legs not touching the ground. Needs a rifle!
	   > "SIT_LOW"		- sitting on the ground, with weapon.
	   > "SIT_LOW_U"	- sitting on the ground, without weapon.
	   > "SIT_SAD1-2"	- sitting on a chair, looking very sad.
	   > "KNEEL"		- kneeling, with weapon.
	   > "PRONE_INJURED_U1-2" - laying wounded, back on the ground, wothout weapon
	   > "PRONE_INJURED"	- laying wounded & still, back on the ground, with or without weapon
	   > "KNEEL_TREAT"	- kneeling while treating the wounded
	   > "REPAIR_VEH_PRONE"	- repairing vehicle while laying on the ground (under the vehicle)
	   > "REPAIR_VEH_KNEEL"	- repairing vehicle while kneeling (like changing a wheel)
	   > "REPAIR_VEH_STAND"	- repairing/cleaning a vehicle while standing

*/


// Ambiente anim combat
	"HubStandingUA_move1",
	"HubStandingUA_move2",
	"HubStandingUA_idle1",
	"HubStandingUA_idle2",
	"HubStandingUA_idle3",
	"AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon",
	"AmovPercMstpSnonWnonDnon"
	/*
	Description:
	Play set of ambient animations on given unit AND allows the unit to leave the ambient state and engage enemy or move away.

	Remarks:
	* Function controls BIS_fnc_ambientAnim; check that function [Remarks] section for more info of how to use it.
	* Unit automatically leaves the animation loop if there is an enemy in 300m he knows about.

	Parameter(s):
	0: OBJECT - unit the anim & gear changes are going to be applied to
	1: STRING (optional, default "STAND") - animation set id, describing what the unit's action looks like.
	   > "STAND" 			- standing still, slightly turning to the sides. Needs a rifle!
	   > "STAND_IA"			- default a3 animations for standing, rifle lowered
	   > "SIT_LOW"			- sitting on the ground, with weapon.
	   > "KNEEL"			- kneeling, with weapon.
	   > "LEAN"			- standing while leaning (on wall)
	   > "WATCH"/"WATCH1"/"WATCH2"	- standing and turning around

	2: STRING (optional, default "RANDOM") - equipment level id, describing how heavily is the unit equipped.
	   > "NONE"  		- no goggles, headgear, vest, weapon
	   > "LIGHT"  		- no goggles, headgear, vest
	   > "MEDIUM" 		- no goggles, headgear
	   > "FULL"  		- no goggles
	   > "ASIS" (default)	- no touches to the gear
	   > "RANDOM" 		- gear is randomized according to the animation set

	3: CODE or STRING (optional, default {false}) - condition that if true frees the unit from the animation loop

	4: STRING (optional, default "COMBAT") - behaviour the unit should go to, when freed.

	Returns:
	-

	Example:
	[this,"STAND","ASIS",{(player distance _this) < 5}] call BIS_fnc_ambientAnimCombat;
	*/

// holdaction
[_target , "Einpacken", "textures\icon\backpack.paa", "textures\icon\backpack.paa", "_this distance _target < 1.5",  "_target distance _caller < 1"    , {[_caller,"AinvPknlMstpSnonWnonDr_medic3"]   remoteExec ["playmove", 0, true];
}, {
}, { deletevehicle _target; [_caller,""]   remoteExec ["playmove", 0, true]; }, { }, [], 2.5, 0, false, false, true] remoteExec ["BIS_fnc_holdActionAdd", 0, true];

[this , "Einpacken", "textures\icon\kleidung.paa", "textures\icon\kleidung.paa", "_this distance _target < 1.5",  "_target distance _caller < 1.5"    , {}, {}, {[_caller] execvm "scripts\umziehen.sqf" }, { }, [], 1.5, 0, false, false, true] remoteExec ["BIS_fnc_holdActionAdd", 0, true];


//inspect
[myLeaflet, true] call BIS_fnc_initLeaflet;
[myLeaflet, "#(argb,8,8,3)color(1,0,1,1)", "This is some Magic Pink"] call BIS_fnc_initInspectable; // Initialize

[
	ukwradio,											// Object the action is attached to
	"Patrouillenorder",										// Title of the action
	"\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa",	// Idle icon shown on screen
	"\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 2",						// Condition for the action to be shown
	"_caller distance _target < 2",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ (floor random 5) execvm "scripts\route.sqf" },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration [s]
	0,													// Priority
	true,												// Remove on completion
	false												// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _myLaptop];	// MP compatible implementation



//attachto
[this,nearestObject]
[tank, car] call BIS_fnc_attachToRelative;

[this,(nearestObject [this, ""])] call BIS_fnc_attachToRelative;


// 80s intro text
[
 [
  ["PAPA-BASE,","<t align = 'right' shadow = '1' size = '1.2' font='LCD14' color='#00FF00'>%1</t><br/>"],
  ["RADIO POST,","<t align = 'right' shadow = '1' size = '1.2' font='LCD14' color='#00FF00' >%1</t><br/>"],
  [

"FGR, DY64,"

,"<t align = 'right' shadow = '1' size = '1.0' font='LCD14' color='#00FF00' >%1</t><br/>"],
  [

"22 Aug 1988"

,"<t align = 'right' shadow = '1' size = '1.0' font='LCD14' color='#00FF00' >%1</t>"]
 ] ,(safeZoneX +1.1), (safeZoneY +1.4)
] spawn BIS_fnc_typeText;




// Synchronzedobjects

{(deletevehicle _x)} foreach ( synchronizedObjects thistrigger);  }

{_x hideObjectGlobal false;} foreach (synchronizedObjects thisTrigger);  {_x enableSimulationGlobal true;} foreach (synchronizedObjects thisTrigger);


//hiddenobjects per script
{_x hideobjectglobal false } foreach (synchronizedObjects GAMELOGIC);

{_x enableDynamicSimulation true;} foreach (synchronizedObjects GAMELOGIC);
{_x enableSimulationGlobal true;_x enableDynamicSimulation true;_x hideobjectglobal false} foreach (synchronizedObjects GAMELOGIC);

// hide multiple markers with for loop
X = 0;
for "X" from 0 to 10 do {
format ["R1_%1", X] setmarkeralpha 0;
}



//soundsource
_soundSource = createSoundSource ["club", getposatl this, [], 0];

/*
== in description.ext
class CfgSFX
{
		class music1sndfi
	{
		sound01[] = {"music\music1.ogg", db+9, 1.0, 50, 0.8, 140, 140, 140};  // russo metali rappo
		sounds[] = {sound01};
		empty[] = {"", 0};
	};
	};

class CfgVehicles
{
		class music1 // class name to be used with createSoundSource
	{
		sound = "music1snd"; // reference to CfgSFX class
	};
	};
*/


// BEAMEN
{_x setpos ([(getmarkerpos "insert1" select 0) +(random 10), (getmarkerpos "insert1" select 1) + (random 10) , (getmarkerpos "insert1" select 2)])} forEach thislist}


//blutige einheit
this setObjectMaterial [0, "A3\Characters_F\Common\Data\basicbody_injury.rvmat"];




//
// ===================================================================================
// Punkte per variable in array hinzufügen
/*

Random spawn etc.

*/


_arr = missionNamespace getVariable ["markerList",[]];
_arr pushback this;
missionNamespace setVariable ["markerList",_arr,true];




selectrandom (missionnamespace getvariable "markerList")

// nur einmal nach inti ausführen.
_arr = _arr arrayIntersect _arr;



//Zeug per trigger wegräumen
player playmove "AmovPknlMstpSnonWnonDnon"; {(deletevehicle _x)} foreach ( synchronizedObjects thistrigger);  Stuffweggerauemt =  Stuffweggerauemt + 1




// set gm buildings damaged via objectinit radius 500
(nearestBuilding this) ;
{_x setdammage ((random 0.3)+0.7)} foreach ((getpos this) nearObjects ["House", 500]);
{_x setHit [ ( selectrandom ["chunk_03_hp","chunk_02_hp","chunk_01_hp","chunk_04_hp"]),1,false]} foreach ((getpos this) nearObjects ["House", 500]);

//Blaulicht
[this,'gm_beacons_blu',true] call gm_core_vehicles_fnc_beaconSwitch

//orangelicht
[this,'gm_beacons_org',true] call gm_core_vehicles_fnc_beaconSwitch



//LAMBS
<unit> setVariable ["lambs_danger_disableAI",true];
<group> setVariable ["lambs_danger_disableGroupAI",true];
//taskArtillery

//Performs artillery strike at location. Artillery strike has a cone-like 'beaten zone'
//Arguments:

0: Artillery unit <OBJECT>
1: Position targeted <ARRAY>
2: Caller of strike <OBJECT>
3: Rounds fired, default 3 - 7 <NUMBER>
4: Dispersion accuracy, default 100 <NUMBER>
5: Skip Check Rounds default false <BOOLEAN>

[cannonbob, getPos angryJoe, bob] spawn lambs_wp_fnc_taskArtillery;


//taskCamp

//Sets the team in camp like behaviour, Larger groups will set out patrols, Turrets may be manned, and Some buildings may be garrisoned
//Arguments:

0: Group performing action, either unit <OBJECT> or group <GROUP>
1: Central position camp should be made, <ARRAY>
2: Range of patrols and turrets found, default is 50 meters <NUMBER>
3: Area the AI Camps in, default [] <ARRAY>
4: Teleport Units to Position <BOOL>
5: Partial group Patrols the Area <BOOL>

[bob, getPos bob, 50] call lambs_wp_fnc_taskCamp;




//gruppe löschen | delete group
{ deleteVehicle (vehicle _x) }forEach units (group this);
{ deleteVehicle _x }forEach units (group this);

// gruppe hat weniger als x einheiten
count (units (group this)) <= 3
// trigger has less than 8 east units
(east countSide thislist) <= 8;


//ambiente flyby (merke! Jets brauchen mindestens 650 als höhe... sonst stürzen sie ab)


//Gruppe aussteigen lassen
{_x action ["Eject",this]} forEach crew vehicle this; {unAssignVehicle _x} forEach crew vehicle this;


// abflug sobal alle spieler im heli sind
waitUntil {sleep 1; {alive _x} count allPlayers == {_x in _helo} count allPlayers};
// besser
waitUntil {sleep 1; allPlayers findIf {alive _x && !(_x in exfiltrationshelo)} == 0};
( {alive _x } count allPlayers ) isEqualTo ( {_x in exfiltrationshel} count allPlayers )

if (isNull _drone) then {
	if (isNil "irn_reaper_01") exitWith {
		["given drone is nil and default 'irn_reaper_01' does not exist."] call BIS_fnc_error;
	};
	_drone = irn_reaper_01;
};