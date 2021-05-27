//<a href="marker:MarkerName">links</a>

_br = "<br></br>"; //%1%1
_font = "<font color='#00c818' size='15' face='LucidaConsoleB'>";
_font2 = "<font color='#c5c5c5' size='11' face='LucidaConsoleB'>";
_fontend = "</font>";
// =========================
// Briefing West
// =========================
if (side player == resistance) then {
player createDiaryRecord ["Diary",["Unterstützung",
	format ["%2
Artillerie:%1%1 
1 x 1 Artillerieschlag 3 Schuss MLRS, Rufzeichen Hephaeistus. Über Funk auf Abruf. Kanal Golf.%1%1

Luftnahunterstützung:%1%1
Sofern die Situation zu stark eskaliert verlegt ein AH-1 Helikopter, Rufzeichen: Harpy-69 in das Kampfgebiet. Funkkanal Foxtrot.%1%1

Exfiltration:%1%1
Bird-1 MH-6 Littlebird steht zur exfiltration auf Abruf. Funkkanal Juliett.%1%1

%1
%1%1




%3",_br,_font2,_fontend]]];
	player createDiaryRecord ["Diary",["Durchführung",
	format ["%2
<a href='marker:TGT0'>TGT-0</a> liegt tief im Feindgebiet.%1%1 
Gegen 0600 Ortszeit brechen Sie mit den Infantrietrupps 1-1 und 1-2 zu HP-1 in einer gepanzerten Kolonne auf.%1%1
Ab 06:30 sollten Sie nahe <a href='marker:TGT0'>TGT-0</a> angekommen sein und der Angriff kann erfolgen.%1%1

Nach klärung des Feindkontaktes beordern Sie 1-1 und 1-2 zurück und klären weiteren Verbleib von Waffenlagern. Achtung!%1
Spätestens dann ist mit feindlicher Verstärkung zu rechnen.%1%1

Sollten gegebene Mittel nicht reichen steht Ihnen eine Salve MLRS-Artillerie auf Abruf per Funk zur verfügung.


%3",_br,_font2,_fontend]]];
	player createDiaryRecord ["Diary",["Auftrag",
	format ["%2
Auftrag ist die klärung der Situation auf <a href='marker:TGT0'>TGT-0</a>. Und die Vernichtung militärischer Güter im Bereich.%1%1
%3",_br,_font2,_fontend]]];
	player createDiaryRecord ["Diary",["Spezifische Informationen",
	format ["%2
Sie können 1-1 und 1-2 den Angriff ausführen lassen oder diese zurück beordern.%1%1

Exfiltration erfolgt über Bird-1 auf standby, abruf per Funk.%1
Bedenken Sie dass Bird-1 circa 4-6 Minuten zum Ziel braucht.
	%3",_br,_font2,_fontend]
	]];
	player createDiaryRecord ["Diary",["Einsatzbeschreibung",
	format ["%2
Es haben sich kürzlich Informationen zu einem Waffenlager der ALF  nahe <a href='marker:TGT0'>Panagia (TGT-0)</a> ergeben.%1%1
Vermutung besteht dass es sich um das Warenhaus westlich des dorfes Handelt. <a href='marker:TGT0'>TGT-0</a> selbst ist wahrscheinlich von Aufständischen besetzt.

		%3",_br,_font2,_fontend]

	]];
};
// =========================
// Briefing East
// =========================
if (side player == east) then {
	player createDiaryRecord ["Diary",["Briefingüberschrifft"," Briefingtext "]];
};