local arui= {}
function arui.f1()
    print('99999999999999999999999')
end
arui.ui=slua.loadUI('/Appplugin/UMG/arui.arui',gworld);--WidgetBlueprint'/Appplugin/UMG/arui.arui'
arui.indicatorui=slua.loadUI('/Game/Assets/UI/ARtishi.ARtishi',gworld);--WidgetBlueprint'/Appplugin/UMG/arui.arui'
local caindicatorclosebutton  = arui.indicatorui['Button_1733']
caindicatorclosebutton.OnClicked:Add(function()---back
	arui.indicatorui:RemoveFromViewport()
end);

Onimagedetected = slua.createDelegate(
	 function(str)
		arui_global.addcharactorlist()
	 end
)
MessageMiddlewareLibrary.addmessagelistener(arui.ui,KeyMap.key_onarcharactorspawn,Onimagedetected)



local charactorlist = nil
local btn = arui.ui["Button_164"]---@type UButton   
local btn1 = arui.ui["Button"]---@type UButton
local canvaspanel = arui.ui["CanvasPanel_0"]
btn.OnClicked:Add(function()---back

end);
btn1.OnClicked:Add(function()---modelview
	ARBlueprintLibrary.StopARSession()
	local exhibitionclass = slua.loadClass("Blueprint'/ModelViewer/BpExhibition.BpExhibition'")
	local Vector = FVector(0,0,160)
	local Rotator = FRotator(0,0,0)
	BPExhibition = gworld:SpawnActor(exhibitionclass,Vector,Rotator,nil)

    arui_global.ui:RemoveFromViewport()
    modelui_global.ui:AddToViewport(0)
    modelui_global.addcharactorlist()
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[1].levelpath)
	BParpawn:destroy()
	charactorlist:RemoveFromViewport()

end);

function arui.addcharactorlist()
	-- WidgetBlueprint'/Appplugin/UMG/univerallist/horizontalscrollbox.horizontalscrollbox'
	if(charactorlist==nil)
	then
		charactorlist = slua.loadUI('/Appplugin/UMG/univerallist/horizontalscrollbox.horizontalscrollbox',gworld);
	end

	local canvaspanelslot = canvaspanel:AddChildToCanvas(charactorlist)---@type UCanvasPanelSlot

	local Vector2D = import('Vector2D')
	local InMaximumAnchors = Vector2D()
	InMaximumAnchors.X = 0.5
	InMaximumAnchors.Y = 1
	canvaspanelslot:SetMaximum(InMaximumAnchors)
	local InMinimumAnchors = Vector2D()
	InMinimumAnchors.X = 0.5
	InMinimumAnchors.Y = 1
	canvaspanelslot:SetMinimum(InMinimumAnchors)

	local size = Vector2D()
	size.X = 1080
	size.Y = 300
	canvaspanelslot:SetSize(size)
	local alignment = Vector2D()
	alignment.X = 0.5
	alignment.Y = 1
	local position = Vector2D()
	position.X = 0
	position.Y = -100
	canvaspanelslot:SetAlignment(alignment)
	canvaspanelslot:SetPosition(position)
	local mScrollbox  = charactorlist['mScrollbox']---@type UScrollBox
	mScrollbox:ClearChildren()
	mScrollbox:SetOrientation(0)
	mScrollbox:SetScrollBarVisibility(2)
	local buttondatabase={}
	for _,v in pairs(character_category1.payload[1].AnimSequences)
	do
		local fixbutton=slua.loadUI('/Appplugin/UMG/univerallist/fixbuttonv1.fixbuttonv1',gworld);
		local fixbuttonimage = fixbutton["m_image"]---@type UImage
		local fixbuttonimageselected = fixbutton["m_imageselected"]---@type UImage
		local mbutton = fixbutton["m_button"]---@type UButton
		buttondatabase[fixbutton] = {_,v,mbutton,fixbuttonimageselected}--bind information to button
		mbutton.OnClicked:Add(function() 
				local datainfor = buttondatabase[fixbutton][2]
				characterindex = buttondatabase[fixbutton][1]--track current selected character index
				print(characterindex)
				for _i,vi in pairs(buttondatabase)--travel all button
				do
					local InBackgroundColor = FLinearColor(1,1,1,0)
					InBackgroundColor.R =1
					InBackgroundColor.G =1
					InBackgroundColor.B =1
					InBackgroundColor.A =0
					-- vi[3]:SetBackgroundColor(InBackgroundColor)-- deselecte all
				    vi[4]:SetColorAndOpacity(InBackgroundColor)
				    -- Slua_BlueprintFunctionLibrary.ImagesetTexture(vi[4],nil)
					
				end
				local InBackgroundColor = FLinearColor(1,1,1,1)
				InBackgroundColor.R =1
				InBackgroundColor.G =1
				InBackgroundColor.B =1
				InBackgroundColor.A =1
				-- mbutton:SetBackgroundColor(InBackgroundColor)--indicate select this one
				local buttonimageselected = slua.loadObject(character_category1.buttonselected)
				Slua_BlueprintFunctionLibrary.ImagesetTexture(fixbuttonimageselected,buttonimageselected)
				fixbuttonimageselected:SetColorAndOpacity(InBackgroundColor)
				MessageMiddlewareLibrary.sendmessage(KeyMap.key_changecharateranimation,datainfor.animsequence)
		end);
		local buttonimage = slua.loadObject(v.imagesource)
		Slua_BlueprintFunctionLibrary.ImagesetTexture(fixbuttonimage,buttonimage)
		local scrollboxslot = mScrollbox:AddChild(fixbutton)---@type UScrollBoxSlot
		local Margin = import('Margin')
        margin = Margin()
        margin.Bottom=5
        margin.Left=20
        margin.Right=20
        margin.Top=5
		scrollboxslot:SetPadding(margin)
		scrollboxslot:SetHorizontalAlignment(2)
		scrollboxslot:SetVerticalAlignment(0)
	end
end
return arui