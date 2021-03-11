sleep 3;



_textformat = parseText "<t shadow = '1' size = '1.2' font='LucidaConsoleB' color='#00FF00'>";

_TextIntroduction = parseText "<t shadow = '1' size = '1.2' font='LucidaConsoleB' color='#00FF00'> S-17 PsyOps ist die Bezeichnung für die Missionen des PsyOpsPete ArmA 3 Servers.Hier befinden sich unsere in Kooperation entstandenen Missionen rund um ein 80´er bzw Anfang 90´er Setting in entweder 'Sowjet-Afghanstian' oder 'Kalter-Krieg auf Heißlauf' Missionen.";

_link = parseText "<a shadow = '1' size = '1.2' font='LucidaConsoleB' color='#00FF00' href='https://sites.google.com/view/s17-psyops/startseite'> https://sites.google.com/view/s17-psyops/startseite</a>";

_text = composeText [_TextIntroduction, linebreak, _link];


(format ["Hello %1, welcome to PsyOps-Pete´s Server", player]) hintC [ composeText [_TextIntroduction, linebreak, _link]];