


while { (true) } do {


{
	if ((_x isKindOf "Man") && (!isplayer _x)) then {

		_x removeAllEventHandlers "Fired";

	_x addEventHandler ["Fired",{ if (_this select 1 != "THROW" && _this select 1 != "PUT") then {_this execVM "injuredai_simplescript\fireSound.sqf"};}];
	};
	} foreach allunits;

sleep 10;

};

