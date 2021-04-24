switch (paramsArray select 20) do
{
    case 0:
    {
        //light blueish afghan
		PP_radial = ppEffectCreate ["radialBlur",100];
		PP_radial ppEffectEnable true;
		PP_radial ppEffectAdjust [0.01,0.01,0.48,0.48];
		PP_radial ppEffectCommit 0;
		PP_colorC = ppEffectCreate ["ColorCorrections",1500];
		PP_colorC ppEffectEnable true;
		PP_colorC ppEffectAdjust [1,1,0,[-0.41,-0.26,0.45,0.11],[1,1,1,1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
		PP_colorC ppEffectCommit 0;
		PP_dynamic = ppEffectCreate ["DynamicBlur",500];
		PP_dynamic ppEffectEnable true;
		PP_dynamic ppEffectAdjust [0.11];
		PP_dynamic ppEffectCommit 0;

    };

    case 1:
    {
		//light redish afghan
		PP_radial = ppEffectCreate ["radialBlur",100];
		PP_radial ppEffectEnable true;
		PP_radial ppEffectAdjust [0.01,0.01,0.48,0.48];
		PP_radial ppEffectCommit 0;
		PP_colorC = ppEffectCreate ["ColorCorrections",1500];
		PP_colorC ppEffectEnable true;
		PP_colorC ppEffectAdjust [1,1,0,[0.34,0,0,0.11],[1,1,1,1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
		PP_colorC ppEffectCommit 0;
		PP_dynamic = ppEffectCreate ["DynamicBlur",500];
		PP_dynamic ppEffectEnable true;
		PP_dynamic ppEffectAdjust [0.11];
		PP_dynamic ppEffectCommit 0;

    };

    case 2:
    {
		//light yellow-blueish afghan
		PP_radial = ppEffectCreate ["radialBlur",100];
		PP_radial ppEffectEnable true;
		PP_radial ppEffectAdjust [0.01,0.01,0.48,0.48];
		PP_radial ppEffectCommit 0;
		PP_colorC = ppEffectCreate ["ColorCorrections",1500];
		PP_colorC ppEffectEnable true;
		PP_colorC ppEffectAdjust [1.1,1.2,-0.2,[0.18,0,0.28,0.12],[1,1,1,1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
		PP_colorC ppEffectCommit 0;
		PP_dynamic = ppEffectCreate ["DynamicBlur",500];
		PP_dynamic ppEffectEnable true;
		PP_dynamic ppEffectAdjust [0.11];
		PP_dynamic ppEffectCommit 0;

    };

    case 3:
    {
		// allrounder
		_PP_radial = ppEffectCreate ["radialBlur",100];
		_PP_radial ppEffectEnable true;
		_PP_radial ppEffectAdjust [0.01,0.01,0.47,0.47];
		_PP_radial ppEffectCommit 1;
		_PP_colorC = ppEffectCreate ["ColorCorrections",1500];
		_PP_colorC ppEffectEnable true;
		_PP_colorC ppEffectAdjust [0.87,1,0,[0,0.18,0,0.12],[-0.66,0.52,1,1.1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
		_PP_colorC ppEffectCommit 1;
		_PP_dynamic = ppEffectCreate ["DynamicBlur",500];
		_PP_dynamic ppEffectEnable true;
		_PP_dynamic ppEffectAdjust [0.2];
		_PP_dynamic ppEffectCommit 1;

    };

    case 4:
    {
    	PP_colorC = ppEffectCreate ["ColorCorrections",1500];
		PP_colorC ppEffectEnable true;
		PP_colorC ppEffectAdjust [1.05,2,0,[0,0,0.48,0.03],[1,1,1,1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
		PP_colorC ppEffectCommit 0;
		PP_dynamic = ppEffectCreate ["DynamicBlur",500];
		PP_dynamic ppEffectEnable true;
		PP_dynamic ppEffectAdjust [0.1];
		PP_dynamic ppEffectCommit 0;

    };

};











