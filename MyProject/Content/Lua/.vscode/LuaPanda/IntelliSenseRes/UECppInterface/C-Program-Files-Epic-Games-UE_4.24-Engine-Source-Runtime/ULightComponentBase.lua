ULightComponentBase = {} ---@type USceneComponent
ULightComponentBase.LightGuid = nil
ULightComponentBase.Brightness_DEPRECATED = nil
ULightComponentBase.Intensity = nil
ULightComponentBase.LightColor = nil
ULightComponentBase.bAffectsWorld = nil
ULightComponentBase.CastShadows = nil
ULightComponentBase.CastStaticShadows = nil
ULightComponentBase.CastDynamicShadows = nil
ULightComponentBase.bAffectTranslucentLighting = nil
ULightComponentBase.bTransmission = nil
ULightComponentBase.bCastVolumetricShadow = nil
ULightComponentBase.bCastDeepShadow = nil
ULightComponentBase.bCastRaytracedShadow = nil
ULightComponentBase.bAffectReflection = nil
ULightComponentBase.bAffectGlobalIllumination = nil
ULightComponentBase.IndirectLightingIntensity = nil
ULightComponentBase.VolumetricScatteringIntensity = nil
ULightComponentBase.SamplesPerPixel = nil
ULightComponentBase.StaticEditorTexture = nil
ULightComponentBase.StaticEditorTextureScale = nil
ULightComponentBase.DynamicEditorTexture = nil
ULightComponentBase.DynamicEditorTextureScale = nil
function ULightComponentBase.SetCastShadows(bNewValue) end
function ULightComponentBase.GetLightColor() end
function ULightComponentBase.SetCastVolumetricShadow(bNewValue) end
function ULightComponentBase.SetCastDeepShadow(bNewValue) end
function ULightComponentBase.SetAffectReflection(bNewValue) end
function ULightComponentBase.SetAffectGlobalIllumination(bNewValue) end
function ULightComponentBase.SetCastRaytracedShadow(bNewValue) end
function ULightComponentBase.SetSamplesPerPixel(NewValue) end
