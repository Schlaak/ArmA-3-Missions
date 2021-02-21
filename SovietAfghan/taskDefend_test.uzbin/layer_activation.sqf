//activate a mission layer once global var is given
systemChat "layer activation waiting";
waitUntil {
	sleep 2;
	(missionNamespace getVariable ["layerOn",false])
};
systemChat "activating layer";
_layer = "AngryTown01";
_layerUnits = ((getMissionLayerEntities _layer) select 0) select {_x isKindOf "Man"};
_layerGroups = [];
systemChat str ["counted ",count _layerUnits," men in layer",_layer];
{
	//enable all units
	//show all units
	//collect groups
	_x enableSimulationGlobal true;
	_x hideObjectGlobal false;
	if (!(group _x in _layerGroups)) then {
		_layerGroups pushBack (group _x);
	}
} forEach _layerUnits;
systemChat str ["counted ",count _layerGroups," groups in layer"];
//sort layergroups so that smallest comes first
_layerGroups = [_layerGroups, [], {count units _x}, "ASCEND"] call BIS_fnc_sortBy;
{
	_grp = _x;
	_grp setBehaviour "SAFE";
	if (_forEachIndex == 0) then {
		//first group gets "search area indefinetly" order
		[_grp, [getPos leader _grp, 200, 200, 0, false],"UNCHANGED","NO CHANGE","LIMITED" ,"NO CHANGE","",[5,30,60]] call CBA_fnc_taskSearchArea;
		systemChat "area patrol";
	} else {
		[_grp ,getPos leader _grp, Random 150 + 100, Random 3 + 3, 0.2 ,0.2] call CBA_fnc_taskDefend;
		systemChat "area defense";
	};
} forEach _layerGroups;


