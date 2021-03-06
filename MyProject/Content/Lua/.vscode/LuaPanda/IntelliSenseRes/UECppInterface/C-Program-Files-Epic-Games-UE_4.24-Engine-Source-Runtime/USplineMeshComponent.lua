USplineMeshComponent = {} ---@type UStaticMeshComponent
USplineMeshComponent.SplineParams = nil
USplineMeshComponent.SplineUpDir = nil
USplineMeshComponent.SplineBoundaryMin = nil
USplineMeshComponent.CachedMeshBodySetupGuid = nil
USplineMeshComponent.BodySetup = nil
USplineMeshComponent.SplineBoundaryMax = nil
USplineMeshComponent.bAllowSplineEditingPerInstance = nil
USplineMeshComponent.bSmoothInterpRollScale = nil
USplineMeshComponent.bMeshDirty = nil
USplineMeshComponent.ForwardAxis = nil
USplineMeshComponent.VirtualTextureMainPassMaxDrawDistance = nil
USplineMeshComponent.bSelected = nil
function USplineMeshComponent.UpdateMesh() end
function USplineMeshComponent.GetStartPosition() end
function USplineMeshComponent.SetStartPosition(StartPos) end
function USplineMeshComponent.GetStartTangent() end
function USplineMeshComponent.SetStartTangent(StartTangent) end
function USplineMeshComponent.GetEndPosition() end
function USplineMeshComponent.SetEndPosition(EndPos) end
function USplineMeshComponent.GetEndTangent() end
function USplineMeshComponent.SetEndTangent(EndTangent) end
function USplineMeshComponent.SetStartAndEnd(StartPos, StartTangent, EndPos, EndTangent) end
function USplineMeshComponent.GetStartScale() end
function USplineMeshComponent.SetStartScale() end
function USplineMeshComponent.GetStartRoll() end
function USplineMeshComponent.SetStartRoll(StartRoll) end
function USplineMeshComponent.GetStartOffset() end
function USplineMeshComponent.SetStartOffset(StartOffset) end
function USplineMeshComponent.GetEndScale() end
function USplineMeshComponent.SetEndScale() end
function USplineMeshComponent.GetEndRoll() end
function USplineMeshComponent.SetEndRoll(EndRoll) end
function USplineMeshComponent.GetEndOffset() end
function USplineMeshComponent.SetEndOffset(EndOffset) end
function USplineMeshComponent.GetForwardAxis() end
function USplineMeshComponent.SetForwardAxis(InForwardAxis) end
function USplineMeshComponent.GetSplineUpDir() end
function USplineMeshComponent.SetSplineUpDir(InSplineUpDir) end
function USplineMeshComponent.GetBoundaryMin() end
function USplineMeshComponent.SetBoundaryMin(InBoundaryMin) end
function USplineMeshComponent.GetBoundaryMax() end
function USplineMeshComponent.SetBoundaryMax(InBoundaryMax) end
