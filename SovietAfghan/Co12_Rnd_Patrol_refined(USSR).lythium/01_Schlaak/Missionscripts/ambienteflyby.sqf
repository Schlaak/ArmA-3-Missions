if (!isServer) exitWith {};

while {true} do
{
	_pos1 = selectrandom [[1815.6,450.945,0],[9293.91,2778.22,0],[10535.1,5043.43,0]];
	_pos2 = selectrandom [[-260.035,20831.2,0],[3868.19,20696.7,0],[8745.26,20773.5,0]];
	sleep 300 + (random 600);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
   sleep 1200 + (random 600);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 12 + (random 30);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 12 + (random 30);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 1200 + (random 600);
};
