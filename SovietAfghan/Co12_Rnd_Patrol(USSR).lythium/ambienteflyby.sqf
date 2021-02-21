if (!isServer) exitWith {};

while {true} do
{
	_pos1 = selectrandom [[494.282,5638.31,0],[4543.74,5684.86,0],[9547.38,5777.95,0]];
	_pos2 = selectrandom [[2169.92,20625.9,0],[4985.92,20672.5,0],[6940.83,20672.5,0]];
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
