UWidget = {} ---@type UVisual
UWidget.Slot = nil
UWidget.bIsEnabledDelegate = nil
UWidget.ToolTipText = nil
UWidget.ToolTipTextDelegate = nil
UWidget.ToolTipWidget = nil
UWidget.ToolTipWidgetDelegate = nil
UWidget.VisibilityDelegate = nil
UWidget.RenderTransform = nil
UWidget.RenderTransformPivot = nil
UWidget.bIsVariable = nil
UWidget.bCreatedByConstructionScript = nil
UWidget.bIsEnabled = nil
UWidget.bOverride_Cursor = nil
UWidget.bOverrideAccessibleDefaults = nil
UWidget.bCanChildrenBeAccessible = nil
UWidget.AccessibleBehavior = nil
UWidget.AccessibleSummaryBehavior = nil
UWidget.AccessibleText = nil
UWidget.AccessibleTextDelegate = nil
UWidget.AccessibleSummaryText = nil
UWidget.AccessibleSummaryTextDelegate = nil
UWidget.AccessibleWidgetData = nil
UWidget.bIsVolatile = nil
UWidget.bHiddenInDesigner = nil
UWidget.bExpandedInDesigner = nil
UWidget.bLockedInDesigner = nil
UWidget.Cursor = nil
UWidget.Clipping = nil
UWidget.Visibility = nil
UWidget.RenderOpacity = nil
UWidget.Navigation = nil
UWidget.FlowDirectionPreference = nil
UWidget.NativeBindings = nil
UWidget.DesignerFlags = nil
UWidget.DisplayLabel = nil
UWidget.CategoryName = nil
function UWidget.SetRenderTransform(InTransform) end
function UWidget.SetRenderScale(Scale) end
function UWidget.SetRenderShear(Shear) end
function UWidget.SetRenderTransformAngle(Angle) end
function UWidget.GetRenderTransformAngle() end
function UWidget.SetRenderTranslation(Translation) end
function UWidget.SetRenderTransformPivot(Pivot) end
function UWidget.GetIsEnabled() end
function UWidget.SetIsEnabled(bInIsEnabled) end
function UWidget.SetToolTipText(InToolTipText) end
function UWidget.SetToolTip(Widget) end
function UWidget.SetCursor(InCursor) end
function UWidget.ResetCursor() end
function UWidget.IsVisible() end
function UWidget.GetVisibility() end
function UWidget.SetVisibility(InVisibility) end
function UWidget.GetRenderOpacity() end
function UWidget.SetRenderOpacity(InOpacity) end
function UWidget.GetClipping() end
function UWidget.SetClipping(InClipping) end
function UWidget.ForceVolatile(bForce) end
function UWidget.IsHovered() end
function UWidget.HasKeyboardFocus() end
function UWidget.HasMouseCapture() end
function UWidget.HasMouseCaptureByUser(UserIndex) end
function UWidget.SetKeyboardFocus() end
function UWidget.HasUserFocus(PlayerController) end
function UWidget.HasAnyUserFocus() end
function UWidget.HasFocusedDescendants() end
function UWidget.HasUserFocusedDescendants(PlayerController) end
function UWidget.SetFocus() end
function UWidget.SetUserFocus(PlayerController) end
function UWidget.ForceLayoutPrepass() end
function UWidget.InvalidateLayoutAndVolatility() end
function UWidget.GetDesiredSize() end
function UWidget.SetAllNavigationRules(Rule, WidgetToFocus) end
function UWidget.SetNavigationRule(Direction, Rule, WidgetToFocus) end
function UWidget.SetNavigationRuleBase(Direction, Rule) end
function UWidget.SetNavigationRuleExplicit(Direction, InWidget) end
function UWidget.SetNavigationRuleCustom(Direction, InCustomDelegate) end
function UWidget.SetNavigationRuleCustomBoundary(Direction, InCustomDelegate) end
function UWidget.GetParent() end
function UWidget.RemoveFromParent() end
function UWidget.GetCachedGeometry() end
function UWidget.GetTickSpaceGeometry() end
function UWidget.GetPaintSpaceGeometry() end
function UWidget.GetGameInstance() end
function UWidget.GetOwningPlayer() end
function UWidget.GetOwningLocalPlayer() end