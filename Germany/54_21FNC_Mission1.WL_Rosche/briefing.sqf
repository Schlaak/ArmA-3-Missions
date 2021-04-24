_br = "<br></br>";
_font = "<font color='#00c818' size='15' face='LucidaConsoleB'>";
_font2 = "<font color='#c5c5c5' size='11' face='LucidaConsoleB'>";
_fontend = "</font>";
// =========================
// Briefing West
// =========================
if (side player == west) then {
	player createDiaryRecord ["Diary",["Durchführung",
	format ["%2
Durchbrechen Sie die VRV und sichten Sie die Position der ARtillierie.%1
Melden Sie diese Position.%1
Gegebenenfalls ist diese Position zu zerstören.%1
Anschließend begeben Sie sich in sichere Position und verlassen das Gebiet%1
	
	
%3",_br,_font2,_fontend]]];
	player createDiaryRecord ["Diary",["Auftrag",	
	format ["%2
Feindartillerie im Gebiet könnte zu schweren Verlusten führen.%1
Gegnerische Flugabwehr deckt den Korridor, derzeit keine Luftunterstützung möglich.%1
Ziel Ihres Trupps ist die Zerschlagung der Artilleriestellung.
		
%3",_br,_font2,_fontend]]];
	player createDiaryRecord ["Diary",["Eigene Lage",
	
	format ["%2
VRV wird auf Höhe Schliecksau und Rassau gehalten.%1
Kräfte erleiden große Verluste durch vorverlegte Feindartillerie.%1
Kampfzone im VRV ist heiß. Mech-Inf. und Panzertruppen der 6. und 4. Kompanie bekämpfen dort seit etwa einer Stunde den Feind.
	
	%3",_br,_font2,_fontend]
	]];
	player createDiaryRecord ["Diary",["Feindlage",
	format ["%2
Feindkräfte halten Gefechtslinie auf Höhe Wellendorf.%1
Durchbruchsmanöver auf Höhe Schlieckau konnten bisher vereitelt werden.%1
Feind hat schwere Artillerie in das Kampfgebiet verlegt.
		
		%3",_br,_font2,_fontend]
	
	]];
};
// =========================
// Briefing East
// =========================
if (side player == east) then {
	player createDiaryRecord ["Diary",["Briefingüberschrifft"," Briefingtext "]];
};