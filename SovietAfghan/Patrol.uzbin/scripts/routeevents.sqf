RndEvent = false;
Event1 = false;
Event2 = false;
Event3 = false;
Event4 = false;
Event5 = false;
_event = selectrandom [1,2,3,4,5];
switch (_event) do
{
	case 1:
	{
		event1 = true;
	};
		case 2:
	{
		event2 = true;
	};
		case 3:
	{
		event3 = true;
	};
		case 4:
	{
		event4 = true;
	};
		case 5:
	{
		event5 = true;
	};
	default
	{
		event1 = true;
	};
};
_rndeventcalc = selectrandom [1,2];
switch (_rndeventcalc) do
{
	case 1:
	{
		RndEvent = true;
	};

	case 2:
	{
		RndEvent = false;
	};
};