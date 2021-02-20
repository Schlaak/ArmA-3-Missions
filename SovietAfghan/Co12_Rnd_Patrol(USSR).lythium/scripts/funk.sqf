_sound1 = selectRandom ["Call1","Call2","Call3","Call4","Call5"];
_sound2 = selectRandom ["CPu1","CPu2","CPu3","CPu4","CPu5","CPu6","CPu7"];
_sound3 = selectRandom ["CP1","CP2","CP3","CP4","CP5","CP6","CP7","CP8","CP9","CP10","CP11"];
[player,_sound1]remoteExec ["say3d", 0, true];
[player,_sound2]remoteExec ["say3d", 0, true];
[player,_sound3]remoteExec ["say3d", 0, true];