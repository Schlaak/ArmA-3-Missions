if (!isServer) exitWith {};

while {true} do
{
	_pos1 = selectrandom [(getmarkerpos "ambfly"),(getmarkerpos "ambfly_1")];
	_pos2 = selectrandom [(getmarkerpos "ambfly_2"),(getmarkerpos "ambfly_3")];
	sleep 300 + (random 600);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_su25","cwr3_o_su25","cwr3_o_su25","CUP_O_MI6A_RU"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
   sleep 1200 + (random 600);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_su25","cwr3_o_su25","cwr3_o_su25"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 12 + (random 30);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_su25","cwr3_o_su25","cwr3_o_su25"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 12 + (random 30);
_heli = selectRandom ["cwr3_o_mi8_mtv3","cwr3_o_mi8_mev","cwr3_o_mi8_amt","cwr3_o_mi24v","cwr3_o_mi24p","cwr3_o_mi24d","cwr3_o_su25","cwr3_o_su25","cwr3_o_su25"];
[_pos1,_pos2, 250, "FULL",_heli , east] call BIS_fnc_ambientFlyby;
sleep 1200 + (random 600);
};
