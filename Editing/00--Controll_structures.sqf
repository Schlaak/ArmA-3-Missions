if (!isServer)  exitwith {};


//===================================================
// FOR "_i" FROM 1 TO 10 DO XXX
//===================================================

for "_i" from 1 to 10 do {debugLog _i;};
//---------------------------------------------------
for [{BEGIN}, {CONDITION}, {STEP}] do
{
    STATEMENT;
    ...
};
//---------------------------------------------------
// a loop repeating 10 times
for [{_i=0}, {_i<10}, {_i=_i+1}] do
{
    player globalChat format["%1",_i];
};
//---------------------------------------------------
_array = [unit1, unit2, unit3];

for [{_i=0}, {_i < count _array}, {_i=_i+1}] do
{
    (_array select _i) setDamage 1;
};






//===================================================
// WHILE - Mache Code in Box
//===================================================


{
    while {alive _x}
    do {
        _x setDamage (damage _x - 0.01);
    };
} forEach units group _this;

//----------------------------------------------------
_counter = 0;

while {_counter < 10} do
{
    _counter = _counter + 1;
};


//===================================================
// WAITUNTIL - Mache so lange code in klammern
// letzte zeile muss bool sein und zum beenden des waituntil einen true auswerfen
//===================================================

waitUntil {sleep 0.1; not alive player };


//===================================================
// IF Condition
//===================================================

if (CONDITION) then
{
    STATEMENT;
    ...
};


//===================================================
// IF - ELSE Condition
//===================================================

if (CONDITION) then
{
    STATEMENT1;
    ...
}
else
{
    STATEMENT2;
    ...
};


//===================================================
// SWITCH statement
//===================================================

switch (VARIABLE) do
{
    case VALUE1:
    {
        STATEMENT;

    };

    case VALUE2:
    {
        STATEMENT;

    };


};
//-------------------------
switch (_color) do
{
    case "blue":
    {
        hint "What a nice color";
    };

    case "red":
    {
        hint "Don't you get aggressive?";
    };


        default //Optional DEFAULT - wenn keine Variable übereinstimmt.
    {
        STATEMENT;
        ...
    };
};


//===================================================
// SWITCH statement mit Variablen
//===================================================

_color = switch (side player) do
{
	case west: {"ColorGreen"};
	case east: {"ColorRed"};
};


//===================================================
// SWITCH statement mit Variablen
//===================================================
switch (_condition) do {
    case "string1";
    case "string2": { hint "string1 or string2" };
    case "string3";
    case "string4": { hint "string3 or string4" };
    default { hint "default" };
};

//===================================================
// Random sleep time 50 + zufall 50
//===================================================
sleep (50 + (random 50));