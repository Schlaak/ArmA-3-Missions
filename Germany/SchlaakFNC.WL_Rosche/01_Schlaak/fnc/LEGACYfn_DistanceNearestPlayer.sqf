/*
==========================================
Function to get distance to nearest player
==========================================




*/



//==========================================
//
//==========================================




/*

//grab all friendly players, sort by distance ascending then return nearest friendly player & distance

_friendlyPlayers = allPlayers select { !( _x isEqualTo player ) && { side group _x isEqualTo playerSide } } apply {[_x distance player,_x]};
_friendlyPlayers sort true;
if !( _friendlyPlayers isEqualTo [] ) then {
	_friendlyPlayers select 0 params[ "_nearestFriendlyPlayerDistance", "_nearestFriendlyPlayer" ];
	hint format[ "The nearest friendly is\n%1\nwho is\n%2m\naway at a heading of\n%3",
		name _nearestFriendlyPlayer,
		_nearestFriendlyPlayerDistance,
		player getDir _nearestFriendlyPlayer
	];
};
*/