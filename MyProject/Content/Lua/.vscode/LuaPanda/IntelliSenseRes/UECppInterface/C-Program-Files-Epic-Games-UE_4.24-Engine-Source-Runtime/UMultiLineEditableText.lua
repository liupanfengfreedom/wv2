UMultiLineEditableText = {} ---@type UTextLayoutWidget
UMultiLineEditableText.Text = nil
UMultiLineEditableText.HintText = nil
UMultiLineEditableText.HintTextDelegate = nil
UMultiLineEditableText.WidgetStyle = nil
UMultiLineEditableText.bIsReadOnly = nil
UMultiLineEditableText.Font_DEPRECATED = nil
UMultiLineEditableText.SelectAllTextWhenFocused = nil
UMultiLineEditableText.ClearTextSelectionOnFocusLoss = nil
UMultiLineEditableText.RevertTextOnEscape = nil
UMultiLineEditableText.ClearKeyboardFocusOnCommit = nil
UMultiLineEditableText.AllowContextMenu = nil
UMultiLineEditableText.VirtualKeyboardOptions = nil
UMultiLineEditableText.VirtualKeyboardDismissAction = nil
UMultiLineEditableText.OnTextChanged = nil
UMultiLineEditableText.OnTextCommitted = nil
function UMultiLineEditableText.GetText() end
function UMultiLineEditableText.SetText(InText) end
function UMultiLineEditableText.GetHintText() end
function UMultiLineEditableText.SetHintText(InHintText) end
function UMultiLineEditableText.SetIsReadOnly(bReadOnly) end
function UMultiLineEditableText.SetWidgetStyle(InWidgetStyle) end