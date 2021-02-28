private["_maxDist","_lock","_num"];

_maxDist = _this select 0;
_lock = _this select 1;
_num = _this select 2;

_vehName = vehicleVarName player;
_variables = varHolder getVariable _vehName; //what?


if (isNil "_variables" && (headgear player) iskindof "cwr3_o_headgear_officer_cap_field") then
{
  settingsCAS = [_maxDist,_lock,_num,_vehName];
  varHolder setVariable [_vehName, settingsCAS, true];
  _str = format["<t color='#FF9000'>Open CAS Field System (%1)</t>",_num];
  player addAction [_str, "JWC_CASFS\casMenu.sqf", [_maxDist, _lock, _num], -1, false, true, ""];
}
else
{
  waitUntil {!isNull player};
  waitUntil {player == player};
  _vehName = vehicleVarName player;
  _variables = varHolder getVariable _vehName;
  _maxDist = _variables select 0;
  _lock = _variables select 1;
  _num = _variables select 2;
  if (_num < 1 && !((headgear player) iskindof "cwr3_o_headgear_officer_cap_field")) exitWith {};
  _str = format["<t color='#FF9000'>Open CAS Field System (%1)</t>",_num];
  player addAction [_str, "JWC_CASFS\casMenu.sqf", [_maxDist, _lock, _num], -1, false, true, ""];
};





