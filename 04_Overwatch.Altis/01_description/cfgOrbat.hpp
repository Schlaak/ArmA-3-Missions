class CfgORBAT
{
	class AAFAltisStratCom
	{
		//id =1;
		//idType =0;
		side = "Resistance";
		size = "Army";
		type = "HQ";
		insignia = "\A3\Data_F\Flags\flag_AAF_CO.paa";
		//colorInsignia[] = {};
		commander = "Ekadlidis Haegaesias";
		commanderRank = "General";
		tags[] = {};
		text = "AAF Zentralverwaltung für strategische Operationen";
		textShort = "AAF Strat.Op.Zt.Verw. Altis";
		//texture = "";
		//color[] = {};
		description= "Zentralverwaltung für strategische Operationen auf Altis, Stratis und Malden. Zuständigkeit über alle regulären Divisionen der AAF.";
		assets[] = {};

		//subordinates[] = {AAF1Div
		class AAFGroundForces {
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "ArmyGroup";
			type = "Unknown";
			text = "AAF Bodentruppen";
			textShort = "Bodentruppen";
			description= "Bodentruppenteil der AAF.";

				class AAF1 {
				id =1;
				idType =1;
				side = "Resistance";
				size = "Regiment";
				type = "MechanizedInfantry";
				//insignia = "Major";
				//colorInsignia[] = {};
				//commander = "";
				//commanderRank = "";
				//tags[] = {};
				text = "%1 %2 %3";
				textShort = "%1 Mech.Inf. Reg.";
				//texture = "";
				//color[] = {};
				description= "Erstes Mechanisiertes Regiment der AAF.";
				//assets[] = {};
				//subordinates[] = {};
				};
				class AAF2 {
				id =2;
				idType =1;
				side = "Resistance";
				size = "Regiment";
				type = "MechanizedInfantry";
				//insignia = "Major";
				//colorInsignia[] = {};
				//commander = "";
				//commanderRank = "";
				//tags[] = {};
				text = "%1 %2 %3";
				textShort = "%1 Mech.Inf. Reg.";
				//texture = "";
				//color[] = {};
				description= "Zweites Mechanisiertes Regiment der AAF.";
				//assets[] = {};
				//subordinates[] = {};
					class AAF2_1 {
						side = "Resistance";
						size = "Battalion";
						type = "MechanizedInfantry";
						text = "1. Battalion";
						textShort = "1 Bat.";
						description = "";

					};
					class AAF2_2 {
						side = "Resistance";
						size = "Battalion";
						type = "MechanizedInfantry";
						text = "2. Battalion";
						textShort = "2. Bat.";
						description = "";
											class AAF2_2_1 {
						side = "Resistance";
						size = "Company";
						type = "MechanizedInfantry";
						text = "1. Kompanie";
						textShort = "1. Komp.";
						description = "";

					};
																class AAF2_2_2 {
						side = "Resistance";
						size = "Company";
						type = "MechanizedInfantry";
						text = "2. Kompanie";
						textShort = "2. Komp.";
						description = "";

					};
																class AAF2_2_3 {
						side = "Resistance";
						size = "Company";
						type = "MotorizedInfantry";
						text = "3. Kompanie";
						textShort = "3. Komp.";
						description = "";

					};
					class AAF2_3 {
						side = "Resistance";
						size = "Battalion";
						type = "Armored";
						text = "3. Battalion";
						textShort = "3. Bat";
						description = "";

					};
				};
				};
				class AAF3 {
				id =3;
				idType =1;
				side = "Resistance";
				size = "Brigade";
				type = "Armored";
				//insignia = "Major";
				//colorInsignia[] = {};
				//commander = "";
				//commanderRank = "";
				//tags[] = {};
				text = "%1 %2 %3";
				textShort = "%1 Panz. Brig.";
				//texture = "";
				//color[] = {};
				description= "Dritte Gepanzerte Brigade der AAF.";
				//assets[] = {};
				//subordinates[] = {};
				};
				class AAF4 {
				id =4;
				idType =1;
				side = "Resistance";
				size = "Battalion";
				type = "Airborne";
				//insignia = "Major";
				//colorInsignia[] = {};
				//commander = "";
				//commanderRank = "";
				//tags[] = {};
				text = "%1 %2 %3";
				textShort = "%1 LL. Bat.";
				//texture = "";
				//color[] = {};
				description= "Viertes Luftlande-Battalion der AAF.";
				//assets[] = {};
				//subordinates[] = {};
				};
							class AAF5 {
				id =5;
				idType =1;
				side = "Resistance";
				size = "Battalion";
				type = "GeneralSupport";
				text = "%1 %2 %3";
				textShort = "%1 Ust. Bat.";
				description= "Fünftes allgemeines Unterstützungs-Battalion der AAF.";
				};
							class AAF6 {
				id =6;
				idType =1;
				side = "Resistance";
				size = "Company";
				type = "Recon";
				text = "%1 %2 %3";
				textShort = "%1 Aufkl. Komp.";
				description= "Sechste Aufklärungs-Kompanie der AAF.";
				};
			};
		class AAFNavy {
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "ArmyGroup";
			type = "Maritime";
			text = "AAF Marine";
			textShort = "Marine";
			description= "Marinestreitkräfte der AAF.";
		};
		class AAFAirforce
			{
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "ArmyGroup";
			type = "Airborne";
			text = "AAF Airforce";
			textShort = "Luftwaffe";
			description= "Luftwaffe der AAF.";
		};
		class AAFExpForce
			{
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "Brigade";
			type = "Attackrecon";
			text = "AAF Expeditionsstreitkräfte";
			textShort = "AAF Exp.Frc.";
			description= "Expeditionsstreitkräfte der AAF.";
			 class AAFSAS
			{
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "Squadron";
			type = "Assault";
			text = "AAF Spathi SF";
			textShort = "AAF S-SF.";
			description= "Altis Armed Forces Spathi-Special Forces. Hauptaufgaben sind unter anderem Sabotage, Aufklärung, Gefangennahmen und Informationsbeschaffung";
								 class AAFSAS1
			{
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "Squad";
			type = "Assault";
			text = "Altis Armed Forces Spathi-Special Forces";
			textShort = "AAF S-SF 1.";
			description= "Altis Armed Forces Spathi-Special Forces Grp. 1";
			};
										 class AAFSAS2
			{
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "Squad";
			type = "Assault";
			text = "Altis Armed Forces Spathi-Special Forces";
			textShort = "AAF S-SF 2.";
			description= "Altis Armed Forces Spathi-Special Forces Grp. 2";
			};
										 class AAFSAS3
			{
			//id =6;
			//idType =1;
			side = "Resistance";
			size = "Squad";
			type = "Assault";
			text = "Altis Armed Forces Spathi-Special Forces";
			textShort = "AAF S-SF 3.";
			description= "Altis Armed Forces Spathi-Special Forces Grp. 3";
		};
		};

		};

};


 class AAFSpathi2
{
side = "Resistance";
size = "Section";
type = "Assault";
text = "Altis Armed Forces Spathi-Special Forces";
textShort = "AAF S-SF 2.";
description= "Altis Armed Forces Spezialkräfte Forces Grp. 2";

		class AAFSpathi2HQ
	{
	side = "Resistance";
	size = "Troop";
	type = "Assault";
	text = "SF-2 TOC / HQ 'Hekate'";
	textShort = "AAF S-SF 2 TOC.";
	description= "Taktische Einsatzleitung der Gruppe 2. Rufzeichen 'Ἑκάτη'";

		class AAFSpathiTskFrc
	{
	side = "Resistance";
	size = "Squad";
	type = "Infantry";
	text = "Spahti Gruppe 2 'Keres'";
	textShort = "'Keres'";
	description= "Altis Armed Forces Spathi-Special Forces Grp. 2. 'Kḗres'.";
	};
		class AAFSpathiExfil
	{
	side = "Resistance";
	size = "Troop";
	type = "AviationSupport";
	text = "Exfiltration 'Charon'";
	textShort = "'Charon'";
	description= "Exfiltrationshelikopter SF-2 mit Rufzeichen 'Χάρων'.";
	};
		class AAFSpathiCAS
	{
	side = "Resistance";
	size = "Troop";
	type = "Helicopter";
	text = "SF-2 CAS 'Harpie'";
	textShort = "'Harpyie'";
	description= "AH-1 CAS Unterstützung SF-2. Rufzeichen 'hárpyia'";
	};
		class AAFSpathiArty
	{
	side = "Resistance";
	size = "Troop";
	type = "Artillery";
	text = "Artillerie-Unterstützungseinheit 'Hephaistos'";
	textShort = "'Hephaistos'";
	description= "Reguläre Artillerie-Einheit mit Sonderauftrag zur Unterstützung der SF-2. Rufzeichen 'Hḗphaistos'";
	};
		class AAFSpathiObserv
	{
	side = "Resistance";
	size = "FireTeam";
	type = "Recon";
	text = "Späheinheit SF-2. 'Hypnos'";
	textShort = "'Hypnos'";
	description= "Je zwei Teams zu zwei Mann als Späheinheit. Rufzeichen 'Hýpnos-1' und 'Hýpnos-2'";
	};
		class AAFSpathiLog
	{
	side = "Resistance";
	size = "FireTeam";
	type = "Maintenance";
	text = "Logistikeinheit für SF-2";
	textShort = "Log.";
	description= "Reguläre Logistikeinheit als unterstützung für die Vorbereitung und Nachbereitung von Ausrüstung.";
	};


};
};





class APLIFHQ
	{
		//id =1;
		//idType =0;
		side = "EAST";
		size = "Brigade";
		type = "HQ";
		//insignia = "\A3\Data_F\Flags\flag_AAF_CO.paa";
		//colorInsignia[] = {};
		commander = "Heradilos Alamalikas";
		commanderRank = "General";
		tags[] = {};
		text = "Kommandantur";
		textShort = "APLIF HQ";
		//texture = "";
		//color[] = {};
		description= "Zentralkommandantur für militärische Operationen der APLIF.";
		assets[] = {};

					class APLIFN {

				side = "EAST";
				size = "Regiment";
				type = "Recon";
				text = "Regiment 'Burgwächter' Nordsektor";
				textShort = "Burgwächter";
				description= "APLIF Regimentsgruppe für Nord-Altis.";
				};
					class APLIFS {

				side = "EAST";
				size = "Regiment";
				type = "Recon";
				text = "Regiment 'Speerspitze' Südsektor";
				textShort = "Speerspitze";
				description= "APLIF Regimentsgruppe für Süd-Altis.";
				};
					class APLIFW {

				side = "EAST";
				size = "Regiment";
				type = "Recon";
				text = "Regiment 'Rose' Westsektor";
				textShort = "Rose";
				description= "APLIF Regimentsgruppe für West-Altis.";
				};
					class APLIFE {

				side = "EAST";
				size = "Regiment";
				type = "Recon";
				text = "Regiment 'Roter Morgen' Ostsektor";
				textShort = "Roter Morgen";
				description= "APLIF Regimentsgruppe für Ost-Altis.";
				};
					class APLIFC {

				side = "EAST";
				size = "Regiment";
				type = "Recon";
				text = "Zentralregiment 'Hauptland'";
				textShort = "Hauptland";
				description= "APLIF Regimentsgruppe für Zentral-Altis.";
				};
					class APLIFMalden {

				side = "EAST";
				size = "Regiment";
				type = "Recon";
				text = "Regiment 'Freies Malden'";
				textShort = "Freies Malden";
				description= "APLIF Regimentsgruppe 'Freies Malden'.";
				};
	};
//===================================== END OF ORBAT
};