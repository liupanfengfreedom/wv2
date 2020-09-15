local modelviewui= {}
function modelviewui.f1()
	print("0000000000000000000000000000000000000000000")
end
modelviewui.ui=slua.loadUI('/Appplugin/UMG/modelviewui.modelviewui',gworld);--WidgetBlueprint'/Appplugin/UMG/modelviewui.modelviewui'
modelviewui.indicatorui=slua.loadUI('/Game/Assets/UI/3Dtishi.3Dtishi',gworld);--WidgetBlueprint'/Game/Assets/UI/3Dtishi.3Dtishi'


local btn = modelviewui.ui["Button_164"]---@type UButton   
local btn1 = modelviewui.ui["Button"]---@type UButton
local canvaspanel = modelviewui.ui["CanvasPanel_0"]

local caindicatorclosebutton  = modelviewui.indicatorui['Button_1733']
caindicatorclosebutton.OnClicked:Add(function()---back
	modelviewui.indicatorui:RemoveFromViewport()
end);
btn.OnClicked:Add(function()---back

end);
btn1.OnClicked:Add(function()---ar
	BPExhibition:destroy()
    modelui_global.ui:RemoveFromViewport()
	arui_global.ui:AddToViewport(0)
	if(not arui_global.indicatorui['bhasshow'])
	then
		arui_global.indicatorui:AddToViewport(0)
		arui_global.indicatorui['bhasshow']=true
	end
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[2].levelpath)

    local arconfig = slua.loadObject(ARconfig[1])
	ARBlueprintLibrary.StartARSession(arconfig)
	local arpawnclass = slua.loadClass("Blueprint'/ModelViewer/HandheldARBP/Blueprints/GameFramework/BP_ARPawn.BP_ARPawn'")
	local Vector = FVector(0,0,0)
	local Rotator = FRotator(0,0,0)
	BParpawn = gworld:SpawnActor(arpawnclass,Vector,Rotator,nil)
	BParpawn:setcheckplane(true)


end);
local charactorlist = nil
function modelviewui.addcharactorlist()
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
	position.Y = -170
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
return modelviewui