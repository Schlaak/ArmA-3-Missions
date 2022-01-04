//will populate the position with enemy groups that go on patrol/camp/garrison
params[
	["_pos",[],[[]],[3]],
	["_density",1,[0]],	//x groups per call
	["_radius",500,[0]], //radius to spawn around pos
	["_order",[],[[]]]	//list of avaialible behaviour for group, enum: 0=patrol,1=garrison,2=camp, use default: []
	];
diag_log["populating units",_this];
if (!(_pos isEqualTypeParams [1,1,1])) exitWith {
	["position not in [x,y,z] given: "+ str _pos] call BIS_fnc_error;
};
if (_density <= 0) exitWith {
	["cant populate with density = "+str _density] call BIS_fnc_error;
};
if (_order isEqualTo []) then {
	_order = round(random 2);
};
_order = selectRandom _order;


//spawn random amount of groups at random positions.
	_amountGroups = (round(random[0,_density,2*_density]));
//	diag_log["density",_density," spawning: ",_amountGroups," groups."];
	_enemies = [];
	for "_i" from 0 to _amountGroups do {
		//get position in proximity to marker
		_blacklist = [] call IRN_fnc_getHQs;
		_pos = [[[_pos,_radius]],_blacklist] call BIS_fnc_randomPos;
		_pos = [_pos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;

		//spawn group	
		_grp = [_pos, independent, 8,[/*rel pos*/],[/*ranks*/],[/*skill*/],[/*ammo*/],[/*unit randomness*/1,0.5]] call BIS_fnc_spawnGroup;
		{
			[_x] call IRN_fnc_equip;	//dress up as taliban
		} foreach units _grp;
		_enemies = _enemies + units _grp;
		
		
		switch (_order) do {
			case 0: {
				[_grp,getPos (leader _grp),200,8,[],true] call lambs_wp_fnc_taskPatrol;
			};
			case 1: {
				[_grp, getPos (leader _grp), 50,[],true,false,-1,true] call lambs_wp_fnc_taskGarrison;
			};
			case 2: {
				[_grp, getPos (leader _grp), 50, [], true, true] call lambs_wp_fnc_taskCamp;
			};
			default {
				["unknown order for group."] call BIS_fnc_error;
			};
		};

	};
	//return
	_enemies