params ["_unit","_target"];
while {alive _unit} do {
	_unit reveal [_target,4];
	_unit doTarget _target;
//	_unit doSuppressiveFire _target;
	_unit doFire _target;
	diag_log ["unit",_unit, " firing at ",_target];

//	_aimingQuality = _unit aimedAtTarget [_target];
//	if (_aimingQuality > 0.5) then {
//		
//		_hanlde = _unit fireAtTarget [_target];
//		
//	};
	sleep 1;
}