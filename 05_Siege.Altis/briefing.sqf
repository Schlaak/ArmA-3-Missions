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
Insertierung auf <a href='marker:start'>LZ per Fastrope</a>. Gebiet sichern, verwundete stabilisieren und weitere Klärung auf <a href='marker:TGT1'>TGT-1</a> und <a href='marker:TGT2'>TGT-2</a> sobald Verstärkung vor Ort.


%3",_br,_font2,_fontend]]];
	player createDiaryRecord ["Diary",["Auftrag",
	format ["%2
Sie klären die Situation bei <a href='marker:TGT0'>TGT-0</a> <a href='marker:TGT1'>TGT-1</a> und <a href='marker:TGT2'>TGT-2</a>. Festsetzen und Feindkontakt neutralisieren.
Anschließend Exfiltration. Weitere Informationen per Funk duch TOC (Taktische Operations Zentrale), Rufzeichen 'Hekate'.
%3",_br,_font2,_fontend]]];
	player createDiaryRecord ["Diary",["Spezifische Informationen",
	format ["%2
Weitere Kräfte sind von Nord-Ost unterwegs.
	%3",_br,_font2,_fontend]
	]];
	player createDiaryRecord ["Diary",["Einsatzbeschreibung",
	format ["%2
Vor 10 Minuten wurde ein Konvoy in Sofia, designiert <a href='marker:TGT0'>TGT-0</a> angegriffen. Sie bilden die QRF.
		%3",_br,_font2,_fontend]

	]];
};
// =========================
// Briefing East
// =========================
if (side player == east) then {
	player createDiaryRecord ["Diary",["Briefingüberschrifft"," Briefingtext "]];
};