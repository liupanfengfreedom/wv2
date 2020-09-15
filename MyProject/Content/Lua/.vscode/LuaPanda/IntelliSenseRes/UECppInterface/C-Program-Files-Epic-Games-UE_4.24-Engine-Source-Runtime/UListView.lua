UListView = {} ---@type UListViewBase
UListView.Orientation = nil
UListView.SelectionMode = nil
UListView.ConsumeMouseWheel = nil
UListView.bClearSelectionOnClick = nil
UListView.bIsFocusable = nil
UListView.EntrySpacing = nil
UListView.bReturnFocusToSelection = nil
UListView.ListItems = nil
UListView.BP_OnEntryInitialized = nil
UListView.BP_OnItemClicked = nil
UListView.BP_OnItemDoubleClicked = nil
UListView.BP_OnItemIsHoveredChanged = nil
UListView.BP_OnItemSelectionChanged = nil
UListView.BP_OnItemScrolledIntoView = nil
function UListView.GetListItems() end
function UListView.AddItem(Item) end
function UListView.RemoveItem(Item) end
function UListView.GetItemAt(Index) end
function UListView.GetNumItems() end
function UListView.GetIndexForItem(Item) end
function UListView.ClearListItems() end
function UListView.SetSelectionMode(SelectionMode) end
function UListView.IsRefreshPending() end
function UListView.ScrollIndexIntoView(Index) end
function UListView.SetSelectedIndex(Index) end
function UListView.NavigateToIndex(Index) end
function UListView.BP_SetSelectedItem(Item) end
function UListView.BP_SetItemSelection(Item, bSelected) end
function UListView.BP_ClearSelection() end
function UListView.BP_GetNumItemsSelected() end
function UListView.BP_GetSelectedItems(Items) end
function UListView.BP_IsItemVisible(Item) end
function UListView.BP_NavigateToItem(Item) end
function UListView.BP_ScrollItemIntoView(Item) end
function UListView.BP_CancelScrollIntoView() end
function UListView.BP_SetListItems(InListItems) end
function UListView.BP_GetSelectedItem() end
