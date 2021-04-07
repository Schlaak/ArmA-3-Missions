	//(paramsArray select 0);
	class Schlaak_Playerside
	{
		title = "Playerside";
		texts[] = {"East","West","Independent"};
		values[] = {east, west, independent};
		default = 0;
	};
	//(paramsArray select 1);
	class Schlaak_Hostiles
	{
		title = "Hostile side";
		texts[] = {"East","West", "Independent"};
		values[] = {East, West ,Independent};
		default = 2;
	};
	//(paramsArray select 2);
	class Schlaak_Afghanmode
	{
		title = "Afghanmode";
		texts[] = {"YES","NO"};
		values[] = {true, false};
		default = 0;
	};
	//(paramsArray select 3);
	class Schlaak_dietime
	{
		title = "Basic dietime (currently useless)";
		texts[] = {"5 min","7 min","10 min", "15 min", "20 min"};
		values[] = {300, 420, 600, 900, 1200};
		default = 600;
	};
	//(paramsArray select 4);
	class Schlaak_bodybagtime
	{
		title = "BodybagTime";
		texts[] = {"5 min","7 min","10 min", "15 min", "20 min"};
		values[] = {300, 420, 600, 900, 1200};
		default = 600;
	};
	//(paramsArray select 5);
	class Schlaak_bagremovaltime
	{
		title = "BodybagRemovealTime";
		texts[] = {"5 min","7 min","10 min", "15 min", "20 min"};
		values[] = {300, 420, 600, 900, 1200};
		default = 600;
	};
	//(paramsArray select 6);
	class Schlaak_allowSurrender
	{
		title = "allow Surrender";
		texts[] = {"yes", "no"};
		values[] = {true, false};
		default = 1;
	};
	//(paramsArray select 7);
	class Schlaak_allowRetreat
	{
		title = "allow Retreat";
		texts[] = {"Yes", "No"};
		values[] = {true, false};
		default = true;
	};
	//(paramsArray select 8);
	class Schlaak_allowWounded
	{
		title = "allow Wounded AI";
		texts[] = {"Yes", "No"};
		values[] = {true, false};
		default = true;
	};
	//(paramsArray select 9);
	class Schlaak_surrenderTime
	{
		title = "Surrendertime";
		texts[] = {"2.5 min","5 min","7 min","10 min", "15 min", "20 min"};
		values[] = {150 ,300, 420, 600, 900, 1200};
		default = 150;
	};
	//(paramsArray select 10);
	class Schlaak_surrenderCapTime
	{
		title = "Surrendertime";
		texts[] = {"5 min","7 min","10 min", "15 min", "20 min"};
		values[] = {300, 420, 600, 900, 1200};
		default = 300;
	};
	//(paramsArray select 11);
	class Schlaak_PoI1_mindist
	{
		title = "PoI1 minimal distance";
		texts[] = {"5 m", "25 m" , "50 m", "75 m"};
		values[] = {5, 25, 50, 75};
		default = 5;
	};
	//(paramsArray select 12);
	class Schlaak_PoI1_maxdist
	{
		title = "PoI1 maximal distance";
		texts[] = {"100 m","150 m", "200 m", "250 m", "300 m", "350 m", "400 m" };
		values[] = {100, 150, 200, 250, 300, 350, 400};
		default = 300;
	};
	//(paramsArray select 13);
	class Schlaak_PoI1_objdist
	{
		title = "PoI1 object distance";
		texts[] = {"5 m","7 m","10 m", "12 m", "15 m"};
		values[] = {5, 7, 10, 12, 15};
		default = 5;
	};
	//(paramsArray select 14);
	class Schlaak_PoI2_mindist
	{
		title = "PoI2 minimal distance";
		texts[] = {"5 m", "25 m" , "50 m", "75 m"};
		values[] = {5, 25, 50, 75};
		default = 5;
	};
	//(paramsArray select 15);
	class Schlaak_PoI2_maxdist
	{
		title = "PoI2 maximal distance";
		texts[] = {"100 m","150 m", "200 m", "250 m", "300 m", "350 m", "400 m" };
		values[] = {100, 150, 200, 250, 300, 350, 400};
		default = 250;
	};
	//(paramsArray select 16);
	class Schlaak_PoI2_objdist
	{
		title = "PoI2 object distance";
		texts[] = {"5 m","7 m","10 m", "12 m", "15 m"};
		values[] = {5, 7, 10, 12, 15};
		default = 5;
	};
	//(paramsArray select 17);
	class Schlaak_PoI3_mindist
	{
		title = "PoI3 minimal distance";
		texts[] = {"5 m", "25 m" , "50 m", "75 m"};
		values[] = {5, 25, 50, 75};
		default = 5;
	};
	//(paramsArray select 18);
	class Schlaak_PoI3_maxdist
	{
		title = "PoI3 maximal distance";
		texts[] = {"100 m","150 m", "200 m", "250 m", "300 m", "350 m", "400 m" };
		values[] = {100, 150, 200, 250, 300, 350, 400};
		default = 250;
	};
	//(paramsArray select 19);
	class Schlaak_PoI3_objdist
	{
		title = "PoI3 object distance";
		texts[] = {"5 m","7 m","10 m", "12 m", "15 m"};
		values[] = {5, 7, 10, 12, 15};
		default = 5;
	};
	//(paramsArray select 20);
	class Schlaak_postProcessing
	{
		title = "PoI3 object distance";
		texts[] = {"light blueish afghan","light redish afghan","light yellow-blueish afghan","allrounder"};
		values[] = {0,1,2,3};
		default = 1;
	};
	//(paramsArray select 21);
	class Schlaak_Snow
	{
		title = "Want snow?";
		texts[] = {"yes!","no!"};
		values[] = {1,0};
		default = 0;
	};