//gets crates/points of intereset avaialbe to mission, from mission layer routes. each subfolder => one POI.

//get all layers with route
_layers = getMissionLayers select {"p_o_i_" in _x};
//get objects as array
_layers = _layers apply {
	(getMissionLayerEntities _x) select 0;
};
//sort out empty layers
_layers = _layers select {!(_x isEqualTo [])};
diag_log["############### crates are: ",_layers];
//return
_layers