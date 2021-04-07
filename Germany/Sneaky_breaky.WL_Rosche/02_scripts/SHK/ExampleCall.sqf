
[] spawn {
	//_positi = [getmarkerpos "shkposmrk",[50,100,600],[0,180,360],0,0,[]] call ShkPos_fnc_executeFindPosition;
	

	//road position
	_positi = [getmarkerpos "shkposmrk",[50,100,600],[0,180,360],0,1,[]] call ShkPos_fnc_executeFindPosition;
	
	sleep 1;
	[_positi,"test",150,150,"ColorRed","FDiagonal"] call Schlaak_fnc_markArea
	};