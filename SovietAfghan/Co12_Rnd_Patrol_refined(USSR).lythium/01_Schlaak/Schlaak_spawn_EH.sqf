//will add an eventhandler to all classes that fires when their init is called
//[] execVM "01_schlaak\Schlaak_spawn_EH.sqf";

/*
TODO WIP
*/
{_x addMPEventHandler ["MPhit", { [_this select 0] call Schlaak_fnc_incap; }];} foreach allunits;
{_x addMPEventHandler ["MPKilled", { [_this select 0] call Schlaak_fnc_Killed; }];} foreach allunits;
{[_x] execvm  "01_schlaak\setAIskill.sqf";} foreach allunits;


diag_log ["SCHLAAK_SPAWN_EH.SQF: Initialized"];
systemchat "SCHLAAK_SPAWN_EH.SQF: Initialized";
["Man", "init", {
	//systemChat str _this;
	//diag_log ["spawn EH fired with ",_this,"at",time];
	_dude = _this select 0;

	_dude addMPEventHandler ["MPhit", { [_this select 0] call Schlaak_fnc_incap; }];
	_dude addMPEventHandler ["MPKilled", { [_this select 0] call Schlaak_fnc_killed; }];
	[_dude] execvm  "01_schlaak\setAIskill.sqf";

	removeAllItems _dude;
	removeAllAssignedItems _dude;
	removeGoggles _dude;

	switch (side _dude) do
	{
		case West: 
		{
			
			[group _dude] call Schlaak_fnc_grpCompromised;

		};

		case East:
		{
			[group _dude] call Schlaak_fnc_grpCompromised;

		};
		case independent:
		{
			[group _dude] call Schlaak_fnc_grpCompromised;

		};

	};

	switch (faction _dude) do
	{


		case "cwr3_faction_rus":	//Red army
		{
			//STATEMENT; todo sovietuniform.sqf as function;
			[_dude] execvm "01_schlaak\sovietuniform.sqf";

		};

		case "cwr3_faction_fia":	//Rebel B1*X35
		{
			//STATEMENT;

		};
		case "cwr3_faction_usa":	//us forces
		{
			//STATEMENT;

		};
		case "cwr3_faction_civ":	//CWR3 civis
		{
			//STATEMENT;

		};
		case "CUP_I_TK_GUE":		//dushman
		{
			[_dude] execvm "01_schlaak\dushman.sqf";

		};
		case "CUP_C_TK":			//Afgh.Civs
		{
			//[_dude] execvm "01_schlaak\dushman.sqf";

		};
	};


	}] call CBA_fnc_addClassEventHandler;
	
/*
["Man", "MPHit", {
	_dude = this select 0;
	[_dude] call Schlaak_fnc_incap;
	}] call CBA_fnc_addClassEventHandler;
/*
{_x addMPEventHandler ["MPhit", { [_x] call Schlaak_fnc_incap; }];} foreach allunits; 