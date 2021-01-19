//Generelle Infos: Einheit wird automatisch durch script ausgetattet (ausser rucksack) und hat begrenzt Munition (kann im Gurtanzahl var iable eingestell werden). Einheit ist gedacht für stationäres MG nest im Wald bis 400 m sichtweite. Schiesst nur bei direktem Sichtkontakt, erste salve geht normalerweise in den Boden. Die einheit bewegt sich nciht und spottet bei direktem sichtkontakt den gegner instant, beschiesst auch sofort. Hört sich overpowered an, allerdings schiesst die MG einheit extrem ungezielt und als "MG nest" soll sie ja auch überwachen, das instant spotten bei sichtkontakt ist also vollkommen realisitsch (ausser für ghillies vllt). Einheit sollte nicht alleine sondern mit 2-3 weiteren standard KIs platziert werden (muss aber nicht). Kann nur auf vorplatzierte Einheiten aus dem editor angewendet werden, ZEUS unterstützung kommt vllt in der zukunft
//befehl für einheiten init: null = [this] execVM "03_scriptsammlung\Ir0nsight\unterdruck_middle.sqf";


_unit = _this select 0;
//_unit globalchat "Script gestartet, Loadout wird erstellt";
//Stellt einheit auf "Nicht feuern", damit nicht vanilla gefeuert wird sondern nur durch geskriptetes forceWeaponFire
_unit setVariable ["lambs_danger_disableAI",true];
_unit setCombatMode "BLUE";
_unit disableAI "path";
_unit setunitpos "middle";

