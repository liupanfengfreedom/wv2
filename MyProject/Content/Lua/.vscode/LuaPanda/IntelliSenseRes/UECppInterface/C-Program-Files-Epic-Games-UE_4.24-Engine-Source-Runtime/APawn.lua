APawn = {} ---@type AActor
APawn.bUseControllerRotationPitch = nil
APawn.bUseControllerRotationYaw = nil
APawn.bUseControllerRotationRoll = nil
APawn.bCanAffectNavigationGeneration = nil
APawn.BaseEyeHeight = nil
APawn.AutoPossessPlayer = nil
APawn.AutoPossessAI = nil
APawn.RemoteViewPitch = nil
APawn.AIControllerClass = nil
APawn.PlayerState = nil
APawn.LastHitBy = nil
APawn.Controller = nil
APawn.ControlInputVector = nil
APawn.LastControlInputVector = nil
function APawn.GetMovementComponent() end
function APawn.PawnMakeNoise(Loudness, NoiseLocation) end
function APawn.GetMovementBaseActor(Pawn) end
function APawn.IsControlled() end
function APawn.IsPawnControlled() end
function APawn.GetController() end
function APawn.GetControlRotation() end
function APawn.OnRep_Controller() end
function APawn.OnRep_PlayerState() end
function APawn.SetCanAffectNavigationGeneration(bNewValue) end
function APawn.GetNavAgentLocation() end
function APawn.ReceivePossessed(NewController) end
function APawn.ReceiveUnpossessed(OldController) end
function APawn.IsLocallyControlled() end
function APawn.IsPlayerControlled() end
function APawn.IsBotControlled() end
function APawn.GetBaseAimRotation() end
function APawn.DetachFromControllerPendingDestroy() end
function APawn.SpawnDefaultController() end
function APawn.AddMovementInput(WorldDirection) end
function APawn.GetPendingMovementInputVector() end
function APawn.GetLastMovementInputVector() end
function APawn.ConsumeMovementInputVector() end
function APawn.AddControllerPitchInput(Val) end
function APawn.AddControllerYawInput(Val) end
function APawn.AddControllerRollInput(Val) end
function APawn.IsMoveInputIgnored() end
function APawn.LaunchPawn(LaunchVelocity, bXYOverride, bZOverride) end
function APawn.K2_GetMovementInputVector() end
