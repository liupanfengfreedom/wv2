UBTDecorator_BlueprintBase = {} ---@type UBTDecorator
UBTDecorator_BlueprintBase.AIOwner = nil
UBTDecorator_BlueprintBase.ActorOwner = nil
UBTDecorator_BlueprintBase.ObservedKeyNames = nil
UBTDecorator_BlueprintBase.bShowPropertyDetails = nil
UBTDecorator_BlueprintBase.bCheckConditionOnlyBlackBoardChanges = nil
UBTDecorator_BlueprintBase.bIsObservingBB = nil
function UBTDecorator_BlueprintBase.ReceiveTick(OwnerActor, DeltaSeconds) end
function UBTDecorator_BlueprintBase.ReceiveExecutionStart(OwnerActor) end
function UBTDecorator_BlueprintBase.ReceiveExecutionFinish(OwnerActor, NodeResult) end
function UBTDecorator_BlueprintBase.ReceiveObserverActivated(OwnerActor) end
function UBTDecorator_BlueprintBase.ReceiveObserverDeactivated(OwnerActor) end
function UBTDecorator_BlueprintBase.PerformConditionCheck(OwnerActor) end
function UBTDecorator_BlueprintBase.ReceiveTickAI(OwnerController, ControlledPawn, DeltaSeconds) end
function UBTDecorator_BlueprintBase.ReceiveExecutionStartAI(OwnerController, ControlledPawn) end
function UBTDecorator_BlueprintBase.ReceiveExecutionFinishAI(OwnerController, ControlledPawn, NodeResult) end
function UBTDecorator_BlueprintBase.ReceiveObserverActivatedAI(OwnerController, ControlledPawn) end
function UBTDecorator_BlueprintBase.ReceiveObserverDeactivatedAI(OwnerController, ControlledPawn) end
function UBTDecorator_BlueprintBase.PerformConditionCheckAI(OwnerController, ControlledPawn) end
function UBTDecorator_BlueprintBase.IsDecoratorExecutionActive() end
function UBTDecorator_BlueprintBase.IsDecoratorObserverActive() end
