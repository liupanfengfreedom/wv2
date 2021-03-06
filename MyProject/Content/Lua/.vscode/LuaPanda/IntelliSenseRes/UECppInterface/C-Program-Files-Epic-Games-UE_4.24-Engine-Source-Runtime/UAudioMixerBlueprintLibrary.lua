UAudioMixerBlueprintLibrary = {} ---@type UBlueprintFunctionLibrary
function UAudioMixerBlueprintLibrary.AddMasterSubmixEffect(WorldContextObject, SubmixEffectPreset) end
function UAudioMixerBlueprintLibrary.RemoveMasterSubmixEffect(WorldContextObject, SubmixEffectPreset) end
function UAudioMixerBlueprintLibrary.ClearMasterSubmixEffects(WorldContextObject) end
function UAudioMixerBlueprintLibrary.StartRecordingOutput(WorldContextObject, ExpectedDuration) end
function UAudioMixerBlueprintLibrary.StopRecordingOutput(WorldContextObject, ExportType, Name, Path) end
function UAudioMixerBlueprintLibrary.PauseRecordingOutput(WorldContextObject) end
function UAudioMixerBlueprintLibrary.ResumeRecordingOutput(WorldContextObject) end
function UAudioMixerBlueprintLibrary.StartAnalyzingOutput(WorldContextObject) end
function UAudioMixerBlueprintLibrary.StopAnalyzingOutput(WorldContextObject) end
function UAudioMixerBlueprintLibrary.GetMagnitudeForFrequencies(WorldContextObject, Frequencies, Magnitudes) end
function UAudioMixerBlueprintLibrary.GetPhaseForFrequencies(WorldContextObject, Frequencies, Phases) end
function UAudioMixerBlueprintLibrary.AddSourceEffectToPresetChain(WorldContextObject, PresetChain, Entry) end
function UAudioMixerBlueprintLibrary.RemoveSourceEffectFromPresetChain(WorldContextObject, PresetChain, EntryIndex) end
function UAudioMixerBlueprintLibrary.SetBypassSourceEffectChainEntry(WorldContextObject, PresetChain, EntryIndex, bBypassed) end
function UAudioMixerBlueprintLibrary.GetNumberOfEntriesInSourceEffectChain(WorldContextObject, PresetChain) end
function UAudioMixerBlueprintLibrary.PrimeSoundForPlayback(SoundWave, OnLoadCompletion) end
function UAudioMixerBlueprintLibrary.PrimeSoundCueForPlayback(SoundCue) end
function UAudioMixerBlueprintLibrary.TrimAudioCache(InMegabytesToFree) end
