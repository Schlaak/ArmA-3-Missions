//transport multiple crates, one after the other.
sleep 15;
systemChat str ["queue supply orders."];

_crates = [crate_01,crate_02,crate_03,crate_04,crate_05];
while {count _crates > 0} do {
	//check if helo is availalbe.
	_heloReady = supply_helo_01 getVariable ["RTB",true];
	systemChat str ["helo ready:",_heloReady];
	if (_heloReady) then {
		_crate = _crates select 0;
		[[12378.5,17975.1,0],_crate,true] execVM "order_supply.sqf";
		_crates = _crates - [_crate];
		//systemChat str ["transporting: ",_crate," left over: ",_crates];
	};

	sleep 5;
};
//systemChat "all crates have been transported.";
