require 'datainfor'
require 'keymap'
-- require "appglobal"
-- modelui_global.f1()
-- arui_global.f1()

-- modelui_global.ui:AddToViewport(0)
-- modelui_global.indicatorui:AddToViewport(0)
-- modelui_global.addcharactorlist()
-- local exhibitionclass = slua.loadClass("Blueprint'/ModelViewer/BpExhibition.BpExhibition'")
-- local Vector = FVector(0,0,160)
-- local Rotator = FRotator(0,0,0)
-- BPExhibition = gworld:SpawnActor(exhibitionclass,Vector,Rotator,nil)

-- MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[1].levelpath)
-- MediaPlayer'/Game/NewFolder/NewMediaPlayer.NewMediaPlayer'
--WidgetBlueprint'/Game/Assets/UI/Ui.Ui'
mainui=slua.loadUI('/Game/Assets/UI/Ui.Ui',gworld);--WidgetBlueprint'/Appplugin/UMG/arui.arui'
mainui:AddToViewport(0)
EFDFunctionLibrary = import('EFDFunctionLibrary')	
local colorpalette = mainui['Button_147']---@type UButton   

colorpalette.OnPressed:Add(function(geo,mouseevent)---onsamplecolor

    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onsamplecolor,'1')
end);
colorpalette.OnReleased:Add(function(geo,mouseevent)---onsamplecolor

    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onsamplecolor,'0')
end);
local colorpalette1 = mainui['Button_50']---@type UButton   
colorpalette1.OnPressed:Add(function(geo,mouseevent)---onsamplecolor

    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onsamplecolor1,'1')
end);
colorpalette1.OnReleased:Add(function(geo,mouseevent)---onsamplecolor

    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onsamplecolor1,'0')
end);


local btn = mainui["Button_11"]---@type UButton   
local btn1 = mainui["Button_12"]---@type UButton   
local btn2 = mainui["Button_1933"]---@type UButton   

local btnlevel1 = mainui["Button_1633"]---@type UButton   
local btnlevel2 = mainui["Button_111"]---@type UButton   
local btnlevel3 = mainui["Button_666"]---@type UButton   
local btnlevel4 = mainui["Button_77"]---@type UButton   
local btnlevel5 = mainui["Button_8"]---@type UButton   

local btn5 = mainui["Button_6"]---@type UButton
local btn6 = mainui["Button_7"]---@type UButton
local spinbox1 = mainui["SpinBox_188"]---@type USpinBox
local spinbox2 = mainui["SpinBox"]---@type USpinBox
local spinbox3 = mainui["SpinBox_1"]---@type USpinBox
local spinbox4 = mainui["SpinBox_2"]---@type USpinBox
local spinbox5 = mainui["SpinBox_5"]---@type USpinBox

spinbox1.OnValueChanged:Add(function(v)
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onalphacontrolvalue,"1?"..tostring(v))
    local levelname = MessageMiddlewareLibrary.getdatafromblackboard("levelname")
    MessageMiddlewareLibrary.recorddatatoblackboard(levelname.."spinbox1",v)
end)
spinbox2.OnValueChanged:Add(function(v)
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onalphacontrolvalue,"2?"..tostring(v))
    local levelname = MessageMiddlewareLibrary.getdatafromblackboard("levelname")
    MessageMiddlewareLibrary.recorddatatoblackboard(levelname.."spinbox2",v)
end)
spinbox3.OnValueChanged:Add(function(v)
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onalphacontrolvalue,"3?"..tostring(v))
    local levelname = MessageMiddlewareLibrary.getdatafromblackboard("levelname")
    MessageMiddlewareLibrary.recorddatatoblackboard(levelname.."spinbox3",v)
end)
spinbox4.OnValueChanged:Add(function(v)
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onalphacontrolvalue,"4?"..tostring(v))
    local levelname = MessageMiddlewareLibrary.getdatafromblackboard("levelname")
    MessageMiddlewareLibrary.recorddatatoblackboard(levelname.."spinbox4",v)
end)
spinbox5.OnValueChanged:Add(function(v)
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onalphacontrolvalue,"5?"..tostring(v))
    local levelname = MessageMiddlewareLibrary.getdatafromblackboard("levelname")
    MessageMiddlewareLibrary.recorddatatoblackboard(levelname.."emissiveintensity",v)
    ggameinstance:logtoscreen('spinbox5 valuechange',2)
    print("spinbox5 valuechange")
end)
---------------------------------------------------------------------
-------change ad
btn.OnClicked:Add(function()---ad1
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onselectfile,"1")
end);
btn1.OnClicked:Add(function()---ad2
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_onselectfile,"2")
end);
midiaplayerad1 = slua.loadObject("MediaPlayer'/Game/video_ad/advideo1.advideo1'")---@type UMediaPlayer
midiaplayerad2 = slua.loadObject("MediaPlayer'/Game/video_ad/advideo2.advideo2'")---@type UMediaPlayer
midiasource1 = slua.loadObject("FileMediaSource'/Game/Movies/01.01'")---@type UMediaPlayer
midiasource2 = slua.loadObject("FileMediaSource'/Game/Movies/02.02'")---@type UMediaPlayer
midiaplayerad1:OpenSource(midiasource1)
midiaplayerad2:OpenSource(midiasource2)
function changeadvideo1(url)
    midiaplayerad1:OpenFile(url)
