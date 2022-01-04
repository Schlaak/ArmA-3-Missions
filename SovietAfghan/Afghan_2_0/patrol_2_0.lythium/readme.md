# Patrol framework
## managing routes
You can add, edit and remove any route you like. In the editor, got to layer: routes. There you find the sublayers. Each
sublayer HAS to start with "route_" and contain a marker of type "mil_start" (circle with arrow up). The markertext of this
marker defines the name of the route. names HAVE to be unique.

The amount of enemies depends on the amount of markers in a route. Around 2 markers per kilometer grid is a good number.
The overall density of enemies is controlled via the IRN_route_density value. for each marker there are between 0 to density value groups
spawned nearby, each with 1 to 8 soldiers. change the density with this command:
IRN_route_density = 0.1;

## Friendly HQs
The HQ Truck defines a friendly base. It will have the option to get a new patrol route and no enemies will spawn nearby it (500m).
This is dynamic, these trucks can be added anytime.

## Going on patrol
You can request a patrol route at any HQ Truck through the ACE action. If you call it again, a new, random route is assigned.
All enemies of the old route are deleted. Only your active route is visible in the map.