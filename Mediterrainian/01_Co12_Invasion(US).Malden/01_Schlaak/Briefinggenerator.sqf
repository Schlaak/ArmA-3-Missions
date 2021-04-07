/*
Description:
Script will generate a personal backgroundstory for players
build with these local variables provided below.

use from initplayerlocal.sqf
*/

//if (isserver) exitwith {};

_satz1 = selectRandom [""];

_satz2 = selectRandom [""];

_satz3 = selectRandom [""];

_satz4 = selectRandom [""];

_satz5 = selectRandom [""];

_satz6 = selectRandom [""];

// Geboren in
_Ort = selectRandom ["Qysylorda", "Vorort von Qysylorda", "Orenburg","Tscheljabinsk","nahe Tscheljabinsk","Tjumen", "Woronesch", "einem kleinen Ort nahe Woronesch", "Saratow","Omsk", "Karaganda, Kasachstan","Novosibirsk","einem Dorf östlich von Novosibirsk","Moskau","Nischini Nowgorod", "Bei Nowgorod","Wolgograd","Leningrad","Archangelsk","Murmansk","Hafenstadt bei Murmansk","Kleinstadt in Kasachstan","Hafenstadt bei Archangelsk","Dorf westlich von Moskau","Dorf im Ural","Uralgebirge"];
//Aufgewachsen als
_kindheit = selectRandom ["Waisenkind","Sohn eines Offiziers beim VDV","Arbeiterkind","verwahrlostes Kind aus ärmlichen verhältnissen","Sohn eines Milizionärs","Fleischersohn","Sohn eines Chiropraktikers","Tischerlsohn","Schreinersohn","Straßenkind","Jungpionier"];

//sah es so aus als würde er eigentlich X werden
// Karriere als
_Karriere = selectRandom ["Fleischer","Busfahrer","Milizionär","Tagebauarbeiter","Gopnik","Fabrikarbeiter","Schlosser","Arzthelfer","Schreiner","Tischler","Verwaltungsangestellter","Offizier beim VDV",""];

_Jugend0 = selectRandom ["Bis er 8 war","Bis er 12 war","Als er klein war","In seinen Kindheitsjahren","In seiner Kindheit"];
//In seiner Kindheit 
//In seinen Kindheitsjahren 
//Als er klein war
//Bis er 12 war
//Bis er 8 war
_Jugend = selectRandom ["litt er unter den Alkoholproblemen seines Vaters.", "war er ein stilles Kind und hatte Anpassungsschwierigkeiten","war er immer sehr engargiert aber konnte sich nie ganz etablieren","musste er schon viel für sein Alter erledigen","lebte er bei seinen Großeltern","verbrachte er sein Leben im örtlichen Waisenhaus","trieb er sich viel auf der Straße herum","wurde er regelmäßig hart von seinen Erziehern geknechtet"];
//
_Militaer = selectRandom ["Wie die meisten anderen kam er als Wehrpflichtiger zum Militär","Als Rekrut durch gute Leistungen aufgefallen, blieb er beim Militär","Um seinen Problemen zu entfliehen blieb er beim Militär","Angesichts der Ausweglosigkeit in der Zivilgesellschaft blieb er beim Militär","Hatte keine andere Wahl als seine Laufbahn beim Militär zu gehen, da ihn in seinem Heimatort sonst eine Haftstrafe drohen würde","Saß zwei Jahre in einem Gefängnis in Kasachstan und meldete sich straflindernd zum Militär","Wollte offizier werden und blieb beim Militär", "Einst überzeugt vom internationalen Kommunismus entschied er sich für die rote Armee...","Wenigstens gab es bei der Infantrie genug zu Essen, also blieb er beim Militär"];
//Grund für die verlegung nach Afghanistan
_afghanistan = selectRandom ["Wurde er wegen Ungehorsam strafversetzt","Wurde er durch Offizier strafversetzt","Wurde er nach Afgahnistan strafversetzt wegen Diebstahl","Schon immer etwas auffällig wurde er wegen politischer desintegrität strafversetzt","Hat sich freiwillig für den einsatz gemeldet","Wurde durch empfehlung nach Afghanistan versetzt"];
//Psychologisches Profil:
_Charakter1 = selectRandom ["Rechtschaffend und gutherzig","Sehr moralisch","Ambitionierter Idealist","Gewissenhaft aber distanziert","Moralisch aber gehorsam","Diszipliniert und moralisch","Folgt guten Intentionen auch wenn er das Falsche dafür tun muss","Moralisch flexibel, aber mit guten Intentionen","Würde für einen guten Zweck jeden töten","Hat gute Moral und ist sehr bemessen","Distanziert und Moralisch","Nachdenklich und Rechtschaffend","Sehr distanziert","etwas appart","Folgt nur befehlen, hat keine Moral","sehr einfache person ohne moralisches Gewissen","Undiszipliniert","Folgt eher seiner eigenen Agenda","Auffällig und hinterfragt zu viele Befehle","Sehr ambitioniert und moralisch, folgt aber seiner eigenen Agenda","Gute Moral aber hoher Egoismus","Will das beste, aber meist für sich...","Würde alles tun...","Desinteressiert und unmoralisch","Ihn interessiert nicht was er tut, er sieht nur den Nutzen","Unruhestifter","Versucht seine Truppe zu untergraben","zerstörerischer Charakter"];
_br = "<br></br>";
_font = "<font color='#ffa716' size='11' face='TahomaB'>";
_fontend = "</font>";
player createDiaryRecord ["Diary", ["Biographie und Charakter", format ["%10 Geboren in:%11%9
%1 %9
%10 Aufgewachsen als:%11%9
%2. %9
%10 Früherer Beruf: %11%9
%3. %9%9
%4 %5.%9
%9
%10 Militärische Laufbahn:%11%9
%6. %9
%10 Grund für die Versetzung nach Afghanistan:%11%9 %7.%9
%10 Am besten beschreibt sich sein Charakter als:%11%9%8",_Ort,_kindheit,_Karriere,_jugend0,_Jugend,_Militaer,_afghanistan,_Charakter1,_br,_font,_fontend]]];

