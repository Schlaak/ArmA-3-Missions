//will deactivate all crates (so AI wont shoot eachother etc)
//run post init
_crates = [] call IRN_fnc_getCrates;
{
	_crate = _x;
	{
		_x enableSimulationGlobal false;
	} forEach _crate;
} forEach _crates;