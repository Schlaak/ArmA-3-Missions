author			= "Schlaak & Ir0nsight";
onLoadName		= "Bereit machen";
onLoadMission	= "....";
loadScreen		= "title.jpg";

class Header
{
	gameType =  Coop;	// Game type
	minPlayers =  1;	// minimum number of players the mission supports
	maxPlayers = 10;	// maximum number of players the mission supports
};

onLoadIntro = "Bereit machen!";
onLoadMissionTime = 1;
onLoadIntroTime = 1;
briefingName = "SchlaakFNC";

class CfgWorlds
{
	class Any // or specific world name
	{
		author = "Schlaak & Ir0nsight";
		description = "World War III broke loose in summer 1990";
		pictureMap = "world.jpg";
		pictureShot = "world.jpg";
		loadingTexts[] = {"Summer 1990...", 
		"26. Nov 1988: Typhoon class submarine 'red octobre' desserts to US-Navy forces.", 
		"14. Feb. 1989: The largest oil-refinery in Nischnewartowsk is set aflame by Jihadists.",
		"May 89': Moscow bombings claim 24 dead and 124 wounded.",
		"May 89': Westgerman terrorists accused on Moscow-bombings. ",
		"May 89': USSR strenghens troops in east germany.",
		"4. Jul 89': MIG-fighter plane crashes in belgium, leaves 18yo dead.",
		"i suppose we are lost and will die in this pointless war...",
		"You will not see the speznas coming.",
		};
	};
};