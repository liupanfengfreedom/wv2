UEditableText = {} ---@type UWidget
UEditableText.Text = nil
UEditableText.TextDelegate = nil
UEditableText.HintText = nil
UEditableText.HintTextDelegate = nil
UEditableText.WidgetStyle = nil
UEditableText.Style_DEPRECATED = nil
UEditableText.BackgroundImageSelected_DEPRECATED = nil
UEditableText.BackgroundImageComposing_DEPRECATED = nil
UEditableText.CaretImage_DEPRECATED = nil
UEditableText.Font_DEPRECATED = nil
UEditableText.ColorAndOpacity_DEPRECATED = nil
UEditableText.IsReadOnly = nil
UEditableText.IsPassword = nil
UEditableText.MinimumDesiredWidth = nil
UEditableText.IsCaretMovedWhenGainFocus = nil
UEditableText.SelectAllTextWhenFocused = nil
UEditableText.RevertTextOnEscape = nil
UEditableText.ClearKeyboardFocusOnCommit = nil
UEditableText.SelectAllTextOnCommit = nil
UEditableText.AllowContextMenu = nil
UEditableText.KeyboardType = nil
UEditableText.VirtualKeyboardOptions = nil
UEditableText.VirtualKeyboardDismissAction = nil
UEditableText.Justification = nil
UEditableText.ShapedTextOptions = nil
UEditableText.OnTextChanged = nil
UEditableText.OnTextCommitted = nil
function UEditableText.GetText() end
function UEditableText.SetText(InText) end
function UEditableText.SetIsPassword(InbIsPassword) end
function UEditableText.SetHintText(InHintText) end
function UEditableText.SetIsReadOnly(InbIsReadyOnly) end
function UEditableText.SetJustification(InJustification) end
