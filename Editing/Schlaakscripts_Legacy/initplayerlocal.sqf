PP_radial = ppEffectCreate ["radialBlur",100];
PP_radial ppEffectEnable true;
PP_radial ppEffectAdjust [0.01,0.01,0.47,0.47];
PP_radial ppEffectCommit 1;

PP_colorC = ppEffectCreate ["ColorCorrections",1500];
PP_colorC ppEffectEnable true;
PP_colorC ppEffectAdjust [0.87,1,0,[0,0.18,0,0.12],[-0.66,0.52,1,1.1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]];
PP_colorC ppEffectCommit 1;
PP_dynamic = ppEffectCreate ["DynamicBlur",500];
PP_dynamic ppEffectEnable true;
PP_dynamic ppEffectAdjust [0.2];
PP_dynamic ppEffectCommit 1;
// Date YYYY-MM-DD-HH-MM: [1983,8,3,5,6]. Overcast: 0.360816. Fog: 0. Fog params: [0,0.014,250]
// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
//[[true,100,[0.01,0.01,0.47,0.47]],[false,200,[0.05,0.05,true]],[true,300,[0,0.001,0.001,0.1,0.1,0.1,0.1,1.5,1.52,1.55,1.47,1.4,1.36,3.24,3.32]],[true,1500,[0.87,1,0,[0,0.18,0,0.12],[-0.66,0.52,1,1.1],[0.33,0.33,0.33,0],[0,0,0,0,0,0,4]]],[true,500,[0.2]],[false,2000,[0.2,1,1,0.5,0.5,true]],[false,2500,[1,1,1]]]

execvm "amb_combat_sound.sqf";