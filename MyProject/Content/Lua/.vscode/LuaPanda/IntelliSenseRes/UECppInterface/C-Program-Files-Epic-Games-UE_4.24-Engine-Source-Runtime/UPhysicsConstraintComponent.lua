UPhysicsConstraintComponent = {} ---@type USceneComponent
UPhysicsConstraintComponent.ConstraintActor1 = nil
UPhysicsConstraintComponent.ComponentName1 = nil
UPhysicsConstraintComponent.ConstraintActor2 = nil
UPhysicsConstraintComponent.ComponentName2 = nil
UPhysicsConstraintComponent.ConstraintSetup_DEPRECATED = nil
UPhysicsConstraintComponent.OnConstraintBroken = nil
UPhysicsConstraintComponent.ConstraintInstance = nil
function UPhysicsConstraintComponent.SetConstrainedComponents(Component1, BoneName1, Component2, BoneName2) end
function UPhysicsConstraintComponent.BreakConstraint() end
function UPhysicsConstraintComponent.SetLinearPositionDrive(bEnableDriveX, bEnableDriveY, bEnableDriveZ) end
function UPhysicsConstraintComponent.SetLinearVelocityDrive(bEnableDriveX, bEnableDriveY, bEnableDriveZ) end
function UPhysicsConstraintComponent.SetAngularOrientationDrive(bEnableSwingDrive, bEnableTwistDrive) end
function UPhysicsConstraintComponent.SetOrientationDriveTwistAndSwing(bEnableTwistDrive, bEnableSwingDrive) end
function UPhysicsConstraintComponent.SetOrientationDriveSLERP(bEnableSLERP) end
function UPhysicsConstraintComponent.SetAngularVelocityDrive(bEnableSwingDrive, bEnableTwistDrive) end
function UPhysicsConstraintComponent.SetAngularVelocityDriveTwistAndSwing(bEnableTwistDrive, bEnableSwingDrive) end
function UPhysicsConstraintComponent.SetAngularVelocityDriveSLERP(bEnableSLERP) end
function UPhysicsConstraintComponent.SetAngularDriveMode(DriveMode) end
function UPhysicsConstraintComponent.SetLinearPositionTarget(InPosTarget) end
function UPhysicsConstraintComponent.SetLinearVelocityTarget(InVelTarget) end
function UPhysicsConstraintComponent.SetLinearDriveParams(PositionStrength, VelocityStrength, InForceLimit) end
function UPhysicsConstraintComponent.SetAngularOrientationTarget(InPosTarget) end
function UPhysicsConstraintComponent.SetAngularVelocityTarget(InVelTarget) end
function UPhysicsConstraintComponent.SetAngularDriveParams(PositionStrength, VelocityStrength, InForceLimit) end
function UPhysicsConstraintComponent.SetLinearXLimit(ConstraintType, LimitSize) end
function UPhysicsConstraintComponent.SetLinearYLimit(ConstraintType, LimitSize) end
function UPhysicsConstraintComponent.SetLinearZLimit(ConstraintType, LimitSize) end
function UPhysicsConstraintComponent.SetAngularSwing1Limit(MotionType, Swing1LimitAngle) end
function UPhysicsConstraintComponent.SetAngularSwing2Limit(MotionType, Swing2LimitAngle) end
function UPhysicsConstraintComponent.SetAngularTwistLimit(ConstraintType, TwistLimitAngle) end
function UPhysicsConstraintComponent.SetLinearBreakable(bLinearBreakable, LinearBreakThreshold) end
function UPhysicsConstraintComponent.SetAngularBreakable(bAngularBreakable, AngularBreakThreshold) end
function UPhysicsConstraintComponent.GetCurrentTwist() end
function UPhysicsConstraintComponent.GetCurrentSwing1() end
function UPhysicsConstraintComponent.GetCurrentSwing2() end
function UPhysicsConstraintComponent.SetConstraintReferenceFrame(Frame, RefFrame) end
function UPhysicsConstraintComponent.SetConstraintReferencePosition(Frame, RefPosition) end
function UPhysicsConstraintComponent.SetConstraintReferenceOrientation(Frame, PriAxis, SecAxis) end
function UPhysicsConstraintComponent.SetDisableCollision(bDisableCollision) end
function UPhysicsConstraintComponent.GetConstraintForce(OutLinearForce, OutAngularForce) end
function UPhysicsConstraintComponent.IsBroken() end
