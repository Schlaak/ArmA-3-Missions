/*
LAMBS Danger FSM - variables and functions

The mod adds a few unique variables to individual units and groups to read information and to enable control.
Variables
Group variables

Group leaders are equipped with an extra layer of AI. The group or tactical assessment component covers such things as calling for artillery, coordinated building assaults, hiding from tanks or airplanes, remanning static weapons, scanning with binoculars, and additional levels of extra-group communication.
*/
group this setVariable ["lambs_danger_disableGroupAI",true];
/*
Unit variables

The enhanced behaviours of the mod are easily toggled. The unit FSM may be dynamically deactivated during play. The individual AI handles such things as entering buildings, the reaction state to combat, panicking and various other core LAMBS Danger FSM features.
*/
this setVariable ["lambs_danger_disableAI",true];
/*
Formation variable

With the group AI active it is possible to configure formation changes on first contact. The formation change is run on the 'Contact' event. Possible uses could be to change the unit from a patrolling formation to a CQC mode, or some other preferred variation.

<group> setVariable ["lambs_danger_dangerFormation","FILE"];
Functions

Documentation for most of the functions can be read from the GitHub itself. The header for each mod includes a description and example of use. Among the public and more utilitarian functions are those pertaining to the unique waypoints added by the mod. These are described below:
Waypoint/Module Functions

WARNING! TaskX Functions, Waypoints, and Modules must be Executed where the AI is local, and the AI must stay on that client.
taskArtillery

Performs artillery strike at location. Artillery strike has a cone-like 'beaten zone'
Arguments:

0: Artillery unit
1: Position targeted
2: Caller of strike
3: Rounds fired, default 3 - 7
4: Dispersion accuracy, default 100
5: Skip Check Rounds default false
*/
[cannonbob, getPos angryJoe, bob] spawn lambs_wp_fnc_taskArtillery;
/*
taskArtilleryRegister

Register units as ready artillery pieces
Arguments:

0: Group to check either unit or group
*/
[group bob] call lambs_wp_fnc_taskArtilleryRegister;
/*
taskAssault

AI Rushes heedlessly to position with an option to be in forced retreat
Arguments:

0: Unit fleeing
1: Destination
2: Forced retreat, default false
3: Distance threshold, default 10
4: Update cycle, default 2
5: Is Called for Waypoint, default false
*/
[bob, getPos angryJoe] spawn lambs_wp_fnc_taskAssault;
/*
taskCamp

Sets the team in camp like behaviour, Larger groups will set out patrols, Turrets may be manned, and Some buildings may be garrisoned
Arguments:

0: Group performing action, either unit <OBJECT> or group <GROUP>
1: Central position camp should be made, <ARRAY>
2: Range of patrols and turrets found, default is 50 meters <NUMBER>
3: Area the AI Camps in, default [] <ARRAY>
4: Teleport Units to Position <BOOL>
5: Partial group Patrols the Area <BOOL>
*/
[this, getPos this, 50,[], true, true] call lambs_wp_fnc_taskCamp;
/*
taskCQB

Close Combat Module lets AI Group identifies buildings, Clears them methodically, marks building safe, moves to next building and, repeat until no buildings left
Arguments:

0: Group performing action, either unit or group
1: Position targeted
2: Radius of search, default 50
3: Delay of cycle, default 21 seconds
4: Area the AI Camps in, default []
5: Is Called for Waypoint, default false
*/
[bob, getPos angryJoe, 50] spawn lambs_wp_fnc_taskCQB;
/*
taskGarrison

The AI will take up building positions and man static weapons within a set range. Units will remain static until a triggered, the trigger may be taking damage, shooting weapons, or being near an enemy fire.
Arguments:

0: Group performing action, either unit or group 1: Position to occupy, default group location 2: Range of tracking, default is 50 meters 3: Area the AI Camps in, default [] 4: Exit Conditions that breaks a Unit free (-2 Random, -1 All, 0 Hit, 1 Fired, 2 FiredNear, 3 None), default -2
*/
[bob, bob, 50] call lambs_wp_fnc_taskGarrison;
/*
taskPatrol

Simple dynamic patrol script by nkenny Suitable for infantry units (not so much vehicles, boats or air-- that will have to wait!)
Arguments:

0: Group performing action, either unit or group
1: Position being searched, default group position
2: Range of tracking, default is 200 meters
3: Waypoint Count, default 4
4: Area the AI Camps in, default [] 5: Dynamic patrol pattern, default false
*/
[bob, bob, 500] call lambs_wp_fnc_taskPatrol;
/*
taskReset

A Function which resets units, canceling garrisons, waypoints an all animation phases
Arguments:

0: Group performing action, either unit or group
*/
[bob] call lambs_wp_fnc_taskReset;
/*
Search Functions
taskRush

The AI will move with perfect knowledge towards any player unit within range. While not fearless, the AI is very aggressive and will enter buildings. The AI will know the player location but not targeting information-- the AI must still locate the enemy to start shooting. Perfect for Black Hawk Down style scenarios or mad dashes through Tanoan jungles. Or both!
Arguments:

0: Group performing action, either unit or group
1: Range of tracking, default is 500 meters
2: Delay of cycle, default 15 seconds
3: Area the AI Camps in, default []
4: Center Position, if no position or Empty Array is given it uses the Group as Center and updates the position every Cycle, default []
5: Only Players, default true
*/
[bob, 500] spawn lambs_wp_fnc_taskRush;
/*
taskHunt

An LRRP patrol style script that has the unit slowly patrol in an area which gradually centers on the nearest player, within the defined range. Good for having patrols that must absolutely trigger or when you need to be careful with your AI resources and want only a single patrol which will generate some heat.
Arguments:

0: Group performing action, either unit or group
1: Range of tracking, default is 500 meters
2: Delay of cycle, default 15 seconds
3: Area the AI Camps in, default []
4: Center Position, if no position or Empty Array is given it uses the Group as Center and updates the position every Cycle, default []
5: Only Players, default true
*/
[bob, 500] spawn lambs_wp_fnc_taskHunt;
/*
taskCreep

Have the AI stalk, raptor style, the player forces. The group will attempt to move as close as possible before unleashing a hailstorm of fire. Sneaky, stealthy and quite scary.
Arguments:

0: Group performing action, either unit or group
1: Range of tracking, default is 500 meters
2: Delay of cycle, default 15 seconds
3: Area the AI Camps in, default []
4: Center Position, if no position or Empty Array is given it uses the Group as Center and updates the position every Cycle, default []
5: Only Players, default true
*/
[bob, 500] spawn lambs_wp_fnc_taskCreep;