//Loadout
/*
removeUniform _unit;
_unit forceadduniform selectRandom
	[
	"U_IG_Guerilla3_2",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla1_1",
	"U_OG_Guerilla2_1",
	"U_C_Poor_2",
	"U_C_Poor_1",
	"U_BG_Guerilla2_2",
	"LOP_U_CHR_Citizen_01",
	"LOP_U_CHR_Citizen_02",
	"LOP_U_CHR_Citizen_03",
	"LOP_U_CHR_Citizen_04",
	"LOP_U_CHR_Citizen_05",
	"LOP_U_CHR_Citizen_06",
	"LOP_U_CHR_Citizen_07",
	"LOP_U_CHR_Villager_01",
	"LOP_U_CHR_Villager_02",
	"LOP_U_CHR_Villager_03",
	"LOP_U_CHR_Villager_04",
	"LOP_U_CHR_Profiteer_01",
	"LOP_U_CHR_Profiteer_02",
	"LOP_U_CHR_Profiteer_03",
	"LOP_U_CHR_Profiteer_04",
	"LOP_U_CHR_Woodlander_01",
	"LOP_U_CHR_Woodlander_02",
	"LOP_U_CHR_Woodlander_03",
	"LOP_U_CHR_Woodlander_04",
	"LOP_U_CHR_Woodlander_05",
	"LOP_U_CHR_Woodlander_06",
	"LOP_U_CHR_Worker_01",
	"LOP_U_CHR_Worker_02",
	"LOP_U_CHR_Worker_03",
	"LOP_U_CHR_Worker_04",
	"LOP_U_CHR_Worker_05",
	"LOP_U_CHR_Worker_06",
	"LOP_U_CHR_Worker_07"
	];

removeVest _unit;
_unit addVest selectRandom
*/
//	[
	/*
	unbenutze Westen
	"V_TacVestCamo_khk",
	"V_TacVest_oli",
	"V_TacVest_khk",
	"V_TacVest_camo",
	"V_TacVest_brn",
	"V_TacVest_blk",
	"rhs_6sh92",
	"rhs_6sh92_vog",
	"rhs_6sh92_digi",
	"rhs_6sh92_digi_vog",
	"rhs_6sh46",
	*/
	//aktive Westen
	/*
	"V_HarnessOSpec_gry",
	"V_HarnessOSpec_brn",
	"V_HarnessOGL_gry",
	"V_HarnessOGL_brn",
	"V_HarnessO_gry",
	"V_HarnessO_brn",
	"V_Chestrig_rgr",
	"V_Chestrig_oli",
	"V_Chestrig_khk",
	"V_Chestrig_blk",
	"V_BandollierB_rgr",
	"V_BandollierB_oli",
	"V_BandollierB_khk",
	"V_BandollierB_cbr",
	"V_BandollierB_blk",

	"v_chestrig_oli",
	"v_chestrig_khk",
	"v_chestrig_rgr",
	"v_chestrig_blk",
	"rhsgref_chestrig"
	];
//
removeHeadgear _unit;
	_unit addHeadgear selectRandom
	[
	"",
	"H_shemag_olive",
	"H_Bandanna_sgg",
	"H_Bandanna_khk",
	"H_Bandanna_gry",
	"H_Bandanna_cbr",
	"H_Bandanna_camo",
	"LOP_H_Pakol",
	"LOP_H_Beanie_Tan",
	"LOP_H_Shemag_red2",
	"LOP_H_Shemag_red1",
	"LOP_H_Ushanka",
	"LOP_H__villager_cap",
	"LOP_H__worker_cap",
	"rhs_beanie_green",
	"rhs_xmas_antlers",
	"rhs_beanie",
	"h_cap_blu",
	"h_cap_green",
	"h_cap_tan",
	"h_cap_red",
	"rds_woodlander_cap1",
	"rds_woodlander_cap2",
	"rds_woodlander_cap3",
	"rds_woodlander_cap4",
	"rds_villager_cap1",
	"rds_villager_cap2",
	"rds_villager_cap3",
	"rds_villager_cap4",
	"rds_worker_cap1",
	"rds_worker_cap2",
	"rds_worker_cap3",
	"rds_worker_cap4"

	];

_unit linkItem "ItemMap";
_unit linkItem "ItemWatch";
_unit setSpeaker selectRandom [
"rhs_male01rus",
"rhs_male02rus",
"rhs_male03rus",
"rhs_male04rus",
"rhs_male05rus",
"rhs_male06rus"
];

*/
//Klassenauswahl
/*
_Klasse = selectRandom ["LMG","HMG"];
if (_Klasse == "Sturm") then //nicht aktiv im moment, zum aktivieren " "Sturm", " in random auswahl der klasse hinzufügen
{
	//Waffe mit Magazinen
	  	_unit addWeapon "hlc_rifle_ak47";
	   	for "_i" from 1 to 4 do {_unit addItemToVest "hlc_45Rnd_762x39_m_rpk";};
	//Granaten
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
	   	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
	//Festzulegende Variablen
		_Gurtlaenge = selectRandom [30]; //Anzahl Patronen im GUrt/Magazin
		_Gurtanzahl = 10; //Anzahl der Gurte die Schützen zur Verfügung stehen
		_reloadTime = 0.09; //Kadenz (Feuerrate) der Waffe, dh: sekunden pro schuss. PKM 0,092;PKP Pecheneg 0,075 MG3 0,05; MG42 0,03
		_burstLength = selectRandom [3,5,7,10];//Länge des jeweiligem Feuerstoßes


};

if (_Klasse == "LMG") then
{
	//Waffe mit Magazinen
    	_unit addWeapon "hlc_rifle_rpk74n";
    	for "_i" from 1 to 4 do {_unit addItemToVest "hlc_60Rnd_545x39_t_rpk";};
	//Granaten
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
    	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};

	//Festzulegende Variablen
		_Gurtlaenge = selectRandom [30,40,75,100]; //Anzahl Patronen im GUrt/Magazin
		_Gurtanzahl = 10; //Anzahl der Gurte die Schützen zur Verfügung stehen
		_reloadTime = 0.1; //Kadenz (Feuerrate) der Waffe, dh: sekunden pro schuss. PKM 0,092;PKP Pecheneg 0,075 MG3 0,05; MG42 0,03
		_burstLength = selectRandom [3,5,7,10,15];//Länge des jeweiligem Feuerstoßes

};

if (_Klasse == "HMG") then
{
	 //Items in Weste
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_100Rnd_762x54mmR_green";};
		_unit addWeapon "rhs_weap_pkm";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";
	//Granaten

	//Festzulegende Variablen
		_Gurtlaenge = selectRandom [50,100,150,200]; //Anzahl Patronen im GUrt/Magazin
		_Gurtanzahl = 10; //Anzahl der Gurte die Schützen zur Verfügung stehen
		_reloadTime = 0.09; //Kadenz (Feuerrate) der Waffe, dh: sekunden pro schuss. PKM 0,092;PKP Pecheneg 0,075 MG3 0,05; MG42 0,03
		_burstLength = selectRandom [3,5,7,10,15,20];//Länge des jeweiligem Feuerstoßes

};
*/

