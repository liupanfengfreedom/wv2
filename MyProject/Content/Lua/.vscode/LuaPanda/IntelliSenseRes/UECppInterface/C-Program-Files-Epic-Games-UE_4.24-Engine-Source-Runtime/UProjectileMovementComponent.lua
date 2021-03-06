UProjectileMovementComponent = {} ---@type UMovementComponent
UProjectileMovementComponent.InitialSpeed = nil
UProjectileMovementComponent.MaxSpeed = nil
UProjectileMovementComponent.bRotationFollowsVelocity = nil
UProjectileMovementComponent.bRotationRemainsVertical = nil
UProjectileMovementComponent.bShouldBounce = nil
UProjectileMovementComponent.bInitialVelocityInLocalSpace = nil
UProjectileMovementComponent.bForceSubStepping = nil
UProjectileMovementComponent.bSimulationEnabled = nil
UProjectileMovementComponent.bSweepCollision = nil
UProjectileMovementComponent.bIsHomingProjectile = nil
UProjectileMovementComponent.bBounceAngleAffectsFriction = nil
UProjectileMovementComponent.bIsSliding = nil
UProjectileMovementComponent.bInterpMovement = nil
UProjectileMovementComponent.bInterpRotation = nil
UProjectileMovementComponent.PreviousHitTime = nil
UProjectileMovementComponent.PreviousHitNormal = nil
UProjectileMovementComponent.ProjectileGravityScale = nil
UProjectileMovementComponent.Buoyancy = nil
UProjectileMovementComponent.Bounciness = nil
UProjectileMovementComponent.Friction = nil
UProjectileMovementComponent.BounceVelocityStopSimulatingThreshold = nil
UProjectileMovementComponent.MinFrictionFraction = nil
UProjectileMovementComponent.OnProjectileBounce = nil
UProjectileMovementComponent.OnProjectileStop = nil
UProjectileMovementComponent.HomingAccelerationMagnitude = nil
UProjectileMovementComponent.HomingTargetComponent = nil
UProjectileMovementComponent.MaxSimulationTimeStep = nil
UProjectileMovementComponent.MaxSimulationIterations = nil
UProjectileMovementComponent.BounceAdditionalIterations = nil
UProjectileMovementComponent.InterpLocationTime = nil
UProjectileMovementComponent.InterpRotationTime = nil
UProjectileMovementComponent.InterpLocationMaxLagDistance = nil
UProjectileMovementComponent.InterpLocationSnapToTargetDistance = nil
function UProjectileMovementComponent.IsVelocityUnderSimulationThreshold() end
function UProjectileMovementComponent.SetVelocityInLocalSpace(NewVelocity) end
function UProjectileMovementComponent.StopSimulating(HitResult) end
function UProjectileMovementComponent.SetInterpolatedComponent(Component) end
function UProjectileMovementComponent.MoveInterpolationTarget(NewLocation, NewRotation) end
function UProjectileMovementComponent.ResetInterpolation() end
function UProjectileMovementComponent.IsInterpolationComplete() end
function UProjectileMovementComponent.LimitVelocity(NewVelocity) end
