//gets routes avaialbe to mission, from mission layer routes. each subfolder => one route.

//get all layers with route
_layers = getMissionLayers select {"route_" in _x};
//get markers as array
_layers = _layers apply {
	(getMissionLayerEntities _x) select 1;
};
//return
_layers