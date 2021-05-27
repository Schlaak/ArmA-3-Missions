// SFX

//SOUNDS

//RADIO
RadioAmbient2
RadioAmbient6
RadioAmbient8


QRF_Gendarmerie_report_Gendarme_A_Ahmeed_02_Processed
QRF_Gendarmerie_report_Gendarme_A_Ahmeed_01_Processed
QRF_Gendarmerie_report_Gendarme_A_02_Vincent_Processed
QRF_Gendarmerie_report_Gendarme_A_01_Vincent_Processed


oldman_ambient_dialogues_025_am_night_club_AMBCIVILIAN_5
oldman_ambient_dialogues_025_am_night_club_AMBCIVILIAN_4
oldman_ambient_dialogues_025_am_night_club_AMBCIVILIAN_2
oldman_ambient_dialogues_025_am_night_club_AMBCIVILIAN_3
oldman_ambient_dialogues_025_am_night_club_AMBCIVILIAN_1


incoming_3
incoming_2
incoming_1

Crowd_b		//wütend 9 sec
Crowd2		//normales chatter

combat_deafness

c_in1_20_broadcast_SPE_0
c_in1_20_broadcast_SPE_1
c_in1_21_broadcast_SPE_0
c_in1_21_broadcast_SPE_1
c_in1_22_broadcast_SPE_0
c_in1_22_broadcast_SPE_1
c_in1_23_broadcast_SPE_0

burning_car_loop2

Alarm_BLUFOR		//circa 5 sec

radio_track_01
radio_track_02
radio_track_03

WoundedGuyA_01
WoundedGuyA_02
WoundedGuyA_03
WoundedGuyA_04
WoundedGuyA_05
WoundedGuyA_06
WoundedGuyA_07
WoundedGuyA_08

WoundedGuyB_01
WoundedGuyB_02
WoundedGuyB_03
WoundedGuyB_04
WoundedGuyB_05
WoundedGuyB_06
WoundedGuyB_07
WoundedGuyB_08

WoundedGuyC_01
WoundedGuyC_02
WoundedGuyC_03
WoundedGuyC_04
WoundedGuyC_05

/*
Alarmspielender Lautsprecher per init
*/

//USE PITCH 0.5 or 0.8!!!
[this] spawn {
while {alive (_this select 0)} do {
[_this select 0,["Alarm_BLUFOR",500]] remoteExec ["say3d", 0, true];
sleep 15;
};};

crowd_b = 10 sec;

//funkstation
[this] spawn {
while {alive (_this select 0)} do {
[_this select 0,[(selectrandom ["RadioAmbient8","RadioAmbient6","RadioAmbient2"]),12]] remoteExec ["say3d", 0, true];

sleep 18;

};};