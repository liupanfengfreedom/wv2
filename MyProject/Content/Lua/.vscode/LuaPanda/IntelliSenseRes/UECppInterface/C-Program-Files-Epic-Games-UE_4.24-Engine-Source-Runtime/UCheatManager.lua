UCheatManager = {} ---@type UObject
UCheatManager.DebugCameraControllerRef = nil
UCheatManager.DebugCameraControllerClass = nil
function UCheatManager.FreezeFrame(Delay) end
function UCheatManager.Teleport() end
function UCheatManager.ChangeSize(F) end
function UCheatManager.Fly() end
function UCheatManager.Walk() end
function UCheatManager.Ghost() end
function UCheatManager.God() end
function UCheatManager.Slomo(NewTimeDilation) end
function UCheatManager.DamageTarget(DamageAmount) end
function UCheatManager.DestroyTarget() end
function UCheatManager.DestroyAll(aClass) end
function UCheatManager.DestroyAllPawnsExceptTarget() end
function UCheatManager.DestroyPawns(aClass) end
function UCheatManager.Summon(ClassName) end
function UCheatManager.PlayersOnly() end
function UCheatManager.ViewSelf() end
function UCheatManager.ViewPlayer(S) end
function UCheatManager.ViewActor(ActorName) end
function UCheatManager.ViewClass(DesiredClass) end
function UCheatManager.StreamLevelIn(PackageName) end
function UCheatManager.OnlyLoadLevel(PackageName) end
function UCheatManager.StreamLevelOut(PackageName) end
function UCheatManager.ToggleDebugCamera() end
function UCheatManager.ToggleAILogging() end
function UCheatManager.ServerToggleAILogging() end
function UCheatManager.DebugCapsuleSweep() end
function UCheatManager.DebugCapsuleSweepSize(HalfHeight, Radius) end
function UCheatManager.DebugCapsuleSweepChannel(Channel) end
function UCheatManager.DebugCapsuleSweepComplex(bTraceComplex) end
function UCheatManager.DebugCapsuleSweepCapture() end
function UCheatManager.DebugCapsuleSweepPawn() end
function UCheatManager.DebugCapsuleSweepClear() end
function UCheatManager.TestCollisionDistance() end
function UCheatManager.DumpOnlineSessionState() end
function UCheatManager.DumpPartyState() end
function UCheatManager.DumpChatState() end
function UCheatManager.DumpVoiceMutingState() end
function UCheatManager.BugItGo(X, Y, Z, Pitch, Yaw, Roll) end
function UCheatManager.BugIt() end
function UCheatManager.BugItStringCreator(ViewLocation, ViewRotation, GoString, LocString) end
function UCheatManager.FlushLog() end
function UCheatManager.LogLoc() end
function UCheatManager.SetWorldOrigin() end
function UCheatManager.SetMouseSensitivityToDefault() end
function UCheatManager.InvertMouse() end
function UCheatManager.CheatScript(ScriptName) end
function UCheatManager.SpawnServerStatReplicator() end
function UCheatManager.DestroyServerStatReplicator() end
function UCheatManager.ToggleServerStatReplicatorClientOverwrite() end
function UCheatManager.ToggleServerStatReplicatorUpdateStatNet() end
function UCheatManager.UpdateSafeArea() end
function UCheatManager.ReceiveInitCheatManager() end
function UCheatManager.ReceiveEndPlay() end
function UCheatManager.EnableDebugCamera() end
function UCheatManager.DisableDebugCamera() end
