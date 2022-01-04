//adds an ace action to get assigned a route to specific class
/**
	params:
	0: classname of target
	return:
	nothing
*/
params [
	["_targetClass","",["uwu"]]
	];

//create action
_action = [
    "Request patrol route", //name
    "Request patrol route", //displayname
    "", //icon string
    {       //statement
		params ["_target", "_player", "_params"];
		[_player] remoteExec ["IRN_fnc_requestRoute",2,false];
    },
    { //condition
		true
    },
    {}, //child code
    [] //action params
] call ace_interact_menu_fnc_createaction;

//add to class
[_targetClass, 0, ["ACE_MainActions"], _action, false] call ace_interact_menu_fnc_addActiontoClass;