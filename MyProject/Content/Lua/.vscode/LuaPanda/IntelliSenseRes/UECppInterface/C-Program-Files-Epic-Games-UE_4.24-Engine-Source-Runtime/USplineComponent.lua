USplineComponent = {} ---@type UPrimitiveComponent
USplineComponent.SplineCurves = nil
USplineComponent.SplineInfo_DEPRECATED = nil
USplineComponent.SplineRotInfo_DEPRECATED = nil
USplineComponent.SplineScaleInfo_DEPRECATED = nil
USplineComponent.SplineReparamTable_DEPRECATED = nil
USplineComponent.bAllowSplineEditingPerInstance_DEPRECATED = nil
USplineComponent.ReparamStepsPerSegment = nil
USplineComponent.Duration = nil
USplineComponent.bStationaryEndpoints = nil
USplineComponent.bSplineHasBeenEdited = nil
USplineComponent.bModifiedByConstructionScript = nil
USplineComponent.bInputSplinePointsToConstructionScript = nil
USplineComponent.bDrawDebug = nil
USplineComponent.bClosedLoop = nil
USplineComponent.bLoopPositionOverride = nil
USplineComponent.LoopPosition = nil
USplineComponent.DefaultUpVector = nil
USplineComponent.EditorUnselectedSplineSegmentColor = nil
USplineComponent.EditorSelectedSplineSegmentColor = nil
USplineComponent.bAllowDiscontinuousSpline = nil
USplineComponent.bShouldVisualizeScale = nil
USplineComponent.ScaleVisualizationWidth = nil
function USplineComponent.UpdateSpline() end
function USplineComponent.GetLocationAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetTangentAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetDirectionAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetRotationAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetUpVectorAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetRightVectorAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetTransformAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetRollAtSplineInputKey(InKey, CoordinateSpace) end
function USplineComponent.GetScaleAtSplineInputKey(InKey) end
function USplineComponent.GetFloatPropertyAtSplineInputKey(InKey, PropertyName) end
function USplineComponent.GetVectorPropertyAtSplineInputKey(InKey, PropertyName) end
function USplineComponent.SetUnselectedSplineSegmentColor(SegmentColor) end
function USplineComponent.SetSelectedSplineSegmentColor(SegmentColor) end
function USplineComponent.SetDrawDebug(bShow) end
function USplineComponent.SetClosedLoop(bInClosedLoop) end
function USplineComponent.SetClosedLoopAtPosition(bInClosedLoop, Key) end
function USplineComponent.IsClosedLoop() end
function USplineComponent.ClearSplinePoints() end
function USplineComponent.AddPoint(Point) end
function USplineComponent.AddPoints(Points) end
function USplineComponent.AddSplinePoint(Position, CoordinateSpace) end
function USplineComponent.AddSplinePointAtIndex(Position, Index, CoordinateSpace) end
function USplineComponent.RemoveSplinePoint(Index) end
function USplineComponent.AddSplineWorldPoint(Position) end
function USplineComponent.AddSplineLocalPoint(Position) end
function USplineComponent.SetSplinePoints(Points, CoordinateSpace) end
function USplineComponent.SetSplineWorldPoints(Points) end
function USplineComponent.SetSplineLocalPoints(Points) end
function USplineComponent.SetLocationAtSplinePoint(PointIndex, InLocation, CoordinateSpace) end
function USplineComponent.SetWorldLocationAtSplinePoint(PointIndex, InLocation) end
function USplineComponent.SetTangentAtSplinePoint(PointIndex, InTangent, CoordinateSpace) end
function USplineComponent.SetTangentsAtSplinePoint(PointIndex, InArriveTangent, InLeaveTangent, CoordinateSpace) end
function USplineComponent.SetUpVectorAtSplinePoint(PointIndex, InUpVector, CoordinateSpace) end
function USplineComponent.GetSplinePointType(PointIndex) end
function USplineComponent.SetSplinePointType(PointIndex, Type) end
function USplineComponent.GetNumberOfSplinePoints() end
function USplineComponent.GetNumberOfSplineSegments() end
function USplineComponent.GetLocationAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetWorldLocationAtSplinePoint(PointIndex) end
function USplineComponent.GetDirectionAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetTangentAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetArriveTangentAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetLeaveTangentAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetRotationAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetUpVectorAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetRightVectorAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetRollAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetScaleAtSplinePoint(PointIndex) end
function USplineComponent.GetTransformAtSplinePoint(PointIndex, CoordinateSpace) end
function USplineComponent.GetLocationAndTangentAtSplinePoint(PointIndex, Location, Tangent, CoordinateSpace) end
function USplineComponent.GetLocalLocationAndTangentAtSplinePoint(PointIndex, LocalLocation, LocalTangent) end
function USplineComponent.GetDistanceAlongSplineAtSplinePoint(PointIndex) end
function USplineComponent.GetFloatPropertyAtSplinePoint(Index, PropertyName) end
function USplineComponent.GetVectorPropertyAtSplinePoint(Index, PropertyName) end
function USplineComponent.GetSplineLength() end
function USplineComponent.SetDefaultUpVector(UpVector, CoordinateSpace) end
function USplineComponent.GetDefaultUpVector(CoordinateSpace) end
function USplineComponent.GetInputKeyAtDistanceAlongSpline(Distance) end
function USplineComponent.GetLocationAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetWorldLocationAtDistanceAlongSpline(Distance) end
function USplineComponent.GetDirectionAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetWorldDirectionAtDistanceAlongSpline(Distance) end
function USplineComponent.GetTangentAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetWorldTangentAtDistanceAlongSpline(Distance) end
function USplineComponent.GetRotationAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetWorldRotationAtDistanceAlongSpline(Distance) end
function USplineComponent.GetUpVectorAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetRightVectorAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetRollAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetScaleAtDistanceAlongSpline(Distance) end
function USplineComponent.GetTransformAtDistanceAlongSpline(Distance, CoordinateSpace) end
function USplineComponent.GetLocationAtTime(Time, CoordinateSpace) end
function USplineComponent.GetWorldLocationAtTime(Time) end
function USplineComponent.GetDirectionAtTime(Time, CoordinateSpace) end
function USplineComponent.GetWorldDirectionAtTime(Time) end
function USplineComponent.GetTangentAtTime(Time, CoordinateSpace) end
function USplineComponent.GetRotationAtTime(Time, CoordinateSpace) end
function USplineComponent.GetWorldRotationAtTime(Time) end
function USplineComponent.GetUpVectorAtTime(Time, CoordinateSpace) end
function USplineComponent.GetRightVectorAtTime(Time, CoordinateSpace) end
function USplineComponent.GetTransformAtTime(Time, CoordinateSpace) end
function USplineComponent.GetRollAtTime(Time, CoordinateSpace) end
function USplineComponent.GetScaleAtTime(Time) end
function USplineComponent.FindInputKeyClosestToWorldLocation(WorldLocation) end
function USplineComponent.FindLocationClosestToWorldLocation(WorldLocation, CoordinateSpace) end
function USplineComponent.FindDirectionClosestToWorldLocation(WorldLocation, CoordinateSpace) end
function USplineComponent.FindTangentClosestToWorldLocation(WorldLocation, CoordinateSpace) end
function USplineComponent.FindRotationClosestToWorldLocation(WorldLocation, CoordinateSpace) end
function USplineComponent.FindUpVectorClosestToWorldLocation(WorldLocation, CoordinateSpace) end
function USplineComponent.FindRightVectorClosestToWorldLocation(WorldLocation, CoordinateSpace) end
function USplineComponent.FindRollClosestToWorldLocation(WorldLocation, CoordinateSpace) end
function USplineComponent.FindScaleClosestToWorldLocation(WorldLocation) end
function USplineComponent.FindTransformClosestToWorldLocation(WorldLocation, CoordinateSpace) end
