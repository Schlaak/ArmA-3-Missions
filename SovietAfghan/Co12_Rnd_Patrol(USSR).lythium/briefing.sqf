if (player iskindof "cwr3_o_soldier_tl") then
{
	player createDiaryRecord ["Diary", ["Patrouille", "Die Männer sind angespannt. Niemand weiß was uns heute erwarten wird... Ich muss meine Befehle beim Offizier am Kommandoposten etwas Nord-Östlich der Zelte abholen. Besser ich schicke die Männer schon zur Ausrüstung. Ich habe jedem von Ihnen eine Liste der notwendigsten Ausrüstung gegeben."]];
	player createDiaryRecord ["Diary", ["Liste", "Wasser...<br/>AK-Munition<br/>Feldration<br/>Zusätzliche Verbände<br/>Zusätzliches Tourniquet<br/>"]];
} else {

	player createDiaryRecord ["Diary", ["Auftrag", "Der Сержант wird uns gleich unterweisen... wir haben eine kleine Liste bekommen..."]];
	player createDiaryRecord ["Diary", ["Liste", "Wasser...<br/>AK-Munition<br/>Feldration<br/>Zusätzliche Verbände<br/>Zusätzliches Tourniquet<br/>"]];
};