_Gurtlaenge = selectRandom [50,100,150,200];
_Gurtanzahl = 10;
_reloadTime = 0.09;
_burstLength = selectRandom [3,5,7,10,15,20];
_SchussCounter = 0; //Zählt Schüsse um realistisches Nachladen zu ermöglichen
_GurtCounter = 0; //Zählt Munitions Gurte um maximale Munitionsmenge festzulegen, unabhängig vom Schützeninventar
_geladen = false;
_zielgueltig = false;
_ZielControl = 0;
_magazineClass = currentMagazine _unit;

while {alive _unit} do
{
	if (_geladen) then //Waffe geladen, Ziele verfügbar ? wird geprüft
	{
		//_unit globalChat "Waffe geladen, prüfe verfügbare Ziele";
		if ((_zielgueltig)) then //ab hier gültiges _Ziel gefunden,Sichtkontakt wird geprüft
		{


		}
		else //Zielsuche
		{
			_enemySides = [side _unit] call BIS_fnc_enemySides;
			_radius = 150;
			_nearEnemies = allUnits select {_x distance _unit < _radius AND side _x in _enemySides};
			_ZielControl = count _nearEnemies;
			//_unit globalchat format ["%1",_ZielControl];
			if (_ZielControl >= 1) then //Kontrolliert ob Ziele gefunden wurden, nur dann wird _Ziel ausgewählt
			{
				_Ziel = selectRandom _nearEnemies;
				//_unit globalchat format ["%1",_Ziel];
				//_unit globalchat format ["%1",_nearEnemies];
				//_unit globalchat format ["%1",_ZielControl];
				//_unit globalChat "Ziele verfügbar, prüfe Sichtkontakt"; //_unit globalchat format ["%1",_Ziel];
				_insSurface = lineIntersectssurfaces [eyepos _unit, eyePos _Ziel, _unit, _Ziel, false,1,"VIEW","FIRE",true];//gibt aus: Oberflächen die zwischen _Ziel und Schütze sind
				_countINSSurface = count _insSurface; //ist > 0 wenn Oberflächen zwischen Schütze und _Ziel
				if (_countInsSurface < 1 ) then //Sichtkontakt besteht, Feuer wird ausgelöst
				{
					//_unit globalchat "Sichtkontakt";
					//_unit globalchat format ["%1",_SchussCounter];
					//_unit globalchat format ["%1",_Ziel];
					//Befiehlt der Einheit auf gewähltes _Ziel zu zielen
					_unit doTarget _Ziel;
					_unit lookAt (getPos _Ziel);
					_unit doWatch (getPos _Ziel);
					//Schiessbefehl
					for "_i" from 0 to _burstLength do //wird pro gelöstem Schuss einmal durchgeführt
					{
						_unit doTarget _Ziel;
						_unit lookAt (getPos _Ziel);
						_unit doWatch (getPos _Ziel);
						_currentWeapon = currentWeapon _unit;
						_weaponModes = getArray (configFile/"CfgWeapons"/_currentWeapon/"modes");
						_desiredWeapon = _weaponModes select 0;
						_unit forceWeaponFire [_currentWeapon,_desiredWeapon];
						// reloadTime here
						sleep _reloadTime;
						_unit setWeaponReloadingTime [_unit,_currentWeapon,0]; //zwingt geskriptete Kadenz der jeweils ausgewählten waffe auf
						_unit setVehicleAmmo 1; //unendlich munition mit 1
						_SchussCounter = _SchussCounter +1;
						//_unit globalchat format ["%1",_SchussCounter];
						if (_SchussCounter == _Gurtlaenge) then
						{
							_geladen = false
						};
					};
				};
			};
		};
	}
	else //Nachladescript -> lädt nach
	{
		//_unit say3D "russian1";
		//_unit globalchat "MG lädt, Gurt:";
		//_unit globalchat format ["%1",_GurtCounter];
		_unit addItemToBackpack _magazineClass;
		reload _unit;
		_GurtCounter = _GurtCounter +1;
		_SchussCounter = 0;
		_geladen = true; //setzt _geladen als true
		//_unit globalchat "MG _geladen";
		sleep 5;
	};
sleep 1;
};
sleep 1;