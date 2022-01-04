//define server wide parameters
IRN_route_density = 0.1;
irn_equip_stuff = [units template_group] call IRN_fnc_collectLoadout;
[] remoteExec ["IRN_fnc_goon_dust",0,true];
//TODO add "blow up" action to ammo crates for objective completion
//TODO build system that auto adds functionality to certain classes:
//crates have blowup action
//helper_01 produces smoke column
