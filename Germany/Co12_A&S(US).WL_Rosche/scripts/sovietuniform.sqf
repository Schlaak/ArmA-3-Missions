diag_log ["sovietuniform.sqf called with", _this];
if (!isserver) exitWith {
	diag_log ["not server"];
};

private ["_items","_dude","_uniform"];

_dude = _this select 0;

_items = uniformItems _dude;
sleep 0.5;
removeUniform _dude;

_uniform = selectRandom ["cwr3_o_uniform_m1982_rolled_ttsko","cwr3_o_uniform_m1982_ttsko","cwr3_o_uniform_m1982_rolled_ttsko","cwr3_o_uniform_m1982_ttsko","cwr3_o_uniform_m1982_rolled_ttsko","cwr3_o_uniform_m1982_ttsko","cwr3_o_uniform_m1983_coverall_kzs"];
sleep 0.5;
_dude forceAddUniform _uniform;
sleep 0.5;
{
	_dude addItemToUniform _x
} foreach _items;