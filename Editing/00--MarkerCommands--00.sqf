
//=====================
//draw arrow
//=====================
/*

    from: Array - Arrow start position in format [x,y] or [x,y,z]
    to: Array - Arrow end position in format [x,y] or [x,y,z]
    color (Optional): Array - Arrow line or fill color in format [r,g,b,a]. Default: [1,1,1,1]
    pars (Optional): Array - Arrow geometry details in format [arrowThickness, arrowHeadLengthCoef, arrowHeadWidthCoef], where:

        arrowThickness (Optional): Number - Arrow thickness in meters. Default: 10
        arrowHeadLengthCoef (Optional): Number - Arrow head length compared to the total length of the arrow. Default: 1/3 (third of the length)
        arrowHeadWidthCoef (Optional): Number - Arrow head width compared to the arrow thickness. Default: 2 (twice as wide)
        arrowBaseWidthCoef (Optional): Number - Arrow base width compared to the arrow thickness. Default: 1 (same width) - Since Arma 3 v1.97

    fill (Optional): Boolean - true to draw color filled arrow, false to draw outline. Default: true
    map (Optional): Control - Map control. Default: control 51 of the main map display 12
*/
//draw red arrow
myArrow1 = [[100,400,0], [200,500,0], [1,0,0,1], [20], true] call BIS_fnc_drawArrow; 
//Remove the arrow created in Example 3:
myArrow3 call BIS_fnc_drawArrow;




//=====================
// DRAW AO 
//=====================
[[triggerName],distance] call BIS_fnc_drawAO;
[Trigger1,10] call BIS_fnc_drawAO; // Draws a dashed line around trigger1's outer edge, with 10m between each line.
//=====================
// DRAW Minefields 
//=====================
//Draw minefields on the map. Dynamically calculated from all mines positions. Distinguishes AP and AT minefields.
call BIS_fnc_drawMinefields;