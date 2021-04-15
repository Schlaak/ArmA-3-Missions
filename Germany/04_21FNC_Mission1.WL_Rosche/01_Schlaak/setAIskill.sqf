
//_dude execvm "01_schlaak\setAIskill.sqf";
_dude = _this select 0;

if (side _dude == civilian) then {
	_dude setSkill ["commanding", 0]; 
	_dude setSkill ["courage", 0];

	_dude setSkill ["spotDistance", 0.5];
	_dude setSkill ["spotTime", 0.5];

	_dude setSkill ["aimingAccuracy", 0]; 
	_dude setSkill ["aimingSpeed", 0];
	_dude setSkill ["reloadSpeed", 0]; 
	_dude setSkill ["aimingShake", 0];
} else {
	_dude setSkill ["commanding", 1]; 
	_dude setSkill ["courage", 1];

	_dude setSkill ["spotDistance", 0.8];
	_dude setSkill ["spotTime", 0.2];

	_dude setSkill ["aimingAccuracy", 0.2]; 
	_dude setSkill ["aimingSpeed", 0.5];
	_dude setSkill ["reloadSpeed", 0.1]; 
	_dude setSkill ["aimingShake", 0.2];
};

sleep 30;
if (true) exitwith {};