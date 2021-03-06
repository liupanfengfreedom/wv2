UKismetInternationalizationLibrary = {} ---@type UBlueprintFunctionLibrary
function UKismetInternationalizationLibrary.SetCurrentCulture(Culture) end
function UKismetInternationalizationLibrary.GetCurrentCulture() end
function UKismetInternationalizationLibrary.SetCurrentLanguage(Culture) end
function UKismetInternationalizationLibrary.GetCurrentLanguage() end
function UKismetInternationalizationLibrary.SetCurrentLocale(Culture) end
function UKismetInternationalizationLibrary.GetCurrentLocale() end
function UKismetInternationalizationLibrary.SetCurrentLanguageAndLocale(Culture) end
function UKismetInternationalizationLibrary.SetCurrentAssetGroupCulture(AssetGroup, Culture) end
function UKismetInternationalizationLibrary.GetCurrentAssetGroupCulture(AssetGroup) end
function UKismetInternationalizationLibrary.ClearCurrentAssetGroupCulture(AssetGroup) end
function UKismetInternationalizationLibrary.GetNativeCulture(TextCategory) end
function UKismetInternationalizationLibrary.GetLocalizedCultures() end
function UKismetInternationalizationLibrary.GetSuitableCulture(AvailableCultures, CultureToMatch) end
function UKismetInternationalizationLibrary.GetCultureDisplayName(Culture) end
