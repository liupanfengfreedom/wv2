UGeometryCollectionComponent = {} ---@type UMeshComponent
UGeometryCollectionComponent.ChaosSolverActor = nil
UGeometryCollectionComponent.RestCollection = nil
UGeometryCollectionComponent.InitializationFields = nil
UGeometryCollectionComponent.Simulating = nil
UGeometryCollectionComponent.ObjectType = nil
UGeometryCollectionComponent.EnableClustering = nil
UGeometryCollectionComponent.ClusterGroupIndex = nil
UGeometryCollectionComponent.MaxClusterLevel = nil
UGeometryCollectionComponent.DamageThreshold = nil
UGeometryCollectionComponent.ClusterConnectionType = nil
UGeometryCollectionComponent.CollisionGroup = nil
UGeometryCollectionComponent.CollisionSampleFraction = nil
UGeometryCollectionComponent.PhysicalMaterial = nil
UGeometryCollectionComponent.InitialVelocityType = nil
UGeometryCollectionComponent.InitialLinearVelocity = nil
UGeometryCollectionComponent.InitialAngularVelocity = nil
UGeometryCollectionComponent.CacheParameters = nil
UGeometryCollectionComponent.NotifyGeometryCollectionPhysicsStateChange = nil
UGeometryCollectionComponent.NotifyGeometryCollectionPhysicsLoadingStateChange = nil
UGeometryCollectionComponent.OnChaosBreakEvent = nil
UGeometryCollectionComponent.DesiredCacheTime = nil
UGeometryCollectionComponent.CachePlayback = nil
UGeometryCollectionComponent.OnChaosPhysicsCollision = nil
UGeometryCollectionComponent.bNotifyBreaks = nil
UGeometryCollectionComponent.bNotifyCollisions = nil
UGeometryCollectionComponent.SelectedBones = nil
UGeometryCollectionComponent.HighlightedBones = nil
UGeometryCollectionComponent.DummyBodySetup = nil
UGeometryCollectionComponent.EditorActor = nil
function UGeometryCollectionComponent.ApplyKinematicField(Radius, Position) end
function UGeometryCollectionComponent.ApplyPhysicsField(Enabled, Target, MetaData, Field) end
function UGeometryCollectionComponent.SetNotifyBreaks(bNewNotifyBreaks) end
function UGeometryCollectionComponent.ReceivePhysicsCollision(CollisionInfo) end
