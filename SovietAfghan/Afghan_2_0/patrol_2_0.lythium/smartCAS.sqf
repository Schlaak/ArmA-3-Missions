_pilot = _this select 0;
IRN_fnc_orderCAS = {
	
	params[
		["_target",objNull,[objNull]]
	];
	_types = [
		"CBA_B_InvisibleTargetVehicle",
		"CBA_B_InvisibleTarget",
		"CBA_B_InvisibleTargetAir"
	];

	_dummy = objNull;
	{
		_dummy = createVehicle [_x ,getPos _target];
		createVehicleCrew _dummy;
	} forEach _types;

	hint str [_dummy, getPos _dummy];
	for "_i" from 0 to count (waypoints (group IRN_cas_plane)) do {
		deleteWaypoint [group IRN_cas_plane, 0];
	};
	systemChat ("cas ordered on :" + str [typeOf _target,(getPos _target) apply {round (_x /1000)}]);
	_wp = (group IRN_cas_plane) addWaypoint [getPos _dummy, 0, 0, "CAS"];
	_wp setWaypointType "Destroy";	 //dont work always??
};

IRN_cas_plane = _pilot;
(vehicle _pilot) removeWeaponGlobal "CUP_Vacannon_GSh302K_veh";
while {IRN_cas_plane isEqualTo _pilot} do {
	systemChat str (waypoints (group _pilot)) apply {waypointType _x + " : " + waypointName _x};
	{
		//if (_x isKindOf "CBA_B_InvisibleTargetVehicle") then {
			_pilot reveal [_x,4];
		//} else {
		//	(group _pilot) forgetTarget _x; //only see cas invisible targets, ignore all else.
		//};

		
	} forEach allUnits;
	systemChat("targets: " + str ((_pilot targets [false, 30000, [west,sideEnemy]]) apply {typeOf _x}));

	sleep 2;
	
};
//["CUP_Vacannon_GSh302K_veh","CMFlareLauncher","CUP_Vmlauncher_S8_veh"]

[_this] spawn {
	if (!isServer) exitWith {};
	params ["_tent"];
	irn_heal = true;
	while {irn_heal} do {
		{
			[_x] call ACE_medical_treatment_fnc_fullHealLocal;
		} foreach allPlayers select {_x distance _tent < 20};
		sleep 10;
	}
}
