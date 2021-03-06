//PP_radial = ppEffectCreate ["radialBlur",100];
//PP_radial ppEffectEnable true;
//PP_radial ppEffectAdjust [0.02,0.02,0.47,0.47];
//PP_radial ppEffectCommit 0;
//PP_colorC = ppEffectCreate ["ColorCorrections",1500];
//PP_colorC ppEffectEnable true;
//PP_colorC ppEffectAdjust [1,1.07,0,[2,2,2,-0.04],[-1.8,0.56,1.72,1.06],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
//PP_colorC ppEffectCommit 0;
//PP_dynamic = ppEffectCreate ["DynamicBlur",500];
//PP_dynamic ppEffectEnable true;
//PP_dynamic ppEffectAdjust [0.25];
//PP_dynamic ppEffectCommit 0;
/*
PP_colorI = ppEffectCreate ["ColorInversion",2500];
PP_colorI ppEffectEnable true;
PP_colorI ppEffectAdjust [0.02,0.04,0.04];
PP_colorI ppEffectCommit 0;
*/
// Date YYYY-MM-DD-HH-MM: [2011,6,11,11,20]. Overcast: 0.3. Fog: 0. Fog params: [0,0.014,0]
// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
// [[true,100,[0.02,0.02,0.47,0.47]],[false,200,[0.21,-0.09,true]],[false,300,[1,0.2,0.2,1,1,1,1,0.05,0.01,0.05,0.01,0.1,0.1,0.2,0.2]],[true,1500,[1,1.26,0,[0.23,-0.04,-0.11,0.15],[1,1,1,1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]]],[true,500,[0.25]],[false,2000,[0.2,1,1,0.5,0.5,true]],[true,2500,[0.02,0.04,0.04]]]
//execvm "amb_combat_sound.sqf";
[] execvm "briefing.sqf";
[] execvm "scripts\Briefinggenerator.sqf";
[] execvm "scripts\antioffroad.sqf";

_items = [
	["ACE_fieldDressing",5],
	["ACE_packingBandage",8],
	["ACE_Canteen",2],
	["ACE_personalAidKit",1]
];
{
	for "_i" from 0 to (_x select 1) do {
		player addItem (_x select 0)
	}
} forEach _items;

_magazine = (getArray (configFile >> "CfgWeapons" >> primaryWeapon player >> "magazines")) select 0;
		for "_i" from 0 to 3 do
		{
			player addMagazineGlobal _magazine;
		};

[] execVM "irn_library.sqf";
[] execVM "initPlayerActions.sqf";







sleep 60;
//TODO bitte formatieren! absolut unlesbar so
[
 [
  ["Grenzregion Afghanistan,","<t align = 'right' shadow = '1' size = '1.2' font='EtelkaMonospaceProBold' color='#00FF00'>%1</t><br/>",15],
  ["Routinepatrouille","<t align = 'right' shadow = '1' size = '1.2' font='EtelkaMonospaceProBold' color='#00FF00' >%1</t><br/>",8],
  [

format ["%1-%2-%3 %4 Std. %5 Min.", date select 0,date select 1,date select 2,date select 3,date select 4]

,"<t align = 'right' shadow = '1' size = '1.0' font='EtelkaMonospaceProBold' color='#00FF00' >%1</t><br/>",8],
  [

format ["Wind: %1-NS %2-OW m/s", floor (wind select 0), floor (wind select 1)]

,"<t align = 'right' shadow = '1' size = '1.0' font='EtelkaMonospaceProBold' color='#00FF00' >%1</t>",35]
 ] ,(safeZoneX +1.1), (safeZoneY +1)
] spawn BIS_fnc_typeText;
sleep 15;