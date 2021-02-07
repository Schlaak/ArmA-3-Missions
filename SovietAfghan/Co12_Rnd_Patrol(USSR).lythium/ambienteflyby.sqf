if (!isServer) exitWith {};

while {true} do
{
	sleep 300 + (random 600);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[[7874.61,9324.13,0], [20.5469,20485.2,0], 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
   sleep 1200 + (random 600);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[[7874.61,9324.13,0], [20.5469,20485.2,0], 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 12 + (random 30);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[[7874.61,9324.13,0], [20.5469,20485.2,0], 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 12 + (random 30);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p","cwr3_o_mi24p"];
[[7874.61,9324.13,0], [20.5469,20485.2,0], 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 1200 + (random 600);
};
