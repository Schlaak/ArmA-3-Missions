this addaction["<t color='#FF0000'>Greifen!</t>","02_scripts\grab.sqf",nil,1,true,true,"","((_target distance _this)<2) && alive _target && ((lifeState _target) == 'HEALTHY' );"];" \n "nul = [this,"CUP_hgun_Makarov",(35+random 35),floor random 50 + 5,resistance,1,1] execVM "02_scripts\ws_assassins.sqf";







this addaction["<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa' />","02_scripts\grab.sqf",nil,1,true,true,"","((_target distance _this)<2) && alive _target && ((lifeState _target) == 'HEALTHY' );"];" \n "nul = [this,"CUP_hgun_Makarov",(35+random 35),floor random 50 + 5,resistance,1,1] execVM "02_scripts\ws_assassins.sqf";



this addaction["<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa' />","02_scripts\grab.sqf",nil,1,true,true,"",{((_target distance _this) <2) && alive _target && ((lifeState _target) == 'HEALTHY') }];