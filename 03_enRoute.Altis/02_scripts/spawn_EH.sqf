//will add an eventhandler to all classes that fires when their init is called
//[] execVM "scripts\spawn_EH.sqf";

/*
TODO WIP
*/
diag_log ["#################################### spawn eventhandler init called"];
["Man", "init", {
	//systemChat str _this;
	diag_log ["spawn EH fired with ",_this,"at",time];
	_dude = _this select 0;
	if (faction _dude == "cwr3_faction_rus") then {
		//systemChat "faction is NATO";
		[_dude] execvm "Schlaak\sovietuniform.sqf";
	};

	}] call CBA_fnc_addClassEventHandler;