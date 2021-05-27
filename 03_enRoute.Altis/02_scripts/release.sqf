_Taker=_this select 0;
_index=_this select 3;
_id=_this select 2;
_HVT =((attachedObjects _Taker) select 0);
detach _HVT;
 {[_HVT, _x] remoteExecCall ["disableCollisionWith", 0, _HVT]} foreach allplayers;
_HVT enableai "ANIM";
_HVT setunitpos "down";
[_HVT,["Zipup",40,1,false]] remoteExec ["say3D", 0, False];
_HVT setVectorUp surfaceNormal position _HVT;

[_HVT,""]   remoteExec ["switchmove", 0, true];
[_HVT,"Acts_ExecutionVictim_Kill_End"]   remoteExec ["switchmove", 0, true];
[_Taker, "acts_miller_knockout"]   remoteExec ["switchmove", 0, true];
_HVT disableai "ANIM";
_HVT enableSimulationGlobal false;
_HVT allowdamage true;
sleep 3;
_HVT disableAI "fsm";
[_HVT,"Acts_ExecutionVictim_KillTerminal"]   remoteExec ["switchmove", 0, true];
_HVT enableSimulationGlobal true;
_HVT enableai "ANIM";
_HVT disableAI "PATH";
_HVT disableAI "MOVE";
_HVT setcaptive true;

/*[_Taker, _HVT] spawn {
	sleep 3 + random 3;
	_Taker = _this select 0, _HVT = _this select 1;
	_snd = selectrandom ["RadioAmbient6","RadioAmbient2","RadioAmbient8"];

	 [_snd] remoteExec ["Playsound", 2, false];
	 _q = [_Taker, selectrandom ["Person gesichert!","Sicher!","Gesichert!"]];
	 _a = ["Einsatzleitung", selectrandom ["Verstanden!","Roger!","Somit!"]];
	 [[_q,_a], "SIDE", 0.2, true] execvm "02_scripts\fn_simpleConv.sqf";
};
*/


[0, {
		_HVT=_this select 0;
		[_HVT] joinsilent grpNull;
	}, [_HVT]] call CBA_fnc_globalExecute;
	removeallactions _HVT;
player removeaction _id;
sleep 1.5;
[_Taker, ""]   remoteExec ["switchmove", 0, true];
_name1 = name _HVT;
_name2 = name _Taker;
//_indexA = _taker addaction ["Meldung an Einsatzleitung","_meldung = true;"];
//_meldung = false;

sleep 3 + random 30;
_s1 = selectrandom [("ID:" + str _name1 + " gesichert!"),("ID:" + str _name1 + " sicher!"),("ID:" +  str _name1 + " festgesetzt!")];
_s2 = selectrandom ["Somit!","10-4!","10-4 und Klar!","Verstanden!"];
_taker sidechat _s1;
_taker sideradio "radio1";
sleep 2;
TOC sidechat _s2;



[L917_Captives,_HVT]   remoteExec ["pushback", 2, true];
missionNamespace setVariable ["L917_Captured", (missionNamespace getVariable ["L917_Captured", 0]) + 1, true];



