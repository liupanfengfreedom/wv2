USlateBlueprintLibrary = {} ---@type UBlueprintFunctionLibrary
function USlateBlueprintLibrary.IsUnderLocation(Geometry, AbsoluteCoordinate) end
function USlateBlueprintLibrary.AbsoluteToLocal(Geometry, AbsoluteCoordinate) end
function USlateBlueprintLibrary.LocalToAbsolute(Geometry, LocalCoordinate) end
function USlateBlueprintLibrary.GetLocalTopLeft(Geometry) end
function USlateBlueprintLibrary.GetLocalSize(Geometry) end
function USlateBlueprintLibrary.GetAbsoluteSize(Geometry) end
function USlateBlueprintLibrary.TransformScalarAbsoluteToLocal(Geometry, AbsoluteScalar) end
function USlateBlueprintLibrary.TransformScalarLocalToAbsolute(Geometry, LocalScalar) end
function USlateBlueprintLibrary.TransformVectorAbsoluteToLocal(Geometry, AbsoluteVector) end
function USlateBlueprintLibrary.TransformVectorLocalToAbsolute(Geometry, LocalVector) end
function USlateBlueprintLibrary.EqualEqual_SlateBrush(A, B) end
function USlateBlueprintLibrary.LocalToViewport(WorldContextObject, Geometry, LocalCoordinate, PixelPosition, ViewportPosition) end
function USlateBlueprintLibrary.AbsoluteToViewport(WorldContextObject, AbsoluteDesktopCoordinate, PixelPosition, ViewportPosition) end
function USlateBlueprintLibrary.ScreenToWidgetLocal(WorldContextObject, Geometry, ScreenPosition, LocalCoordinate) end
function USlateBlueprintLibrary.ScreenToWidgetAbsolute(WorldContextObject, ScreenPosition, AbsoluteCoordinate) end
function USlateBlueprintLibrary.ScreenToViewport(WorldContextObject, ScreenPosition, ViewportPosition) end
