



/* FIXME
//Das hier ist das ursprüngliche Script aus Route.SQF



// Spawn goats;
_amountHostileGoatGroups = (random 8) + 5;
_goatpos = selectrandom [[158.656,11690.2,0],[187.046,11693.9,0],[217.538,11696.9,0],[245.625,11698.6,0],[164.926,11657.4,0],[193.316,11661.1,0],[223.808,11664,3.05176e-005],[251.895,11665.8,6.10352e-005],[170.463,11621.1,0],[198.853,11624.8,0],[229.345,11627.8,-3.05176e-005],[257.432,11629.5,0]];
for "_i" from 0 to _amountHostileGoatGroups do {
_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getcachePos;
[_goatpos,_spawnPos,10] execvm "scripts\shk_moveobjects.sqf";
};


*/
_goatsites = (synchronizedObjects RouteGoatLogic);

for [{_i=0}, {_i<8}, {_i=_i+1}] do
{
    //player globalChat format["%1",_i];
	_site = (_goatsites select _i);
	_spawnPos = [getMarkerPos (selectRandom _availableSpawnPosMarkers)] call _getcachePos;
	[_site,_spawnPos,2] execvm "scripts\shk_moveobjects.sqf";
};
//hint "worked";