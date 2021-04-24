


//________________  Author : GEORGE FLOROS [GR] ___________ 02.11.18 _____________

/*
________________ GF Ambient Environment Winter Script ________________

https://forums.bohemia.net/forums/topic/220062-gf-ambient-environment-winter-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/
	

diag_log "//________________ GF_AEW_Snow initialized ________________";

/*
if (GF_AEW_Systemchat_info) then {
systemchat "GF_AEW_Snow initialized";			
};	
*/

//________________ Settings ________________
//________________ Set true or false  ________________

GF_AEW_Snow_Distance = 25;   


 
 
GF_AEW_Snow = {      

	while {true} do {      
		   		// original value was overcastForecast
	waitUntil {(overcast > 0.5)};
		   		// original value was overcastForecast
	_Snow_Value	= (overcast * 10000);
				// original value was overcastForecast
	_Value	= (overcast * 10); 	
	//	hintsilent format["_Snow_Value : %1",_Snow_Value];
		
	private _a = 0;      
	while {_a < _Snow_Value} do {    

	0 setRain 0;
	//	setWind [random 2, random 2, false];    
	
	if (vehicle player != player) then {                    
	_Snow_Value = _Snow_Value * 2;  
	};      
   
	for "_i" from _Value to GF_AEW_Snow_Distance step _Value do {   

	private _Pos = ATLtoASL positionCameraToWorld [0,0,0];   
	private _hpos =+ _Pos; _hpos set [2,(_Pos select 2)+20]; 	   
	private _height = (GF_AEW_Snow_Distance - _i + 2) min 10;   
	if (speed player > 30) then {_height = 8;};   

	private _dpos = [   
		((_Pos select 0) + (_i - (random (2*_i))) + ((velocity vehicle player select 1)*1)),   
		((_Pos select 1) + (_i - (random (2*_i))) + ((velocity vehicle player select 0)*1)),   
		(_Pos select 2) + _height   
	];      

	private _hdpos =+ _dpos; _hdpos set [2,(_dpos select 2) + 20]; 
	private _ldpos =+ _dpos; _ldpos set [2,(_Pos select 2)+0.1];       
	   
	if (!lineIntersects [_dpos, _hdpos] || {(_hpos distance2D _hdpos > 7) && (lineIntersects [_Pos,_hpos])}) then {     

		private _ttl = (_height*0.5);    
		private _surfaces = lineIntersectsSurfaces [_dpos,_ldpos,player,player,true,1];    
		private _size = (0.02 + (random 0.06));
		private _Velocity	= (overcastForecast + (random 0.70));  
		private _vel = (_size*10)*_Velocity;   
		if (count _surfaces > 0) then {   

		_surfHeight = _surfaces select 0 select 0 select 2;   
		private _dist = (_dpos select 2) - _surfHeight;   
		_ttl = ((_dist / _vel) * 0.1) min (_height * 0.1);                           
		};    

		_1 = ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12,(floor random 12) ,1];					
		_2 = ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12,(floor random 12) ,1];	
		_drop = selectrandom [_1,_2];		
		drop [_drop, "", "Billboard", 1, _ttl, ASLToATL _dpos, [0,0, 0 - _vel], 1, 0.0000001, 0.000, 0.7, [_size], [[1,1,1,0], [1,1,1,1], [1,1,1,1], [1,1,1,1]], [0,0], 0.2, (1.5 -_vel) max 0.3, "", "", ""];      
	};     
        _a = _a + 1;      
            };                 
        };    
	sleep 0.6;         
	};      
};


[] spawn GF_AEW_Snow;