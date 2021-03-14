/*
	Author: IR0NSIGHT

	Description:
	Get direction from point a to point b

	Parameter(s):
		0 :
			POSITION - a
		1 :
			POSITION - b
	Returns:
	normalized direction.
*/
_p = params [
	["_from",[],[[]],[3]],
	["_to",[],[[]],[3]]
];
if (!_p) exitWith {};
_dir = vectorNormalized (_to vectorDiff _from);
_dir

