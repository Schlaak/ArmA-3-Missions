params ["_gruppe"]; 

//if (!isserver  OR (isNull _gruppe)) exitWith {};
//todo test #lastminutechange



if (!isNil {_gruppe getVariable "Schlaak_grpCompros"}) exitWith {};
//if (isNil {_gruppe getVariable "Schlaak_grpCompros"}) then {
	
_gruppe setVariable ["Schlaak_grpCompros", 0, false];
	
	//};

[_gruppe] spawn {
	sleep 3;
	_gruppengroesse = count units (_this select 0);
	_Cap = selectrandom [0.3,0.4,0.5,0.6];
	_captive = selectrandom [true,false];

	waitUntil {sleep 2;({ alive _x } count units (_this select 0)) < (_gruppengroesse * _Cap)};

	if (_captive) then
		{
			_surrSay = selectrandom ["Don´t shoot! We surrender!","Don´t shoot!","We surrender!","WE SURRENDER!","WE GIVE UP!"];
			leader ( _this select 0) customChat [5, _surrSay];
			[_this select 0] call Schlaak_fnc_surrender;
			//systemchat "group surrendering";

			
		}
		else
		{
			_fleeSay = selectrandom ["Flee now!","Flee now fools!","Ruuuun!!!","To the hills!","HELP! We must flee!"];
			leader ( _this select 0) customChat [5, _fleeSay];
			[_this select 0] call Schlaak_fnc_flee;
			//systemchat "group fleeing";
		};
};