end
function changeadvideo2(url)
    midiaplayerad2:OpenFile(url)
end
-- switchcameracounter=0
-- btn7.OnClicked:Add(function()---switch camera
--     switchcameracounter = switchcameracounter+1
--     MessageMiddlewareLibrary.sendmessage(KeyMap.key_onswitchcamera,switchcameracounter)
--     print(switchcameracounter)
--     -- local files = MyBlueprintFunctionLibrary.getcamerainfor()
-- end);
delaysendkey_onalphacontrolvalue = slua.createDelegate( 
    function(str)
        local v = MessageMiddlewareLibrary.getdatafromblackboard(str.."spinbox1")
        if(v~='')
        then
            spinbox1:SetValue(v)
            ggameinstance:logtoscreen(v,2)
        else
            spinbox1:SetValue('0.0')
        end
        v = MessageMiddlewareLibrary.getdatafromblackboard(str.."spinbox2")
        if(v~='')
        then
            spinbox2:SetValue(v)
            ggameinstance:logtoscreen(v,2)
        else
            spinbox2:SetValue('0.1')
        end
        v = MessageMiddlewareLibrary.getdatafromblackboard(str.."spinbox3")
        if(v~='')
        then
            spinbox3:SetValue(v)
            ggameinstance:logtoscreen(v,2)
        else
            spinbox3:SetValue('0.15')
        end
        v = MessageMiddlewareLibrary.getdatafromblackboard(str.."spinbox4")
        if(v~='')
        then
            spinbox4:SetValue(v)
            ggameinstance:logtoscreen(v,2)
        else
            spinbox4:SetValue('0.0')
        end
        v = MessageMiddlewareLibrary.getdatafromblackboard(str.."emissiveintensity")
        if(v~='')
        then
            spinbox5:SetValue(v)
            ggameinstance:logtoscreen(v,2)
        else
           spinbox5:SetValue('1.0')
        end
      
        -- ggameinstance:logtoscreen(v,2)
        -- print("set value")
    end
)
local function onopennewlevel(levelname)
    MessageMiddlewareLibrary.recorddatatoblackboard("levelname",levelname)
----------------------------------------
    ggameinstance:dosthdelay(
        0.1,
        delaysendkey_onalphacontrolvalue,
        levelname
    )

-------------------------------
end
btnlevel1.OnClicked:Add(function()--background
    if(MessageMiddlewareLibrary.cooler(0.9,"mainuibtn3"))
    then
        return
    end
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[1].levelpath)
    onopennewlevel(backgroundinfors[1].levelpath)
    print("btn3")
end);
btnlevel2.OnClicked:Add(function()---background
    if(MessageMiddlewareLibrary.cooler(0.9,"mainuibtn4"))
    then
        return
    end
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[2].levelpath)
    onopennewlevel(backgroundinfors[2].levelpath)

    print("btn4")
end);
btnlevel3.OnClicked:Add(function()---background
    if(MessageMiddlewareLibrary.cooler(0.9,"mainuibtn4"))
    then
        return
    end
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[3].levelpath)
    onopennewlevel(backgroundinfors[3].levelpath)

    print("btn4")
end);
btnlevel4.OnClicked:Add(function()---background
    if(MessageMiddlewareLibrary.cooler(0.9,"mainuibtn4"))
    then
        return
    end
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[4].levelpath)
    onopennewlevel(backgroundinfors[4].levelpath)

    print("btn4")
end);
-- btnlevel5.OnClicked:Add(function()---background
--     if(MessageMiddlewareLibrary.cooler(0.9,"mainuibtn4"))
--     then
--         return
--     end
--     MessageMiddlewareLibrary.sendmessage(KeyMap.key_changebackground,backgroundinfors[5].levelpath)
--     print("btn4")
-- end);
btn5.OnClicked:Add(function()
    if(MessageMiddlewareLibrary.cooler(0.9,"mainuibtn5"))
    then
        return
    end
    local strplayload = json.encode(characters[1])
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changecharater,strplayload)
end);
btn6.OnClicked:Add(function()
    if(MessageMiddlewareLibrary.cooler(0.9,"mainuibtn6"))
    then
        return
    end
    local strplayload = json.encode(characters[2])
    MessageMiddlewareLibrary.sendmessage(KeyMap.key_changecharater,strplayload)
end);
------------------------------------------------------------------------

-- midiaplayer:OpenFile("D:\\33\\Kouxiang - Copy/1940385_VJshi_67bb3a8c45aa70e4a2f1d8711a5e20b8.mp4")
local files = MyBlueprintFunctionLibrary.getcamerainfor()
for _,v in pairs(files)
do
    print(v)
end
print(midiaplayer)
