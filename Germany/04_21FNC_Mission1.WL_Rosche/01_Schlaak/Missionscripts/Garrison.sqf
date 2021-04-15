/*[_x] spawn {
sleep 15;
[_this select 0,O_grp_arr_Inf,1,1+(floor random 3)] call Schlaak_fnc_garrison;
} foreach Schlaak_Garrison;
*/

{[_x , O_grp_arr_Inf,1,1+(floor random 3)] 
spawn Schlaak_fnc_garrison} 
foreach (Schlaak_Garrison);
sleep 5;
if (true) exitwith {};