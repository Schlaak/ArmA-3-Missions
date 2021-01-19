_array = [[1,1,1],[2,2,2],[3,3,3],[4,4,4]];
for "_i" from 0 to count _array do {
	_pos = selectRandom _array;
	_array = _array - [_pos];
	hint str _array;
};

