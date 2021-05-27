// ************************************************************************
// *** Begin JBOY Molotov Init commands
//glTosser = "logic" createVehicle [0,0,0];
// Compile JBOY general utility scripts
JBOY_soundLoop = compile (preprocessFileLineNumbers "JBOY_MOLO\JBOY_soundLoop.sqf");
// Compile JBOY_Molotov related scripts
JBOY_scream = compile (preprocessFileLineNumbers "JBOY_MOLO\JBOY_scream.sqf");
//JBOY_throw = compile (preprocessFileLineNumbers "JBOY_throw.sqf");
//JBOY_throw2 = compile (preprocessFileLineNumbers "JBOY_throw2.sqf");
JBOY_createFire = compile (preprocessFileLineNumbers "JBOY_MOLO\JBOY_createFire.sqf");
JBOY_moduleEffectsFire = compile (preprocessFileLineNumbers "JBOY_MOLO\JBOY_moduleEffectsFire.sqf");

// this global var needed by one of the molotov scripts
G_OBJ_AWAY = "Land_Screwdriver_V1_F" createvehicle [0,0,0];

// ************************************************************************
//player addEventHandler ["fired",{if (_this select 4 == "GrenadeHand") then
// {dmy=[nearestObject [_this select 0, "GrenadeHand"], "Land_Screwdriver_V1_F", _this select 0] execvm "JBOY_throw.sqf";}}];
// player addEventHandler ["fired",{if (_this select 4 == "GrenadeHand") then {dmy=[nearestObject [_this select 0, "GrenadeHand"], "Land_Screwdriver_V1_F", _this select 0] execvm "JBOY_MOLO\JBOY_molotov.sqf";}}];
//nopop = true;

// using smokeShellPurple as objects to throw that are replaced with molotovs
{player addmagazine "smokeShellPurple"} foreach [1,1,1,1,1,1,1];
{aiDude addmagazine "smokeShellPurple"} foreach [1,1,1,1,1,1,1];


// ************************************************************************
// Attach fire to something
// ************************************************************************
gMoloAction  = player addAction ["Throw Molotov", {player addMagazine "smokeShellPurple"; player forceWeaponFire ["smokeShellPurpleMuzzle","smokeShellPurpleMuzzle"];}];
gMoloAction2  = player addAction ["AI Throw Molotov", {aiDude addMagazine "smokeShellPurple"; aiDude forceWeaponFire ["smokeShellPurpleMuzzle","smokeShellPurpleMuzzle"];}];
gMoloAction3  = player addAction ["AI Throw Molotov", {molo addMagazine "smokeShellPurple"; molo forceWeaponFire ["smokeShellPurpleMuzzle","smokeShellPurpleMuzzle"];}];



player addEventHandler ["fired",{if (_this select 4 == "smokeShellPurple") then {[nearestObject [(_this select 0),"smokeShellPurple"], "Land_ButaneCanister_F", _this select 0 ] execvm "JBOY_MOLO\JBOY_molotov.sqf";}}];
aiDude addEventHandler ["fired",{if (_this select 4 == "smokeShellPurple") then {[nearestObject [(_this select 0),"smokeShellPurple"], "Land_ButaneCanister_F", _this select 0 ] execvm "JBOY_MOLO\JBOY_molotov.sqf";}}];

aiDude2 addEventHandler ["fired",{if (_this select 4 == "smokeShellPurple") then {[nearestObject [(_this select 0),"smokeShellPurple"], "Land_ButaneCanister_F", _this select 0 ] execvm "JBOY_MOLO\JBOY_molotov.sqf";}}];






