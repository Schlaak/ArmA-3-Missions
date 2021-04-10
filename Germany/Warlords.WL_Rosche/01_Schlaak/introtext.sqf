sleep 45;
[
 [
  [format ["%1", text nearestLocation [position player, ""]],"<t align = 'right' shadow = '1' size = '1.2' font='EtelkaMonospaceProBold' color='#00FF00'>%1</t><br/>",15],
  ["Westdeutschland","<t align = 'right' shadow = '1' size = '1.2' font='EtelkaMonospaceProBold' color='#00FF00' >%1</t><br/>",8],
  [

format ["%1-%2-%3 %4 Std. %5 Min.", date select 0,date select 1,date select 2,date select 3,date select 4]

,"<t align = 'right' shadow = '1' size = '1.0' font='EtelkaMonospaceProBold' color='#00FF00' >%1</t><br/>",8],
  [

format ["Wind: %1 m/s", wind]

,"<t align = 'right' shadow = '1' size = '1.0' font='EtelkaMonospaceProBold' color='#00FF00' >%1</t>",35]
 ] ,(safeZoneX +1.1), (safeZoneY +1)
] spawn BIS_fnc_typeText;