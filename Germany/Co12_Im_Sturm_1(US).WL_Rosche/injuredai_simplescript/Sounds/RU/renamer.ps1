write-host Bitte geben Sie den Pfad der umzubenennenden Dateien an.
$PfadFuerDateien = read-host
write-host Bitte geben Sie die Dateiendung der umzubenennenden Dateien an.
$DateiEndungFuerDateien = read-host
write-host Bitte geben Sie den Präfix für die neuen Dateien an
$NeuerDateiName = read-host

write-host _________________________________________________________
#Get-ChildItem -Path $PfadFuerDateien\*.$DateiEndungFuerDateien -Name
$Dateien = Get-ChildItem -Path $PfadFuerDateien\*.$DateiEndungFuerDateien -Name
write-host _________________________________________________________
write-host Dateien:
Foreach ($EinzelDatei in $Dateien){
 $EinzelDatei
}

read-host

write-host _________________________________________________________
write-host Dateien:


$Nummerierung = 00
Foreach ($EinzelDatei in $Dateien){
 Rename-Item -Path $PfadFuerDateien\$EinzelDatei -NewName $NeuerDateiName"_"$Nummerierung.$DateiEndungFuerDateien
 $Nummerierung = $Nummerierung + 1
}
#
#Ende
read-host