//returns all friendly HQ positions + 500m radius: [pos,500].
_hqCars = allMissionObjects "cwr3_o_ural_hq";
_hqCars = _hqCars apply {[getPos _x,500]};
//return
_hqCars