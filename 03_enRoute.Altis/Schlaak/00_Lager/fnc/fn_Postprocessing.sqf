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