LAMBS specific event handlers
Name    Arguments   Description
lambs_danger_OnCheckBody    _unit <Object>, _groupOfUnit <Group>, _body <Object>    Called when a Units Checks a Body
lambs_danger_OnArtilleryCalled
  _unitThatCalledArtillery <Object>, _groupOfUnit <Group>, _ArtilleryGun <Object>, _TargetPosition <Array<Number>>

//Called when a Squad Leader Calls Artillery Support


lambs_danger_OnAssess
   _unit <Object>, _groupOfUnit <Group>, _enemys <Array<Object>>
//Called when a Leader assess the current Situation


lambs_danger_OnContact
  _unit <Object>, _groupOfUnit <Group>, _target <Object>
//Called when a Leader gets into Contact


lambs_danger_OnPanic
    _unit <Object>, _groupOfUnit <Group>
//Called when a Unit falls into the Panic State


lambs_danger_OnInformationShared
    _unit <Object>, _groupOfUnit <Group>, _target <Object>, _groups <Array<Groups>>
//Called when a Unit Shares Informations


lambs_danger_OnFleeing
  _unit <Object>, _groupOfUnit <Group>
//Called when a Unit falls into a Fleeing State



Example of use
CBA Event handlers

["lambs_danger_OnPanic", {
    params ["_unit", "_group"];
    _unit playAction "Surrender";
}] call CBA_fnc_addEventHandler;

BIS Scripted Event handlers

Requires: 2.4.0

[bob, "lambs_danger_OnPanic", {
    params ["_unit", "_group"];
    _unit playAction "Surrender";
}] call BIS_fnc_addScriptedEventHandler;