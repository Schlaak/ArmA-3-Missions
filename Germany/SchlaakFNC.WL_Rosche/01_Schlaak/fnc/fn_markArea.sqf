
//[getpos this,"test",400,300,"ColorRed","FDiagonal"] call Schlaak_fnc_markArea
params ["_pos1","_name","_sizeA","_sizeB","_color","_shape"]; 

if (!isserver) exitWith {};



_mrk = createMarker [_name, _pos1];
_mrk setMarkerShape "ELLIPSE";
_mrk setMarkerColor _color;
_mrk setMarkerSize [_sizeA, _sizeB];
_mrk setMarkerBrush _shape;
/*
ColorBlack
ColorGrey
ColorRed
ColorBrown
ColorOrange
ColorYellow
ColorKhaki
ColorGreen
ColorBlue
ColorPink
ColorWhite
ColorWEST
ColorEAST
ColorGUER
ColorCIV
ColorUNKNOWN
colorBLUFOR
colorOPFOR
colorIndependent
colorCivilian

brush can be:

    "Solid"
    "SolidFull" (A3 only)
    "Horizontal"
    "Vertical"
    "Grid"
    "FDiagonal"
    "BDiagonal"
    "DiagGrid"
    "Cross"
    "Border"
    "SolidBorder"