; ; MultiMacro V3
; ; We making it out the disconnected screen with this one! 

Version := 3

#Include Routes.ahk
#Include UsefulFunctions.ahk

CoordMode "ToolTip", "Screen"
CoordMode "Mouse", "Screen"
SetMouseDelay -1

RunningMultiInstance := false
CurrentLoadedSetting := 1

Yapping := "Hi"

PositionMap := Map()
PositionMap["TpButtonRedPartTL"] := [130, 357]
PositionMap["TpButtonRedPartBR"] := [196, 421]
PositionMap["TpButtonRedPart"] := FindMedian([PositionMap["TpButtonRedPartBR"], PositionMap["TpButtonRedPartTL"]])
PositionMap["MiniXTL"] := [1259, 232]
PositionMap["MiniXBR"] := [1313, 288]
PositionMap["MiniX"] := FindMedian([PositionMap["MiniXBR"], PositionMap["MiniXTL"]])
PositionMap["XTL"] := [1442, 231]
PositionMap["XBR"] := [1499, 285]
PositionMap["X"] := FindMedian([PositionMap["XBR"], PositionMap["XTL"]])
PositionMap["OptimalPotionBuy"] := [1051, 727]
PositionMap["BackPackButton"] := [417, 398]
PositionMap["SearchBar"] := [1290, 252]
PositionMap["ItemMiddle"] := [518, 413]
PositionMap["StupidCatTL"] := [900, 518]
PositionMap["StupidCatBR"] := [1000, 606]
PositionMap["TopOfGame"] := [950, 35]
PositionMap["FreeGiftButton"] := [60, 390]
PositionMap["DaycareButton"] := [703, 608]
PositionMap["YesButton"] := [800, 719]
PositionMap["DaycareEnrollbutton"] := [964, 749]
PositionMap["DaycarePetButton"] := [1006, 388]
PositionMap["DaycareOKButton"] := [676, 741]
PositionMap["DaycareGreyBG"] := [676, 741]
PositionMap["DisconnectedBackgroundLeftSide"] := [777, 444]
PositionMap["DisconnectedBackgroundRightSide"] := [1143, 442]
PositionMap["ReconnectButton"] := [1050, 597]
PositionMap["EggBuyMax"] := [1191, 721]
PositionMap["AutofarmTL"] := [120, 437]
PositionMap["AutofarmBR"] := [199, 526]
PositionMap["Autofarm"] := FindMedian([PositionMap["AutofarmTL"], PositionMap["AutofarmBR"]])
PositionMap["AutoHatchTL"] := [17, 441]
PositionMap["AutoHatchBR"] := [96, 520]
PositionMap["AutoHatch"] := FindMedian([PositionMap["AutoHatchTL"], PositionMap["AutoHatchBR"]])

PositionMap["MerchantButtonX1"] := 615
PositionMap["MerchantButtonX2"] := 970
PositionMap["MerchantButtonX3"] := 1305
PositionMap["MerchantButtonY1*Y"] := 450
PositionMap["MerchantButtonY2*Y"] := 685

PositionMap["FreeGiftX1"] := 720
PositionMap["FreeGiftX2"] := 875
PositionMap["FreeGiftX3"] := 1040
PositionMap["FreeGiftX4"] := 1205
PositionMap["FreeGiftY1*Y"] := 350
PositionMap["FreeGiftY2*Y"] := 500
PositionMap["FreeGiftY3*Y"] := 630

PositionMap["TpMenuButtonX1"] := 550
PositionMap["TpMenuButtonX2"] := 750
PositionMap["TpMenuButtonX3"] := 960
PositionMap["TpMenuButtonX4"] := 1160
PositionMap["TpMenuButtonX5"] := 1370
PositionMap["TpMenuButtonY1*Y"] := 360
PositionMap["TpMenuButtonY2*Y"] := 550

RBLXInstancesMAP := Map()

MMTogglesMap := Map()
MMTogglesMap["CycleVendingMachines"] := true
MMTogglesMap["CycleMerchants"] := true
MMTogglesMap["ClaimFreeGifts"] := true
MMTogglesMap["FarmFinalZone"] := true
MMTogglesMap["OpenBestEgg"] := true
MMTogglesMap["ConsumeFruits"] := true
MMTogglesMap["AutoFlag"] := true
MMTogglesMap["AutoSprinkler"] := true
MMTogglesMap["UseUltimate"] := true
MMTogglesMap["AutoDaycare"] := true
MMTogglesMap["AutoReconnect"] := true
MMTogglesMap["AutoUseItem"] := true

CVMAP := Map()
CVMAP["SingleVendingMachinePurchase"] := false
CVMAP["CycleDiamondVendingMachines"] := true
CVMAP["CycleUselessMerchants"] := true
CVMAP["UserOwnsAutoFarm"] := true

NVMAP := Map()
NVMAP["VendingMachineTimeOut"] := 4000
NVMAP["StupidCatCheckNum"] := 1
NVMAP["EggBackwardsDistance"] := 1025
NVMAP["LoopTime"] := 600000
NVMAP["TpWaitTime"] := 6000
NVMAP["DistanceIntoFinalZone"] := 650
NVMAP["DelayBetweenItemUse"] := 10000

TVMAP := Map()
TVMAP["ChosenDaycarePet"] := "Cat"
TVMAP["TypeOfFlag"] := "Magnet Flag"
TVMAP["ItemToAutoUse"] := "Lucky Block"

AFKMap := Map()
AFKMap["AfkClickTime"] := 600000

MacroSetup := false
global CurrentPostionLabel := 'nil'
global CurrentWorld := "w0"
global LastZone := 100
global IsPaused := false

W1Vends := Map()
W1Vends["Cherry Blossom"] := R_Zone6
W1Vends["Misty Falls"] := R_Zone9
W1Vends["Mushroom Field"] := R_Zone14
W1Vends["Pirate Cove"] := R_Zone26
W1Vends["Safari"] := R_Zone35
W1Vends["Fire And Ice"] := R_Zone42
W1Vends["Underworld Bridge"] := R_Zone47
W1Vends["Samurai Village"] := R_Zone51
; we dont do 64.

W1Merchants := Map()
W1Merchants["Oasis"] := R_Zone19
W1Merchants["Ice Rink"] := R_Zone39
W1Merchants["Flower Field"] := R_Zone54
W1Merchants["Frost Mountains"] := R_Zone63

W2Vends := Map()
W2Vends["Data Tree Farm"] := R_Zone108
W2Vends["Cyber Cove"] := R_Zone115
W2Vends["Cracked Iceberg"] := R_Zone126
W2Vends["Comet Planet"] := R_Zone138
W2Vends["Neon City"] := R_Zone142

MI_UIS := []

Ids := WinGetList("ahk_exe RobloxPlayerBeta.exe")
for i, v in Ids {
    RBLXInstancesMAP[v] := [i, false, CloneMaps([MMTogglesMap, CVMAP, NVMAP, TVMAP, PositionMap]), "w0", 100, 0]
    ; [InstanceNumber, InstanceUiSettingsActive, InstanceSettings, world ["w0-w1-w2"], CurrentZone, TimeSinceInteraction]
}
RBLXInstancesMAPTime := Map()

MMUI := Gui()
MultiInstanceUI := Gui()
PositioningUI := Gui()
PositioningHelp := Gui()
SaveSettingWindow := Gui()
ChangelogsUI := Gui()
DonateUI := Gui()
; https://paypal.me/JeneneT

; MultiInstance UI / Setup

MultiInstaneUiFunction(instanceID, Settings) {
    ID := instanceID
    Settings1 := Settings
    MMUI.Add("Text","Section xs c0x000000", WinGetTitle("ahk_id " instanceID) "_Instance[" Settings[1] "]")
    MMUI.Add("Button", "w25 h25 x220 ys", "🔍").OnEvent("Click", ActivateWindow)
    MMUI.Add("DropDownList", "w100 x250 ys choose3 vToDoWithInstance" ID, ["Macro","Anti-Afk", "Nothing"])

    ActivateWindow(*) {
        WinActivate("ahk_id " ID)
        MouseGetPos(&u, &u2)
        ToolTip("Activated `"Roblox_Instance[" Settings1[1] "]`"", u+10, u2, )
        SetTimer () => ToolTip(), -1500
    }
}

MultiInstaneUiSetup(instanceID, Settings, ToDo) {
    global RunningMultiInstance := true
    ID := instanceID
    Settings1 := Settings
    MultiInstanceUI.Add("Text","Section xs c0x000000", WinGetTitle("ahk_id " instanceID) "_Instance[" Settings[1] "]")
    MultiInstanceUI.Add("Button", "w25 h25 x220 ys", "🔍").OnEvent("Click", ActivateWindow)
    MultiInstanceUI.Add("Button", "w125 h25 x250 ys", "Settings").OnEvent("Click", OpenSettings)

    if ToDo = "Anti-Afk" {
        RBLXInstancesMAP[instanceID][5] := -1
        RBLXInstancesMAP[instanceID][3] := [CloneMap(AFKMap)]
    }

    OpenSettings(*) {
        if not RBLXInstancesMAP[instanceID][2] {
            if ToDo = "Macro" {
                Mi := Map()
                Mi["SpecialUI"] := Gui()
                Mi["MultiInstanceUI"] := Gui()
                Mi["PositioningUI"] := Gui()
                Mi["PositioningHelp"] := Gui()
                Mi["SaveSettingWindow"] := Gui()
                Mi["ChangelogsUI"] := Gui()
                Mi["CurrentPostionLabelEvil"] := 0

                Multi_UiItUp(instanceID, MI)
            } else if ToDo = "Anti-Afk" {
                Multi_UiItUpSomewhat(instanceID)
            }
            RBLXInstancesMAP[instanceID][2] := true
        }
    }

    ActivateWindow(*) {
        WinActivate("ahk_id " ID)
        MouseGetPos(&u, &u2)
        ToolTip("Activated `"Roblox_Instance[" Settings1[1] "]`"", u+10, u2, )
        SetTimer () => ToolTip(), -1500
    }
}

Multi_UiItUp(InstanceID, Mi) {
    SpecialUI := Mi["SpecialUI"]
    SPositioningUI := Mi["PositioningUI"]
    SPositioningHelp := Mi["PositioningHelp"] 
    SMultiInstanceUI := Mi["MultiInstanceUI"]
    SSaveSettingWindow := Mi["SaveSettingWindow"]
    SChangelogsUI := Mi["ChangelogsUI"]
    MI_UIS.InsertAt(1, Mi)

    SpecialUI.Opt("-SysMenu +AlwaysOnTop +Caption")
    SMultiInstanceUI.Opt("+AlwaysOnTop")
    SPositioningUI.Opt("+AlwaysOnTop")
    SSaveSettingWindow.Opt("+AlwaysOnTop")
    SPositioningHelp.Opt("+AlwaysOnTop")
    SChangelogsUI.Opt("+AlwaysOnTop")

    M_Settings := RBLXInstancesMAP[InstanceID][3]
    MMTogglesMap := M_Settings[1]
    CVMAP := M_Settings[2]
    NVMAP := M_Settings[3]
    TVMAP := M_Settings[4]
    PositionMap := M_Settings[5]
  
    Tabs := SpecialUI.AddTab3("",["Main", "Macro Toggles", "Toggle Settings", "Number Settings", "Text Settings", "Positioning", "Extras"])
  
    SpecialUI.SetFont("s15 q5 w700", "Constantia")
    SpecialUI.Add("Text","Section c0x0d8600","MultiMacro V" Version " | RblxInst:" InstanceID)
    SpecialUI.SetFont("s11 w500",  "Arial")
    SpecialUI.Add("Text","Section Cblack","Macro Made by @A_Basement | Oliyopi on Roblox")
    SpecialUI.SetFont("s9 w400",  "Arial")
    SpecialUI.Add("Text","Section Cblack w250 Wrap", "F3 to start the macro`nF8 to stop the macro`nF6 to pause the macro")
    SpecialUI.SetFont("s11 w400",  "Arial")
    SpecialUI.Add("Text","Section Cblack w250 Wrap","Check out my YT and Discord with the buttons below!")

    SpecialUI.Add("Button","x20 y380","Set Settings").OnEvent("Click", MultiSettingSetup)
    SpecialUI.Add("Button","yp","Join the Discord").OnEvent("Click", JoinDiscordButton)
    SpecialUI.Add("Button","yp","Youtube Channel").OnEvent("Click", YTButton)

    MultiSettingSetup(*) {
        MultiSetSettings(InstanceID, Mi)
    }

    Tabs.UseTab(2)
    SpecialUI.SetFont("s15 q5 w700", "Constantia")
    SpecialUI.Add("Text","Section cblack","Macro Toggles")
    SpecialUI.SetFont("s11 w500",  "Arial")

    for Setting, Toggle in MMTogglesMap {
        SpecialUI.Add("Text", "xs Section", "`"" Setting "`"")
        SpecialUI.Add("Checkbox", "v" Setting InstanceID " ys x330 Checked" Toggle)
    }

    Tabs.UseTab(3)
    SpecialUI.SetFont("s15 q5 w700", "Constantia")
    SpecialUI.Add("Text","Section cblack","Toggle Settings")
    SpecialUI.SetFont("s11 w500",  "Arial")

    for Setting, Toggle in CVMAP {
        SpecialUI.Add("Text", "xs Section", "`"" Setting "`"")
        SpecialUI.Add("Checkbox", "V" Setting InstanceID " ys x330 Checked" Toggle)
    }

    Tabs.UseTab(4)
    SpecialUI.SetFont("s15 q5 w700", "Constantia")
    SpecialUI.Add("Text","Section cblack","Number Settings")
    SpecialUI.SetFont("s11 w500",  "Arial")

    for Setting, SNumber in NVMAP {
        SpecialUI.Add("Text", "xs Section", "`"" Setting "`"")
        SpecialUI.Add("Edit", "ys x290 w110 h20")
        SpecialUI.AddUpDown("V" Setting InstanceID " Range1-2147483647", sNumber)
    }
    
    Tabs.UseTab(5)
    SpecialUI.SetFont("s15 q5 w700", "Constantia")
    SpecialUI.Add("Text","Section cblack","Text Settings")
    SpecialUI.SetFont("s11 w500",  "Arial")

    for Setting, Text in TVMAP {
        SpecialUI.Add("Text", "xs Section", "`"" Setting "`"")
        SpecialUI.Add("Edit", "ys x290 w110 h20 v" Setting InstanceID, Text)
    }

    Tabs.UseTab(6)
    SpecialUI.SetFont("s15 q5 w700", "Constantia")
    SpecialUI.Add("Text","Section cblack","Positioning")
    SpecialUI.SetFont("s11 w500",  "Arial")

    SpecialUI.Add("Button","xs y382","Open Positoning Menu").OnEvent("Click", M_OpenPosMenu)
    SpecialUI.Add("Button","yp","Positioning Help").OnEvent("Click", M_OpenPosHelpMenu)

    Tabs.UseTab(7)
    SpecialUI.Add("Button","xs y382","Changelogs").OnEvent("Click", M_OpenChangeLogs)
    SpecialUI.Add("Button","x292 y300","Save Settings").OnEvent("Click", M_SaveSettings)
    SpecialUI.Add("Button","x212 y335","Save Settings As New File").OnEvent("Click", M_SaveNewSettings)

    UnSettingsMap := Map()
    UnSettingsArray := []
    EvilMap := Map()

    loop files, A_ScriptDir "\MultiMacroV3Settings\*.ini" {
        UnSettingsMap[A_LoopFileName] := UnSettingsArray.Length + 1
        UnSettingsArray.InsertAt(UnSettingsArray.Length + 1, A_LoopFileName)
        OutputDebug("`n" A_LoopFileName)
    }

    SpecialUI.Add("Text", "x200 y365", "↓ Load Setting File ↓")
    M_SettingDD := SpecialUI.Add("DropDownList", "w200 x200 y385 vLoadSetting" InstanceID " choose" Mi["CurrentPostionLabelEvil"], UnSettingsArray)
    M_SettingDD.OnEvent("Change", M_SettingChanged)

    SpecialUI.Show("h410")


    MTabs := SMultiInstanceUI.AddTab3("", ["Main", "Instances"])
    SMultiInstanceUI.SetFont("s15 q5 w700", "Constantia")
    SMultiInstanceUI.Add("Text","Section c0x000000","Multi-Instance")
    SMultiInstanceUI.SetFont("s11 w500",  "Arial")
    SMultiInstanceUI.Add("Text","Section c0x000000","F3 : Starts Macro and Hides UI`nF6 : Pauses Macro And Shows UI`nF8 : Closes Out Macro")


    MTabs.UseTab(2)
    SMultiInstanceUI.SetFont("s15 q5 w700", "Constantia")
    SMultiInstanceUI.Add("Text","Section c0x000000","Roblox Instances")
    SMultiInstanceUI.SetFont("s11 w500",  "Arial")

    CoordPositions := 0
    XOnlyPositions := 0
    YOnlyPositions := 0
    PositionsPerTab := 15

    for Position, PosIndex in PositionMap {
        if Type(PosIndex) = "Array" {
            CoordPositions += 1
        } else {
            if InStr(Position, "*Y") {
                YOnlyPositions += 1
            } else { 
                XOnlyPositions += 1
            }
        }
    }

    PositionTabs := Ceil(CoordPositions/PositionsPerTab)
    XTabs := Ceil(XOnlyPositions/PositionsPerTab)
    YTabs := Ceil(YOnlyPositions/PositionsPerTab)
    TotalNumberOfPositions := 0
    TabArray := []

    loop PositionTabs {
        TotalNumberOfPositions += 1
        TabArray.InsertAt(TabArray.Length + 1, "Pos Section " TotalNumberOfPositions)
    }

    TotalNumberOfPositions := 0
    loop XTabs {
        TotalNumberOfPositions += 1
        TabArray.InsertAt(TabArray.Length + 1, "XPos Section " TotalNumberOfPositions)  
    }

    TotalNumberOfPositions := 0
    loop YTabs {
        TotalNumberOfPositions += 1
        TabArray.InsertAt(TabArray.Length + 1, "YPos Section " TotalNumberOfPositions)  
    }

    PTabs := SPositioningUI.AddTab3("",TabArray)
    _LN1 := 0
    loop TabArray.Length {
        _LN1 += 1
        PTabs.UseTab(_LN1)
        if _LN1 - PositionTabs <= 0 {
            SPositioningUI.SetFont("s15 q5 w800", "Constantia")
            SPositioningUI.Add("Text", "Section", "Positioning")
            SPositioningUI.Add("Text"," ys+5 x270 c0x000000","X")
            SPositioningUI.Add("Text"," ys+5 x340 c0x000000","Y")
            SPositioningUI.SetFont("s9 q5 w500", "Arial")
        } else if _LN1 - (PositionTabs + XTabs) <= 0 {
            SPositioningUI.SetFont("s15 q5 w800", "Constantia")
            SPositioningUI.Add("Text", "Section", "X Positioning")
            SPositioningUI.Add("Text"," ys+5 x340 c0x000000","X")
            SPositioningUI.SetFont("s9 q5 w500", "Arial")
        } else {
            SPositioningUI.SetFont("s15 q5 w800", "Constantia")
            SPositioningUI.Add("Text", "Section", "Y Positioning")
            SPositioningUI.Add("Text"," ys+5 x340 c0x000000","Y")
            SPositioningUI.SetFont("s9 q5 w500", "Arial")
        }
    }

    XPosNum := 0
    XPosTab := 1
    YPosNum := 0
    YPosTab := 1
    PosNum := 0
    PosTab := 1

    for Position, PositonArrayOrValue in PositionMap {
        if Type(PositonArrayOrValue) = "Array" {
            PosNum += 1

            NewLP := PosNum/PositionsPerTab
            if NewLP > 1 {
                PosNum := 1
                PosTab += 1
            } 

            PTabs.UseTab(PosTab)

            SGuiPos1(Position, PositonArrayOrValue, PosNum)
        } else if InStr(Position, "*Y") {
            YPosNum += 1

            NewLP := YPosNum/PositionsPerTab
            if NewLP > 1 {
                YPosNum := 1
                YPosTab += 1
            }

            PTabs.UseTab(PositionTabs + XTabs + YPosTab)
            SGuiPos2(Position, PositonArrayOrValue, YPosNum, "Y")
        } else {
            XPosNum += 1

            NewLP := XPosNum/PositionsPerTab
            if NewLP > 1 {
                XPosNum := 1
                XPosTab += 1
            }

            PTabs.UseTab(PositionTabs + XTabs)
            SGuiPos2(Position, PositonArrayOrValue, XPosNum, "X")
        }
    }

    PTabs.UseTab(1)
    SPositioningUI.Add("Button","xs y540","Update Positions").OnEvent("Click", M_UpdPositions)

    SSaveSettingWindow.SetFont("s11 q5 w500", "Arial")
    SSaveSettingWindow.Add("Text", "", "Enter File Name`n(Duplicate Named Files Will Overwrite)")
    ASWText := SSaveSettingWindow.Add("Edit", "vName w200", "NewSettingFile" SettingsArray.Length + 1)
    SSaveSettingWindow.Add("Button", "", "Save").OnEvent("Click", M_SaveAsNewFile)

    SPositioningHelp.SetFont("s13 q5 w700", "Constantia")
    SPositioningHelp.Add("Text","Section c0x000000","Positioning Help")
    SPositioningHelp.SetFont("s9 w400",  "Arial")
    SPositioningHelp.Add("Text", "wrap w500", Yapping)

    CTabs := SChangelogsUI.AddTab3("", ["Now-V3",])
    SChangelogsUI.SetFont("s15 q5 w700", "Arial")
    SChangelogsUI.Add("Text","Section c000000","ChangeLogs")
    SChangelogsUI.SetFont("s10 q5 w700", "Arial")
    SChangelogsUI.Add("Text","Section c000000 w350 Wrap","V3 (Release):`nMacro Exists")

    SGuiPos1(Name, PositionArray, Num) {
        SPositioningUI.Add("Text","Section xs y" (90 + ((Num - 1) * 30)), Name)
        SPositioningUI.Add("Button", "w25 h25 x220 ys", "S").OnEvent("Click", ButtonClicked)
        Ud1 := SPositioningUI.Add("Edit","ys w60 x250",)
        SPositioningUI.AddUpDown("v" Name InstanceID "XPos Range1-4000", PositionArray[1])
    
        ud2 := SPositioningUI.Add("Edit","ys w60 x320",)
        SPositioningUI.AddUpDown("v" Name InstanceID "YPos Range1-4000", PositionArray[2])
    
        ButtonClicked(*) {
            global CurrentPostionLabel := [UD1, UD2]
        }
    }
    
    SGuiPos2(Name, Position, Num, XorY) {
        SPositioningUI.Add("Text","Section xs y" (90 + ((Num - 1) * 30)), Name)
        SPositioningUI.Add("Button", "w25 h25 x290 ys", "S").OnEvent("Click", ButtonClicked)
        ud2 := SPositioningUI.Add("Edit","ys w60 x320",)
        SPositioningUI.AddUpDown("v" Name InstanceID "Pos Range1-4000", Position)
        
        ButtonClicked(*) {
            if XorY = "X" {
                global CurrentPostionLabel := [UD2, "X"] 
            } else {
                global CurrentPostionLabel := [UD2, "Y"]
            }
        }
    }

    M_OpenPosMenu(*) {
        SPositioningUI.Show()
    }

    M_OpenPosHelpMenu(*) {
        SPositioningHelp.Show()
    }

    M_SettingChanged(*) {
        SpecialUI := Mi["SpecialUI"]
        SPositioningUI := Mi["PositioningUI"]
        SPositioningHelp := Mi["PositioningHelp"] 
        SMultiInstanceUI := Mi["MultiInstanceUI"]
        SSaveSettingWindow := Mi["SaveSettingWindow"]

        ; OutputDebug("Changed")
        TheSumbit := ObjToMap(SpecialUI.Submit())
        Mi["CurrentPostionLabelEvil"] := UnSettingsMap[TheSumbit["LoadSetting" InstanceID]]
        SpecialUI.Destroy()
        SPositioningUI.Submit()
        SPositioningUI.Destroy()
        SPositioningHelp.Submit()
        SPositioningHelp.Destroy()
        SMultiInstanceUI.Submit()
        SMultiInstanceUI.Destroy()
        SSaveSettingWindow.Submit()
        SSaveSettingWindow.Destroy()

        Mi["SpecialUI"] := Gui()
        Mi["MultiInstanceUI"] := Gui()
        Mi["PositioningUI"] := Gui()
        Mi["PositioningHelp"] := Gui()
        Mi["SaveSettingWindow"] := Gui()
        Mi["ChangelogsUI"] := Gui()

        try {
            MultiLoadSettings(InstanceID, TheSumbit)
        }
        Multi_UiItUp(InstanceID, Mi)
    }
    
    M_OpenChangeLogs(*) {
        SChangelogsUI.Show()
    }
    
    M_SaveNewSettings(*) {
        SSaveSettingWindow.Show()
    }
    
    M_SaveAsNewFile(*) {
        FileName := SSaveSettingWindow.Submit().Name
    
        SavedSettings := SpecialUI.Submit(false)
        PoSavedSettings := SPositioningUI.Submit(false)
        FixedSettings := ObjToMap(SavedSettings)
        FixedPoSettings := ObjToMap(PoSavedSettings)
    
        FileToSaveTo := A_ScriptDir "\MultiMacroV3Settings\" FileName ".ini"
    
        IniWrite(FileName ".ini", "Info.ini", "LastLoadedSetting", "Setting")

        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                IniWrite(FixedPoSettings[Key InstanceID "XPos"] "|" FixedPoSettings[Key InstanceID "YPos"], FileToSaveTo, "Positioning", Key)
            } else {
                IniWrite(FixedPoSettings[Key InstanceID "Pos"], FileToSaveTo, "Positioning", Key)
            }
        }
    
        for Key, Value in MMTogglesMap {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "MacroToggles", Key)
        }
    
        for Key, Value in CVMAP {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "ToggleSettings", Key)
        }
    
        for Key, Value in TVMAP {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "TextSettings", Key)
        }
    
        for Key, Value in NVMAP {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "NumberSettings", Key)
        }
    
        UnSettingsMap := Map()
        UnSettingsArray := []
        SavedNum := 0
    
        loop files, A_ScriptDir "\MultiMacroV3Settings\*.ini" {
            UnSettingsMap[A_LoopFileName] := UnSettingsArray.Length + 1
            UnSettingsArray.InsertAt(UnSettingsArray.Length + 1, A_LoopFileName)

            if A_LoopFileName = FileName ".ini" {
                SavedNum := UnSettingsArray.Length
                IniWrite(SavedNum, "Info.ini", "LastLoadedSetting", "SettingNum")
            }
        }
    
        M_SettingDD.Delete()
        M_SettingDD.Add(UnSettingsArray)
        M_SettingDD.Choose(SavedNum)
        ASWText.Text := "NewSettingFile" UnSettingsArray.Length
    }
    
    M_SaveSettings(*) {
        SavedSettings := SpecialUI.Submit(false)
        PoSavedSettings := SPositioningUI.Submit(false)
        FixedSettings := ObjToMap(SavedSettings)
        FixedPoSettings := ObjToMap(PoSavedSettings)

        if FixedSettings["LoadSetting" InstanceID] = "" {
            M_SaveAsNewFile()
            return
        }
    
        FileToSaveTo := A_ScriptDir "\MultiMacroV3Settings\" FixedSettings["LoadSetting" InstanceID]
    
        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                IniWrite(FixedPoSettings[Key InstanceID "XPos"] "|" FixedPoSettings[Key InstanceID "YPos"], FileToSaveTo, "Positioning", Key)
            } else {
                IniWrite(FixedPoSettings[Key InstanceID "Pos"], FileToSaveTo, "Positioning", Key)
            }
        }
    
        for Key, Value in MMTogglesMap {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "MacroToggles", Key)
        }
    
        for Key, Value in CVMAP {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "ToggleSettings", Key)
        }
    
        for Key, Value in TVMAP {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "TextSettings", Key)
        }
    
        for Key, Value in NVMAP {
            IniWrite(FixedSettings[Key InstanceID], FileToSaveTo, "NumberSettings", Key)
        }
    }

    M_UpdPositions(*) {
        SavedSettings := SpecialUI.Submit(false)
        PoSavedSettings := SPositioningUI.Submit(false)
        FixedSettings := ObjToMap(SavedSettings)
        FixedPoSettings := ObjToMap(PoSavedSettings)

        if FixedSettings["LoadSetting" InstanceID] = "" {
            M_SaveAsNewFile()
            return
        }
    
        FileToSaveTo := A_ScriptDir "\MultiMacroV3Settings\" FixedSettings["LoadSetting" InstanceID]

        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                IniWrite(FixedPoSettings[Key "XPos"] "|" FixedPoSettings[Key "YPos"], FileToSaveTo, "Positioning", Key)
            } else {
                IniWrite(FixedPoSettings[Key "Pos"], FileToSaveTo, "Positioning", Key)
            }
        }
    }
}

Multi_UiItUpSomewhat(InstanceID) {
    SpecificUI := Gui()

    MI_UIS.InsertAt(1, [SpecificUI])
    AFKMap := RBLXInstancesMAP[InstanceID][3][1]

    SpecificUI.Opt("-SysMenu +AlwaysOnTop +Caption +Resize")
    ; PosHelpUI.Opt("+AlwaysOnTop")
    ; ChangeLogsUI.Opt("+AlwaysOnTop")
  
    Tabs := SpecificUI.AddTab3("",["Main", "Anti-Afk Settings"])
  
    SpecificUI.SetFont("s15 q5 w700", "Constantia")
    SpecificUI.Add("Text","Section c0x0d8600","MultiMacro V" Version " | Inst[" RBLXInstancesMAP[InstanceID][1] "] (AFKV)")
    SpecificUI.SetFont("s11 w500",  "Arial")
    SpecificUI.Add("Text","Section Cblack","Macro Made by @A_Basement | Oliyopi on Roblox")
    SpecificUI.SetFont("s9 w400",  "Arial")
    SpecificUI.Add("Text","Section Cblack w250 Wrap", "F3 to start the macro`nF8 to stop the macro`nF6 to pause the macro")
    SpecificUI.SetFont("s11 w400",  "Arial")
    SpecificUI.Add("Button","x20 y380","Set Settings").OnEvent("Click", MultiSettingSetup)

    MultiSettingSetup(*) {
        MultiSetSettings(InstanceID, SpecificUI)
    }

    Tabs.UseTab(2)
    SpecificUI.SetFont("s15 q5 w700", "Constantia")
    SpecificUI.Add("Text","Section cblack","Macro Toggles")
    SpecificUI.SetFont("s11 w500",  "Arial")

    for Setting, sNumber in AFKMap {
        SpecificUI.Add("Text", "xs Section", "`"" Setting "`"")
        SpecificUI.Add("Edit", "ys x290 w110 h20")
        SpecificUI.AddUpDown("V" Setting InstanceID " Range1-2147483647", sNumber)
    }

    SpecificUI.Show()
}

MultiLoadSettings(InstanceID, TheSumbit) {
    SettingFile := A_ScriptDir "\MultiMacroV3Settings\" TheSumbit["LoadSetting" InstanceID]
    TheSettings := RBLXInstancesMAP[InstanceID][3]

    SMMTogglesMap := TheSettings[1]
    SCVMAP := TheSettings[2]
    SNVMAP := TheSettings[3]
    STVMAP := TheSettings[4]
    SPositionMap := TheSettings[5]

    for Key, Value in SPositionMap {
        if Type(Value) = "Array" {
            SplitStr := StrSplit(IniRead(SettingFile, "Positioning", Key), "|")
            SPositionMap[Key] := [SplitStr[1],SplitStr[2]]
        } else {
            SPositionMap[Key] := IniRead(SettingFile, "Positioning", Key)
        }
    } 

    for Key, Value in SMMTogglesMap {
        SMMTogglesMap[Key] := IniRead(SettingFile, "MacroToggles", Key)
    }

    for Key, Value in SCVMAP {
        SCVMAP[Key] := IniRead(SettingFile, "ToggleSettings", Key)
    }

    for Key, Value in STVMAP {
        STVMAP[Key] := IniRead(SettingFile, "TextSettings", Key)
    }

    for Key, Value in SNVMAP {
        SNVMAP[Key] := IniRead(SettingFile, "NumberSettings", Key)
    }
}

MultiSetSettings(InstanceID, MainUI) {
    if Type(MainUI) = "Map" {
        M_Settings := RBLXInstancesMAP[InstanceID][3]
        MMTogglesMap := M_Settings[1]
        CVMAP := M_Settings[2]
        NVMAP := M_Settings[3]
        TVMAP := M_Settings[4]
        PositionMap := M_Settings[5]

        SavedSettings := MainUI["SpecialUI"].Submit()
        PoSavedSettings := MainUI["PositioningUI"].Submit()
        FixedSettings := ObjToMap(SavedSettings)
        FixedPoSettings := ObjToMap(PoSavedSettings) 


        
        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                RBLXInstancesMAP[InstanceID][3][5][Key] := [FixedPoSettings[Key InstanceID "XPos"], FixedPoSettings[Key InstanceID "YPos"]]
            } else {
                RBLXInstancesMAP[InstanceID][3][5][Key] := FixedPoSettings[Key InstanceID "Pos"]
            }
        }
    
        for Key, Value in MMTogglesMap {
            RBLXInstancesMAP[InstanceID][3][1][Key] := FixedSettings[Key InstanceID]
        }
    
        for Key, Value in CVMAP {
            RBLXInstancesMAP[InstanceID][3][2][Key] := FixedSettings[Key InstanceID]
        }
    
        for Key, Value in TVMAP {
            RBLXInstancesMAP[InstanceID][3][4][Key] := FixedSettings[Key InstanceID]
        }
    
        for Key, Value in NVMAP {
            RBLXInstancesMAP[InstanceID][3][3][Key] := FixedSettings[Key InstanceID]
        }

        for _, Ui in MainUI {
            if Type(MainUI) = "Gui" {
                Ui.Submit()
                Ui.Destroy()
            }
        }
        RBLXInstancesMAP[InstanceID][2] := false
    } else {
        SumbitUI := ObjToMap(MainUI.Submit())
        RBLXInstancesMAP[InstanceID][3][1]["AfkClickTime"] := SumbitUI["AfkClickTime" InstanceID]
        RBLXInstancesMAP[InstanceID][2] := false
    }

    OutputDebug("Set Settings")
}



; Main UI

GuiPos1(Name, PositionArray, Num) {
    PositioningUI.Add("Text","Section xs y" (90 + ((Num - 1) * 30)), Name)
    PositioningUI.Add("Button", "w25 h25 x220 ys", "S").OnEvent("Click", ButtonClicked)
    Ud1 := PositioningUI.Add("Edit","ys w60 x250",)
    PositioningUI.AddUpDown("v" Name "XPos Range1-4000", PositionArray[1])

    ud2 := PositioningUI.Add("Edit","ys w60 x320",)
    PositioningUI.AddUpDown("v" Name "YPos Range1-4000", PositionArray[2])

    ButtonClicked(*) {
        global CurrentPostionLabel := [UD1, UD2]
    }
}

GuiPos2(Name, Position, Num, XorY) {
    PositioningUI.Add("Text","Section xs y" (90 + ((Num - 1) * 30)), Name)
    PositioningUI.Add("Button", "w25 h25 x290 ys", "S").OnEvent("Click", ButtonClicked)
    ud2 := PositioningUI.Add("Edit","ys w60 x320",)
    PositioningUI.AddUpDown("v" Name "Pos Range1-4000", Position)
    

    ButtonClicked(*) {
        if XorY = "X" {
            global CurrentPostionLabel := [UD2, "X"] 
        } else {
            global CurrentPostionLabel := [UD2, "Y"]
        }
    }
}

UiItUp() {
    MMUI.Opt("-SysMenu +AlwaysOnTop +Caption")
    MultiInstanceUI.Opt("+AlwaysOnTop")
    PositioningUI.Opt("+AlwaysOnTop")
    SaveSettingWindow.Opt("+AlwaysOnTop")
    PositioningHelp.Opt("+AlwaysOnTop")
    ChangeLogsUI.Opt("+AlwaysOnTop")
    DonateUI.Opt("+AlwaysOnTop")
  
    Tabs := MMUI.AddTab3("",["Main", "Macro Toggles", "Toggle Settings", "Number Settings", "Text Settings", "Positioning", "Multi-Instance", "Extras"])
  
    MMUI.SetFont("s15 q5 w700", "Constantia")
    MMUI.Add("Text","Section c0x0d8600","MultiMacro V" Version)
    MMUI.SetFont("s11 w500",  "Arial")
    MMUI.Add("Text","Section Cblack","Macro Made by @A_Basement | Oliyopi on Roblox")
    MMUI.SetFont("s9 w400",  "Arial")
    MMUI.Add("Text","Section Cblack w250 Wrap", "F3 to start the macro`nF8 to stop the macro`nF6 to pause the macro")
    MMUI.SetFont("s11 w400",  "Arial")
    MMUI.Add("Text","Section Cblack w250 Wrap","Check out my YT and Discord with the buttons below!")
    

    MMUI.Add("Button","x20 y380","Enable Macro").OnEvent("Click", EnableMacro)
    MMUI.Add("Button","yp","Join the Discord").OnEvent("Click", JoinDiscordButton)
    MMUI.Add("Button","yp","Youtube Channel").OnEvent("Click", YTButton)

    Tabs.UseTab(2)
    MMUI.SetFont("s15 q5 w700", "Constantia")
    MMUI.Add("Text","Section cblack","Macro Toggles")
    MMUI.SetFont("s11 w500",  "Arial")

    for Setting, Toggle in MMTogglesMap {
        MMUI.Add("Text", "xs Section", "`"" Setting "`"")
        MMUI.Add("Checkbox", "V" Setting " ys x330 Checked" Toggle)
    }

    Tabs.UseTab(3)
    MMUI.SetFont("s15 q5 w700", "Constantia")
    MMUI.Add("Text","Section cblack","Toggle Settings")
    MMUI.SetFont("s11 w500",  "Arial")

    for Setting, Toggle in CVMAP {
        MMUI.Add("Text", "xs Section", "`"" Setting "`"")
        MMUI.Add("Checkbox", "V" Setting " ys x330 Checked" Toggle)
    }

    Tabs.UseTab(4)
    MMUI.SetFont("s15 q5 w700", "Constantia")
    MMUI.Add("Text","Section cblack","Number Settings")
    MMUI.SetFont("s11 w500",  "Arial")

    for Setting, SNumber in NVMAP {
        MMUI.Add("Text", "xs Section", "`"" Setting "`"")
        MMUI.Add("Edit", "ys x290 w110 h20")
        MMUI.AddUpDown("V" Setting " Range1-2147483647", sNumber)
    }
    
    Tabs.UseTab(5)
    MMUI.SetFont("s15 q5 w700", "Constantia")
    MMUI.Add("Text","Section cblack","Text Settings")
    MMUI.SetFont("s11 w500",  "Arial")

    for Setting, Text in TVMAP {
        MMUI.Add("Text", "xs Section", "`"" Setting "`"")
        MMUI.Add("Edit", "ys x290 w110 h20 v" Setting , Text)
    }

    Tabs.UseTab(6)
    MMUI.SetFont("s15 q5 w700", "Constantia")
    MMUI.Add("Text","Section cblack","Positioning")
    MMUI.SetFont("s11 w500",  "Arial")

    MMUI.Add("Button","xs y382","Open Positoning Menu").OnEvent("Click", OpenPosMenu)
    MMUI.Add("Button","yp","Positioning Help").OnEvent("Click", OpenPosHelpMenu)

    Tabs.UseTab(7)
    MMUI.SetFont("s15 q5 w700", "Constantia")
    MMUI.Add("Text","Section c0x000000","Multi-Instancing")
    MMUI.SetFont("s9 w500",  "Arial")

    for instanceID, Settings in RBLXInstancesMAP {
        MultiInstaneUiFunction(instanceID, Settings)
    }

    MMUI.SetFont("s11 w500",  "Arial")
    MMUI.Add("Button","x20 y380","Start Multi-Instance").OnEvent("Click", StartMultiInstance)

    Tabs.UseTab(8)
    MMUI.Add("Button","xs y382","Changelogs").OnEvent("Click", OpenChangeLogs)
    MMUI.Add("Button","x292 y300","Save Settings").OnEvent("Click", SaveSettings)
    MMUI.Add("Button","x212 y335","Save Settings As New File").OnEvent("Click", SaveNewSettings)
    MMUI.Add("Button","x15 y70 h30 w100","Donate").OnEvent("Click", DonateUIitUp)

    global SettingsMap := Map()
    global SettingsArray := []

    loop files, A_ScriptDir "\MultiMacroV3Settings\*.ini" {
        SettingsMap[A_LoopFileName] := SettingsArray.Length + 1
        SettingsArray.InsertAt(SettingsArray.Length + 1, A_LoopFileName)
    }

    MMUI.Add("Text", "x200 y365", "↓ Load Setting File ↓")
    SettingDD := MMUI.Add("DropDownList", "w200 x200 y385 vLoadSetting choose" CurrentLoadedSetting, SettingsArray)
    SettingDD.OnEvent("Change", SettingChanged)

    MMUI.Show("h410")


    MTabs := MultiInstanceUI.AddTab3("", ["Main", "Instances"])
    MultiInstanceUI.SetFont("s15 q5 w700", "Constantia")
    MultiInstanceUI.Add("Text","Section c0x000000","Multi-Instance")
    MultiInstanceUI.SetFont("s11 w500",  "Arial")
    MultiInstanceUI.Add("Text","Section c0x000000","F3 : Starts Macro and Hides UI`nF6 : Pauses Macro And Shows UI`nF8 : Closes Out Macro")
    MultiInstanceUI.Add("Button","x20 y380","Enable Macro").OnEvent("Click", EnableMacro)


    MTabs.UseTab(2)
    MultiInstanceUI.SetFont("s15 q5 w700", "Constantia")
    MultiInstanceUI.Add("Text","Section c0x000000","Roblox Instances")
    MultiInstanceUI.SetFont("s11 w500",  "Arial")

    CoordPositions := 0
    XOnlyPositions := 0
    YOnlyPositions := 0
    PositionsPerTab := 15

    for Position, PosIndex in PositionMap {
        if Type(PosIndex) = "Array" {
            CoordPositions += 1
        } else {
            if InStr(Position, "*Y") {
                YOnlyPositions += 1
            } else { 
                XOnlyPositions += 1
            }
        }
    }

    PositionTabs := Ceil(CoordPositions/PositionsPerTab)
    XTabs := Ceil(XOnlyPositions/PositionsPerTab)
    YTabs := Ceil(YOnlyPositions/PositionsPerTab)
    TotalNumberOfPositions := 0
    TabArray := []

    loop PositionTabs {
        TotalNumberOfPositions += 1
        TabArray.InsertAt(TabArray.Length + 1, "Pos Section " TotalNumberOfPositions)
    }

    TotalNumberOfPositions := 0
    loop XTabs {
        TotalNumberOfPositions += 1
        TabArray.InsertAt(TabArray.Length + 1, "XPos Section " TotalNumberOfPositions)  
    }

    TotalNumberOfPositions := 0
    loop YTabs {
        TotalNumberOfPositions += 1
        TabArray.InsertAt(TabArray.Length + 1, "YPos Section " TotalNumberOfPositions)  
    }

    PTabs := PositioningUI.AddTab3("",TabArray)
    _LN1 := 0
    loop TabArray.Length {
        _LN1 += 1
        PTabs.UseTab(_LN1)
        if _LN1 - PositionTabs <= 0 {
            PositioningUI.SetFont("s15 q5 w800", "Constantia")
            PositioningUI.Add("Text", "Section", "Positioning")
            PositioningUI.Add("Text"," ys+5 x270 c0x000000","X")
            PositioningUI.Add("Text"," ys+5 x340 c0x000000","Y")
            PositioningUI.SetFont("s9 q5 w500", "Arial")
        } else if _LN1 - (PositionTabs + XTabs) <= 0 {
            PositioningUI.SetFont("s15 q5 w800", "Constantia")
            PositioningUI.Add("Text", "Section", "X Positioning")
            PositioningUI.Add("Text"," ys+5 x340 c0x000000","X")
            PositioningUI.SetFont("s9 q5 w500", "Arial")
        } else {
            PositioningUI.SetFont("s15 q5 w800", "Constantia")
            PositioningUI.Add("Text", "Section", "Y Positioning")
            PositioningUI.Add("Text"," ys+5 x340 c0x000000","Y")
            PositioningUI.SetFont("s9 q5 w500", "Arial")
        }
    }

    XPosNum := 0
    XPosTab := 1
    YPosNum := 0
    YPosTab := 1
    PosNum := 0
    PosTab := 1

    for Position, PositonArrayOrValue in PositionMap {
        if Type(PositonArrayOrValue) = "Array" {
            PosNum += 1

            NewLP := PosNum/PositionsPerTab
            if NewLP > 1 {
                PosNum := 1
                PosTab += 1
            } 

            PTabs.UseTab(PosTab)

            GuiPos1(Position, PositonArrayOrValue, PosNum)
        } else if InStr(Position, "*Y") {
            YPosNum += 1

            NewLP := YPosNum/PositionsPerTab
            if NewLP > 1 {
                YPosNum := 1
                YPosTab += 1
            }

            PTabs.UseTab(PositionTabs + XTabs + YPosTab)
            GuiPos2(Position, PositonArrayOrValue, YPosNum, "Y")
        } else {
            XPosNum += 1

            NewLP := XPosNum/PositionsPerTab
            if NewLP > 1 {
                XPosNum := 1
                XPosTab += 1
            }

            PTabs.UseTab(PositionTabs + XTabs)
            GuiPos2(Position, PositonArrayOrValue, XPosNum, "X")
        }
    }

    PTabs.UseTab(1)
    PositioningUI.Add("Button","xs y540","Update Positions").OnEvent("Click", UpdPositions)

    SaveSettingWindow.SetFont("s11 q5 w500", "Arial")
    SaveSettingWindow.Add("Text", "", "Enter File Name`n(Duplicate Named Files Will Overwrite)")
    SSWText := SaveSettingWindow.Add("Edit", "vName w200", "NewSettingFile" SettingsArray.Length + 1)
    SaveSettingWindow.Add("Button", "", "Save").OnEvent("Click", SaveAsNewFile)

    PositioningHelp.SetFont("s13 q5 w700", "Constantia")
    PositioningHelp.Add("Text","Section c0x000000","Positioning Help")
    PositioningHelp.SetFont("s9 w400",  "Arial")
    PositioningHelp.Add("Text", "wrap w500", Yapping)

    CTabs := ChangelogsUI.AddTab3("", ["Now-V3",])
    ChangelogsUI.SetFont("s15 q5 w700", "Arial")
    ChangelogsUI.Add("Text","Section c000000","ChangeLogs")
    ChangelogsUI.SetFont("s10 q5 w700", "Arial")
    ChangelogsUI.Add("Text","Section c000000 w350 Wrap","V3 (Release):`nMacro Exists")

    DonateUI.Opt("+AlwaysOnTop")
    DonateUI.SetFont("s15 q5 w700", "Arial")
    DonateUI.Add("Text", "Section", "Donation Section")
    DonateUI.SetFont("s11 q5 w700", "Arial")
    DonateUI.Add("Text", "xs Wrap w400", "(Please note that you dont have to donate, but it is very much appreciated)`n`nIf you wish to donate, you can send me items via mailbox, my user is oliyopi!`n`nOr if you wish to donate money, you can send some via paypal with the button below`n(If you donate via paypal make sure to input your discord username so i can give you a role ❤️)")
    DonateUI.Add("Button", "xs y300", "Donate Via Paypal").OnEvent("Click", OpenDonation)

    OpenPosMenu(*) {
        PositioningUI.Show()
    }

    OpenPosHelpMenu(*) {
        PositioningHelp.Show()
    }

    SettingChanged(*) {
        global MMUI
        global PositioningUI
        global PositioningHelp
        global MultiInstanceUI
        global SaveSettingWindow

        OutputDebug("Changed")
        TheSumbit := MMUI.Submit()
        global CurrentLoadedSetting := SettingsMap[TheSumbit.LoadSetting]
        MMUI.Destroy()
        PositioningUI.Submit()
        PositioningUI.Destroy()
        PositioningHelp.Submit()
        PositioningHelp.Destroy()
        MultiInstanceUI.Submit()
        MultiInstanceUI.Destroy()
        SaveSettingWindow.Submit()
        SaveSettingWindow.Destroy()
        MMUI := Gui()
        PositioningUI := Gui()
        PositioningHelp := Gui()
        MultiInstanceUI := Gui()
        SaveSettingWindow := Gui()
        IniWrite(TheSumbit.LoadSetting, "Info.ini", "LastLoadedSetting", "Setting")
        IniWrite(CurrentLoadedSetting, "Info.ini", "LastLoadedSetting", "SettingNum")

        try {
            LoadSettings()
        }
        UiItUp()
    }

    StartMultiInstance(*) {
        MMUISumbitValues := ObjToMap(MMUI.Submit(false))
    
        PossibleInstances := []
        for instanceID, Settings in RBLXInstancesMAP {
            if MMUISumbitValues["ToDoWithInstance" instanceID] != "Nothing" and MMUISumbitValues["ToDoWithInstance" instanceID] != "" {
                PossibleInstances.InsertAt(1,[instanceID, Settings, MMUISumbitValues["ToDoWithInstance" instanceID]])
            }
        }
    
        if PossibleInstances.Length > 1 {
            for _, UiArray in PossibleInstances {
                MultiInstaneUiSetup(UiArray[1], UiArray[2], UiArray[3])
            }
            MMUI.Submit()
            MultiInstanceUI.Show()
        } else {
            MsgBox("Multi-Instance Requires atleast 2 instances to be macro'd", "Multi-Instance | Error", "0x0 0x10 0x1000")
            return
        }
    }
    
    OpenChangeLogs(*) {
        ChangelogsUI.Show()
    }
    
    SaveNewSettings(*) {
        SaveSettingWindow.Show()
    }
    
    SaveAsNewFile(*) {
        FileName := SaveSettingWindow.Submit().Name
    
        SavedSettings := MMUI.Submit(false)
        PosSavedSettings := PositioningUI.Submit(false)
        FixedSettings := ObjToMap(SavedSettings)
        FixedPosSettings := ObjToMap(PosSavedSettings)
    
        FileToSaveTo := A_ScriptDir "\MultiMacroV3Settings\" FileName ".ini"
    
        IniWrite(FileName ".ini", "Info.ini", "LastLoadedSetting", "Setting")

        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                IniWrite(FixedPosSettings[Key "XPos"] "|" FixedPosSettings[Key "YPos"], FileToSaveTo, "Positioning", Key)
            } else {
                IniWrite(FixedPosSettings[Key "Pos"], FileToSaveTo, "Positioning", Key)
            }
        }
    
        for Key, Value in MMTogglesMap {
            IniWrite(FixedSettings[Key], FileToSaveTo, "MacroToggles", Key)
        }
    
        for Key, Value in CVMAP {
            IniWrite(FixedSettings[Key], FileToSaveTo, "ToggleSettings", Key)
        }
    
        for Key, Value in TVMAP {
            IniWrite(FixedSettings[Key], FileToSaveTo, "TextSettings", Key)
        }
    
        for Key, Value in NVMAP {
            IniWrite(FixedSettings[Key], FileToSaveTo, "NumberSettings", Key)
        }
    
        global SettingsMap := Map()
        global SettingsArray := []
        SavedNum := 0
    
        loop files, A_ScriptDir "\MultiMacroV3Settings\*.ini" {
            SettingsMap[A_LoopFileName] := SettingsArray.Length + 1
            SettingsArray.InsertAt(SettingsArray.Length + 1, A_LoopFileName)

            if A_LoopFileName = FileName ".ini" {
                SavedNum := SettingsArray.Length
                IniWrite(SavedNum, "Info.ini", "LastLoadedSetting", "SettingNum")
            }
        }
    
        SettingDD.Delete()
        SettingDD.Add(SettingsArray)
        SettingDD.Choose(SavedNum)
        SSWText.Text := "NewSettingFile" SettingsArray.Length
    }
    
    SaveSettings(*) {
        SavedSettings := MMUI.Submit(false)
        PosSavedSettings := PositioningUI.Submit(false)
        FixedSettings := ObjToMap(SavedSettings)
        FixedPosSettings := ObjToMap(PosSavedSettings)

        if SavedSettings.LoadSetting = "" {
            SaveAsNewFile()
            return
        }
    
        FileToSaveTo := A_ScriptDir "\MultiMacroV3Settings\" SavedSettings.LoadSetting
    
        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                IniWrite(FixedPosSettings[Key "XPos"] "|" FixedPosSettings[Key "YPos"], FileToSaveTo, "Positioning", Key)
            } else {
                IniWrite(FixedPosSettings[Key "Pos"], FileToSaveTo, "Positioning", Key)
            }
        }
    
        for Key, Value in MMTogglesMap {
            IniWrite(FixedSettings[Key], FileToSaveTo, "MacroToggles", Key)
        }
    
        for Key, Value in CVMAP {
            IniWrite(FixedSettings[Key], FileToSaveTo, "ToggleSettings", Key)
        }
    
        for Key, Value in TVMAP {
            IniWrite(FixedSettings[Key], FileToSaveTo, "TextSettings", Key)
        }
    
        for Key, Value in NVMAP {
            IniWrite(FixedSettings[Key], FileToSaveTo, "NumberSettings", Key)
        }
    }

    UpdPositions(*) {
        SavedSettings := MMUI.Submit(false)
        PosSavedSettings := PositioningUI.Submit(false)
        FixedSettings := ObjToMap(SavedSettings)
        FixedPosSettings := ObjToMap(PosSavedSettings)

        if SavedSettings.LoadSetting = "" {
            SaveAsNewFile()
            return
        }
    
        FileToSaveTo := A_ScriptDir "\MultiMacroV3Settings\" SavedSettings.LoadSetting
    
        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                IniWrite(FixedPosSettings[Key "XPos"] "|" FixedPosSettings[Key "YPos"], FileToSaveTo, "Positioning", Key)
            } else {
                IniWrite(FixedPosSettings[Key "Pos"], FileToSaveTo, "Positioning", Key)
            }
        }
    }
}   

LoadSettings() {
    LastSettingFile := A_ScriptDir "\MultiMacroV3Settings\" IniRead(A_ScriptDir "\Info.ini", "LastLoadedSetting", "Setting")
    global CurrentLoadedSetting := IniRead("Info.ini", "LastLoadedSetting", "SettingNum")

    for Key, Value in PositionMap {
        if Type(Value) = "Array" {
            SplitStr := StrSplit(IniRead(LastSettingFile, "Positioning", Key), "|")
            PositionMap[Key] := [SplitStr[1],SplitStr[2]]
        } else {
            PositionMap[Key] := IniRead(LastSettingFile, "Positioning", Key)
        }
    } 

    for Key, Value in MMTogglesMap {
        MMTogglesMap[Key] := IniRead(LastSettingFile, "MacroToggles", Key)
    }

    for Key, Value in CVMAP {
        CVMAP[Key] := IniRead(LastSettingFile, "ToggleSettings", Key)
    }

    for Key, Value in TVMAP {
        TVMAP[Key] := IniRead(LastSettingFile, "TextSettings", Key)
    }

    for Key, Value in NVMAP {
        NVMAP[Key] := IniRead(LastSettingFile, "NumberSettings", Key)
    }
}

DonateUIitUp(*) {
    DonateUI.Show()
}

OpenDonation(*) {
    Run "https://paypal.me/JeneneT"
}

try {
    LoadSettings()
}

UiItUp()

JoinDiscordButton(*) {
    Run "https://discord.com/invite/JrwB6jVxkR"
}

YTButton(*) {
    Run "https://www.youtube.com/channel/UCKOkQGvHO71nqQjwTiJX5Ww"
}

EnableMacro(*) {
    if RunningMultiInstance {
        MultiInstanceUI.Submit()
        for _, Evil in MI_UIS {
            for i, v in Evil {
                if Type(v) = "Gui" {
                    v.Submit()
                }
            }
        }
        global MacroSetup := true
    } else {
        FinalValues := ObjToMap(MMUI.Submit())
        PosFinalValues := ObjToMap(PositioningUI.Submit())

        for Key, Value in PositionMap {
            if Type(Value) = "Array" {
                PositionMap[Key] := [PosFinalValues[Key "XPos"], PosFinalValues[Key "YPos"]]
            } else {
                PositionMap[Key] := PosFinalValues[Key "Pos"]
            }
        } 
    
        for Key, Value in MMTogglesMap {
            MMTogglesMap[Key] := FinalValues[Key]
        }
    
        for Key, Value in CVMAP {
            CVMAP[Key] := FinalValues[Key]
        }
    
        for Key, Value in TVMAP {
            TVMAP[Key] := FinalValues[Key]
        }
    
        for Key, Value in NVMAP {
            NVMAP[Key] := FinalValues[Key]
        }

        global MacroSetup := true
    }
}





; Main Functions
VendingItUp() {
    StartTime := A_TickCount
    RunTime := A_TickCount
    XTL := PositionMap["MiniXTL"]
    XBR := PositionMap["MiniXBR"]
    OPB := SpaceOutPositions(PositionMap["OptimalPotionBuy"], 10, false)

    if StupidCatCheck() {
        SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ", 1}"
        Sleep(300)
        SendEvent "{Space Down}{Space Up}"
    }


    loop {
        if A_TickCount - RunTime >= NVMAP["VendingMachineTimeOut"] { ; Timeout Loop
            OutputDebug("Vending Machines Timed Out : Function Took = " ToSeconds(A_TickCount - StartTime) "s")
            break
        }

        if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
            if PixelSearch(&u, &u, OPB[1], OPB[2], OPB[3], OPB[4], 0x74F40A, 5) {
                RunTime := A_TickCount
                MiniTimeOut := A_TickCount

                if StupidCatCheck() {
                    SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ", 1}"
                    break
                }

                loop {
                    SendEvent "{Click, " PositionMap["OptimalPotionBuy"][1] ", " PositionMap["OptimalPotionBuy"][2] ", 1}"

                    if PixelSearch(&u,&u, XTL[1], XTL[2], XBR[1], XBR[2], 0xFF0B4E, 5) {
                        break
                    }

                    if A_TickCount - MiniTimeOut >= 3000 {
                        break
                    }

                    Sleep(200)
                }

                if CVMAP["SingleVendingMachinePurchase"] {
                    break
                }
            }
        }
    }
}

MerchantItUp() {
    X1 := PositionMap["MerchantButtonX1"]
    X2 := PositionMap["MerchantButtonX2"]
    X3 := PositionMap["MerchantButtonX3"]
    Y1 := PositionMap["MerchantButtonY1*Y"]
    Y2 := PositionMap["MerchantButtonY2*Y"]

    PositionsCreator := CreatePositions([X1, X2, X3], [Y1, Y2])

    loop 5 {
        for _, PositionArray in PositionsCreator {
            SendEvent "{Click, " PositionArray[1] ", " PositionArray[2] ", 0}"
            Sleep(20)
            SendEvent "{Click, " PositionArray[1] ", " PositionArray[2] ", 1}"
            Sleep(200)
        }
    }

    SendEvent "{Click, " PositionMap["X"][1] ", " PositionMap["X"][2] ", 1}"
}

FreeGiftItUp() {
    fgx1 := PositionMap["FreeGiftX1"]
    fgx2 := PositionMap["FreeGiftX2"]
    fgx3 := PositionMap["FreeGiftX3"]
    fgx4 := PositionMap["FreeGiftX4"]

    fgy1 := PositionMap["FreeGiftY1*Y"]
    fgy2 := PositionMap["FreeGiftY2*Y"]
    fgy3 := PositionMap["FreeGiftY3*Y"]

    Positionized := CreatePositions([fgx1, fgx2, fgx3, fgx4], [fgy1, fgy2, fgy3])

    Sleep(20)
    SendEvent "{Click, " PositionMap["FreeGiftButton"][1] ", " PositionMap["FreeGiftButton"][2] ", 1}"
    BreakTime := A_TickCount
    loop {
        if PixelSearch(&u,&u,PositionMap["MiniXTL"][1],PositionMap["MiniXTL"][2],PositionMap["MiniXBR"][1],PositionMap["MiniXBR"][2], 0xFF0B4E, 5) {
            break
        }
        if A_TickCount - BreakTime >= 10000 {
            break
        }
    }

    for _ArrayPosNum, ArrayPos in Positionized {
        SendEvent "{Click, " ArrayPos[1] ", " ArrayPos[2] ", 1}"
        Sleep(200)
    }

    Sleep(200)
    SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ", 1}"
}

UseItemTillFailure(Item) { ; why is this here
    TotalRunTime := A_TickCount
    if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
        SendEvent "{F Down}{F Up}"
        BreakLoopTime := A_TickCount
        loop {
            if A_TickCount - BreakLoopTime >= 5000 {
                break
            }
            if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                break
            }
        }
        Sleep(100)
        SendEvent "{Click, " PositionMap["BackPackButton"][1] ", " PositionMap["BackPackButton"][2] ", 1}"
        Sleep(400)
    }

    WhiteBGCheck := 0
    StupidCatCheckNum := 0
    FucntionRunTime := A_TickCount
    TotalRunTime := A_TickCount
    CheckArea := SpaceOutPositions(PositionMap["ItemMiddle"], 5, false)
    IM := PositionMap["ItemMiddle"]

    Sleep(100)
    SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
    Sleep(50)
    SendText Item
    Sleep(200)
    
    ItemPixelColor := PixelGetColor(PositionMap["ItemMiddle"][1], PositionMap["ItemMiddle"][2])
    SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
    loop {
        if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
            Sleep(200)
            if StupidCatCheck() {
                StupidCatCheckNum += 1

                if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                    SendEvent "{F Down}{F Up}"
                    Sleep(200)
                    SendEvent "{F Down}{F Up}"
                    break
                }
            }
            SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
            SendEvent "{F Down}{F Up}"
            BreakLoopTime := A_TickCount
            loop {
                if A_TickCount - BreakLoopTime >= 5000 {
                    break
                }
                if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                    break
                }
            }
            Sleep(100)
            SendEvent "{Click, " PositionMap["BackPackButton"][1] ", " PositionMap["BackPackButton"][2] ", 1}"
            Sleep(400)
            SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
            Sleep(50)
            SendText Item
            Sleep(200)
        }

        if PixelSearch(&u,&u, CheckArea[1],CheckArea[2],CheckArea[3],CheckArea[4], ItemPixelColor, 1) {
            if PixelSearch(&u,&u, IM[1], IM[2], IM[1], IM[2], 0xFFFFFF, 5) {
                WhiteBGCheck += 1

                if WhiteBGCheck >= 3 {
                    SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                    Sleep(100)
                    SendEvent "{F Down}{F Up}"
                    break
                }

                SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                Sleep(100)
                SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                Sleep(50)
                SendText Item
            } else {
                SendEvent "{Click, " IM[1] ", " IM[2] ", 1}"
            }
        } else {
            Sleep(200)
            if StupidCatCheck() {
                StupidCatCheckNum += 1
                if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                    SendEvent "{F Down}{F Up}"
                    Sleep(200)
                    SendEvent "{F Down}{F Up}"
                    break
                }
            }
        }

        if StupidCatCheck() {
        StupidCatCheckNum += 1
            if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                SendEvent "{F Down}{F Up}"
                Sleep(200)
                SendEvent "{F Down}{F Up}"
                break
            }
        }
    }
}

MultipleUseItemTillFailure(ItemArray) {
    TotalRunTime := A_TickCount
    CheckArea := SpaceOutPositions(PositionMap["ItemMiddle"], 5, false)
    IM := PositionMap["ItemMiddle"]

    for _ItemNum, Item in ItemArray {
        WhiteBGCheck := 0
        StupidCatCheckNum := 0
        FucntionRunTime := A_TickCount
        RetypeCheck := A_TickCount
        RetypeNumCheck := 0 

        if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
            SendEvent "{F Down}{F Up}"
            BreakLoopTime := A_TickCount
            loop {
                if A_TickCount - BreakLoopTime >= 5000 {
                    break
                }
                if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                    break
                }
            }
            Sleep(100)
            SendEvent "{Click, " PositionMap["BackPackButton"][1] ", " PositionMap["BackPackButton"][2] ", 1}"
            Sleep(400)
        }

        Sleep(100)
        SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
        Sleep(50)
        SendText Item
        Sleep(500)

        ItemPixelColor := PixelGetColor(PositionMap["ItemMiddle"][1], PositionMap["ItemMiddle"][2])
        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"

        loop {
            if A_TickCount - FucntionRunTime >= 30000 {
                break
            }

            if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                Sleep(500)
                if StupidCatCheck() {
                    StupidCatCheckNum += 1
    
                    if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                        SendEvent "{F Down}{F Up}"
                        Sleep(600)
                        break
                    }
                }
                SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                SendEvent "{F Down}{F Up}"
                BreakLoopTime := A_TickCount
                loop {
                    if A_TickCount - BreakLoopTime >= 5000 {
                        break
                    }
                    if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                        break
                    }
                }
                Sleep(100)
                SendEvent "{Click, " PositionMap["BackPackButton"][1] ", " PositionMap["BackPackButton"][2] ", 1}"
                Sleep(400)
                SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                Sleep(50)
                SendText Item
                Sleep(200)
            }
    
            if PixelSearch(&u,&u, CheckArea[1],CheckArea[2],CheckArea[3],CheckArea[4], ItemPixelColor, 10) {
                if PixelSearch(&u,&u, IM[1], IM[2], IM[1], IM[2], 0xFFFFFF, 5) {
                    WhiteBGCheck += 1
    
                    if WhiteBGCheck >= 3 {
                        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                        Sleep(100)
                        SendEvent "{F Down}{F Up}"
                        break
                    }
    
                    SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                    Sleep(100)
                    SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                    Sleep(50)
                    SendText Item
                } else {
                    SendEvent "{Click, " IM[1] ", " IM[2] ", 1}"
                }
            } else {
                Sleep(500)
                if StupidCatCheck() {
                    StupidCatCheckNum += 1
                    if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                        SendEvent "{F Down}{F Up}"
                        Sleep(600)
                        break
                    }
                } else {
                    if A_TickCount - RetypeCheck >= 2500 {
                        RetypeCheck := A_TickCount
                        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                        Sleep(300)
                        SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                        Sleep(50)
                        SendText Item
                        Sleep(100)
                        RetypeNumCheck += 1
                        if RetypeNumCheck >= 3 {
                            break
                        }
                    }
                }
            }
    
            if StupidCatCheck() {
            StupidCatCheckNum += 1
                if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                    SendEvent "{F Down}{F Up}"
                    Sleep(600)
                    break
                }
            }
        }
    }    
}

MultipleSingleUseItem(ItemArray, Delay) {
    TotalRunTime := A_TickCount
    CheckArea := SpaceOutPositions(PositionMap["ItemMiddle"], 5, false)
    IM := PositionMap["ItemMiddle"]

    for _ItemNum, Item in ItemArray {
        WhiteBGCheck := 0
        StupidCatCheckNum := 0
        FucntionRunTime := A_TickCount
        RetypeCheck := A_TickCount

        if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
            SendEvent "{F Down}{F Up}"
            BreakLoopTime := A_TickCount
            loop {
                if A_TickCount - BreakLoopTime >= 5000 {
                    break
                }
                if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                    break
                }
            }
            Sleep(100)
            SendEvent "{Click, " PositionMap["BackPackButton"][1] ", " PositionMap["BackPackButton"][2] ", 1}"
            Sleep(400)
        }

        Sleep(100)
        SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
        Sleep(50)
        SendText Item
        Sleep(200)

        ItemPixelColor := PixelGetColor(PositionMap["ItemMiddle"][1], PositionMap["ItemMiddle"][2])
        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"

        loop {
            if A_TickCount - FucntionRunTime >= 30000 {
                break
            }

            if not PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                Sleep(500)
                if StupidCatCheck() {
                    StupidCatCheckNum += 1
    
                    if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                        SendEvent "{F Down}{F Up}"
                        Sleep(600)
                        break
                    }
                }
                SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                SendEvent "{F Down}{F Up}"
                BreakLoopTime := A_TickCount
                loop {
                    if A_TickCount - BreakLoopTime >= 5000 {
                        break
                    }
                    if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                        break
                    }
                }
                Sleep(100)
                SendEvent "{Click, " PositionMap["BackPackButton"][1] ", " PositionMap["BackPackButton"][2] ", 1}"
                Sleep(400)
                SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                Sleep(50)
                SendText Item
                Sleep(200)
            }
    
            if PixelSearch(&u,&u, CheckArea[1],CheckArea[2],CheckArea[3],CheckArea[4], ItemPixelColor, 1) {
                if PixelSearch(&u,&u, IM[1], IM[2], IM[1], IM[2], 0xFFFFFF, 5) {
                    WhiteBGCheck += 1
    
                    if WhiteBGCheck >= 3 {
                        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                        Sleep(100)
                        SendEvent "{F Down}{F Up}"
                        break
                    }
    
                    SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                    Sleep(100)
                    SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                    Sleep(50)
                    SendText Item
                } else {
                    SendEvent "{Click, " IM[1] ", " IM[2] ", 1}"
                    break
                }
            } else {
                Sleep(500)
                if StupidCatCheck() {
                    StupidCatCheckNum += 1
                    if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                        SendEvent "{F Down}{F Up}"
                        Sleep(600)
                        break
                    }
                } else {
                    if A_TickCount - RetypeCheck >= 2500 {
                        RetypeCheck := A_TickCount
                        SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                        Sleep(50)
                        SendText Item
                        Sleep(100)
                    }
                }
            }
    
            if StupidCatCheck() {
            StupidCatCheckNum += 1
                if StupidCatCheckNum >= NVMAP["StupidCatCheckNum"] {
                    SendEvent "{F Down}{F Up}"
                    Sleep(600)
                    break
                }
            }
        }

        Sleep(Delay)
    }    
}

DaycareItUp() {
    InSuperComputer := false
    BreakTime := A_TickCount
    loop {
        if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
            InSuperComputer := true
            break
        }
        if A_TickCount - BreakTime >= 10000 {
            break
        }
        SendEvent "{Space Down}{Space Up}"
        Sleep(100)
    }
    if InSuperComputer {
        SendEvent "{Click, " PositionMap["DaycareButton"][1] ", " PositionMap["DaycareButton"][2] ", 1}"
        Sleep(750)
        SendEvent "{Click, " PositionMap["DaycareEnrollbutton"][1] ", " PositionMap["DaycareEnrollbutton"][2] ", 1}"
        Sleep(1000)
        SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
        Sleep(100)
        SendText TVMAP["ChosenDaycarePet"]
        Sleep(600)
        SendEvent "{Shift Down}{Click, " PositionMap["DaycarePetButton"][1] ", " PositionMap["DaycarePetButton"][2] ", 1}"
        Sleep(600)
        SendEvent "{Shift Up}{Click, " PositionMap["DaycareOKButton"][1] ", " PositionMap["DaycareOKButton"][2] ", 1}"


        BreakTime := A_TickCount
        FoundX := false
        loop {
            if PixelSearch(&u,&u,PositionMap["MiniXTL"][1],PositionMap["MiniXTL"][2],PositionMap["MiniXBR"][1],PositionMap["MiniXBR"][2], 0xFF0B4E, 5) {
                FoundX := true
                break
            }

            if A_TickCount - BreakTime >= 10000 {
                break
            }
            Sleep(100)
        }

        if FoundX {
            Sleep(500)
            SendEvent "{Click, " PositionMap["YesButton"][1] ", " PositionMap["YesButton"][2] ", 1}"
        }
    }
}

TeleportToZone(SpecificName) {
    Sleep(400)
    SendEvent "{Click, " PositionMap["TpButtonRedPart"][1] ", " PositionMap["TpButtonRedPart"][2] ", 1}"
    Sleep(400)
        BreakTime := A_TickCount
        SecondaryBreakTime := A_TickCount
        loop {
            if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                break
            }
            if A_TickCount - BreakTime >= 6000 {
                SendEvent "{Click, " PositionMap["TpButtonRedPart"][1] ", " PositionMap["TpButtonRedPart"][2] ", 1}"
                BreakTime := A_TickCount
            }
            if A_TickCount - SecondaryBreakTime >= 20000 {
                break
            }
            Sleep(100)
        }

        Sleep(300)
        SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
        Sleep(100)
        SendText SpecificName

        Sleep(250)
        SendEvent "{Click, " PositionMap["TpMenuButtonX3"] ", " PositionMap["TpMenuButtonY1*Y"] ", 1}"
        Sleep(NVMAP["TpWaitTime"])
}

AutoReconnectItUp() {
    AreThouDisconnected := DisconnectedCheck()
    if AreThouDisconnected {
        BreakTime := A_TickCount
        loop {
            SendEvent "{Click, " PositionMap["ReconnectButton"][1] ", " PositionMap["ReconnectButton"][2] ", 1}"
            Sleep(100)
            if PixelSearch(&A, &A, PositionMap["TpButtonRedPartTL"][1],PositionMap["TpButtonRedPartTL"][2],PositionMap["TpButtonRedPartBR"][1],PositionMap["TpButtonRedPartBR"][2], 0xEC0D3A, 15) {
                break
            }
            Sleep(100)
            if A_TickCount - BreakTime >= 45000 {
                Break
            }
        }

        return true
    }
    return false
}

AutoReconnectItUp2(LastInstance) {
    AreThouDisconnected := DisconnectedCheck()

    for InstanceID, InstanceInfoArray in RBLXInstancesMAP {
        if A_TickCount - InstanceInfoArray[6] >= 600000 and not (InstanceID = LastInstance) {
            WinActivate("ahk_id" InstanceID)
            WinMove(0,0,A_ScreenWidth, A_ScreenHeight, "ahk_id" InstanceID)
            WinMaximize("ahk_id" InstanceID)

            loop 5 {
                SendEvent "{Click, " A_ScreenWidth/2 ", " A_ScreenHeight/2 ", 1}"
                Sleep(100)
            }
            RBLXInstancesMAP[InstanceID][6] := A_TickCount
        }
    }

    WinActivate("ahk_id" LastInstance)
    WinMove(0,0,A_ScreenWidth, A_ScreenHeight, "ahk_id" LastInstance)
    WinMaximize("ahk_id" LastInstance)

    if AreThouDisconnected {
        BreakTime := A_TickCount
        loop {
            SendEvent "{Click, " PositionMap["ReconnectButton"][1] ", " PositionMap["ReconnectButton"][2] ", 1}"
            Sleep(100)
            if PixelSearch(&A, &A, PositionMap["TpButtonRedPartTL"][1],PositionMap["TpButtonRedPartTL"][2],PositionMap["TpButtonRedPartBR"][1],PositionMap["TpButtonRedPartBR"][2], 0xEC0D3A, 15) {
                break
            }
            Sleep(100)
            if A_TickCount - BreakTime >= 45000 {
                Break
            }
        }

        return true
    }
    return false
}


; Main Script
F3::{
    if not MacroSetup {
        return
    }
    if RunningMultiInstance {
        for InstanceID, InstanceArray in RBLXInstancesMAP {
            if InstanceArray[5] != -1 {
                MMTogglesMap := InstanceArray[3][1]
                CVMAP := InstanceArray[3][2]
                TVMAP := InstanceArray[3][4]
                NVMAP := InstanceArray[3][3]
                PositionMap := InstanceArray[3][5]

                RBLXInstancesMAPTime[InstanceID] := 0
                RBLXInstancesMAP[InstanceID][6] := A_TickCount

                Sleep(400)
                WinActivate("ahk_id" InstanceID)
                WinMove(0,0,A_ScreenWidth, A_ScreenHeight, "ahk_id" InstanceID)
                WinMaximize("ahk_id" InstanceID)

                BreakTime := A_TickCount
                loop {
                    if PixelSearch(&A, &A, PositionMap["TpButtonRedPartTL"][1],PositionMap["TpButtonRedPartTL"][2],PositionMap["TpButtonRedPartBR"][1],PositionMap["TpButtonRedPartBR"][2], 0xEC0D3A, 15) {
                        break
                    }
                    Sleep(100)
                    if A_TickCount - BreakTime >= 15000 {
                        MsgBox("lowkey cant find the tp button`nAre the postions / resolutions setup correctly?")
                        ExitApp()
                    }
                }
        
                ; World Check
                Sleep(100)
                SendEvent "{Click, " PositionMap["TpButtonRedPart"][1] ", " PositionMap["TpButtonRedPart"][2] ", 1}"
                BreakTime := A_TickCount
                loop {
                    if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                        break
                    }
                    if A_TickCount - BreakTime >= 6000 {
                        break
                    }
                    Sleep(100)
                }
        
                SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
                Sleep(100)
                SendText "Rainbow River"
        
                NewPos := SpaceOutPositions([PositionMap["TpMenuButtonX3"], PositionMap["TpMenuButtonY1*Y"]], 8, false)
        
                BreakTime := A_TickCount
                W1 := false
                loop{
                    if PixelSearch(&u,&u, NewPos[1],NewPos[2],NewPos[3],NewPos[4], 0x74F40A, 5) {
                        W1 := true
                        break
                    }
                    if A_TickCount - BreakTime >= 2300 {
                        break
                    }
                    Sleep(100)
                }
        
                if W1 {
                    RBLXInstancesMAP[InstanceID][4] := "w1"
                    OutputDebug("w1")
                } else {
                    RBLXInstancesMAP[InstanceID][4] := "w2"
                    OutputDebug("w2")
                }
            }

            Sleep(100)
            SendEvent "{Click, " PositionMap["X"][1] ", " PositionMap["X"][2] ", 1}"
            Sleep(300)
        }

        loop {
            for InstanceID, InstanceArray in RBLXInstancesMAP {
                if A_TickCount - RBLXInstancesMAPTime[InstanceID] >= InstanceArray[3][3]["LoopTime"] {
                    global MMTogglesMap := InstanceArray[3][1]
                    global CVMAP := InstanceArray[3][2]
                    global TVMAP := InstanceArray[3][4]
                    global NVMAP := InstanceArray[3][3]
                    global PositionMap := InstanceArray[3][5]

                    Sleep(400)
                    WinActivate("ahk_id" InstanceID)
                    WinMove(0,0,A_ScreenWidth, A_ScreenHeight, "ahk_id" InstanceID)
                    WinMaximize("ahk_id" InstanceID)

                    if RBLXInstancesMAP[InstanceID][4] = "w1" {
                        if MMTogglesMap["CycleVendingMachines"] {
                            for AreaName, Route in W1Vends {
                                if (AreaName = "Underworld" or AreaName = "Samuari Village") and not CVMAP["CycleDiamondVendingMachines"] {
                                    continue
                                }
        
                                TeleportToZone(AreaName)
                                if StupidCatCheck() {
                                    SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ", 1}"
                                    Sleep(300)
                                }
                                Route()
                                Sleep(400)
                                VendingItUp()
                                Sleep(400)
                            }
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        if MMTogglesMap["CycleMerchants"] {
                            for AreaName, Route in W1Merchants {
                                if (AreaName = "Flower Field" or AreaName = "Frost Mountains") and not CVMAP["CycleUselessMerchants"] {
                                    continue
                                }
                                TeleportToZone(AreaName)
                                Route()
                                Sleep(400)
                                MerchantItUp()
                                Sleep(400)
                            }
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        if MMTogglesMap["ClaimFreeGifts"] {
                            FreeGiftItUp()
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        if MMTogglesMap["ConsumeFruits"] {
                            MultipleUseItemTillFailure(["Apple", "Banana", "Orange", "Pineapple", "Watermelon", "Rainbow Fruit"])
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        RBLXInstancesMAPTime[InstanceID] := A_TickCount
                        RBLXInstancesMAP[InstanceID][6] := A_TickCount
                    } else if RBLXInstancesMAP[InstanceID][4] = "w2" {
                        if RBLXInstancesMAP[InstanceID][5] = 99 {
                            Sleep(300)
                            SendEvent "{W Down}"
                            Sleep(2000)
                            SendEvent "{W Up}"
                            Sleep(500)
        
                            loop 30 {
                                SendEvent "{Click, " PositionMap["TopOfGame"] ", " PositionMap["TopOfGame"] ", 1}"
                                SendEvent "{Click, " PositionMap["TopOfGame"] ", " PositionMap["TopOfGame"] ", 1}"
                                Sleep(100)
                            }
                        }


                        if MMTogglesMap["CycleVendingMachines"] {
                            RBLXInstancesMAP[InstanceID][5] := 100
                            for AreaName, Route in W2Vends {
                                TeleportToZone(AreaName)
                                if StupidCatCheck() {
                                    SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ", 1}"
                                    Sleep(300)
                                }
                                Route()
                                Sleep(400)
                                VendingItUp()
                                Sleep(400)
                            }
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        ; merchants (theres none)
        
                        if MMTogglesMap["AutoDaycare"] {
                            RBLXInstancesMAP[InstanceID][5] := 100
                            TeleportToZone("Tech Spawn")
                            R_SuperComputer()
                            Sleep(400)
                            DaycareItUp()
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        if MMTogglesMap["AutoFlag"] or MMTogglesMap["AutoSprinkler"] {
                            if RBLXInstancesMAP[InstanceID][5] != 149 {
                                TeleportToZone("Alien Lab")
                                SendEvent "{Q Down}{Q Up}"
                                Sleep(100)
                                SendEvent "{S Down}"
                                Sleep(NVMAP["DistanceIntoFinalZone"])
                                SendEvent "{S Up}"
                                RBLXInstancesMAP[InstanceID][5] := 149
                            }
        
                            if CVMAP["UserOwnsAutoFarm"] {
                                AFTL := PositionMap["AutofarmTL"]
                                AFBR := PositionMap["AutofarmBR"]
                                AF := PositionMap["Autofarm"]
        
                                if PixelSearch(&lll, &ll2, AFTL[1], AFTL[2], AFBR[1], AFBR[2], 0xFF1055, 20) {
                                    SendEvent "{Click, " AF[1] ", " AF[2] ", 1}"
                                }
                                Sleep(100)
                            }
                            
                            if MMTogglesMap["AutoFlag"] and MMTogglesMap["AutoSprinkler"] {
                                MultipleUseItemTillFailure([TVMAP["TypeOfFlag"], "Sprinkler"])
                            } else if MMTogglesMap["AutoFlag"] {
                                MultipleUseItemTillFailure([TVMAP["TypeOfFlag"]])
                            } else if MMTogglesMap["AutoSprinkler"] {
                                MultipleUseItemTillFailure(["Sprinkler"])
                            }
        
                            if MMTogglesMap["ConsumeFruits"] {
                                MultipleUseItemTillFailure(["Apple", "Banana", "Orange", "Pineapple", "Watermelon", "Rainbow Fruit"])
                            }
                        } else if MMTogglesMap["ConsumeFruits"] {
                            MultipleUseItemTillFailure(["Apple", "Banana", "Orange", "Pineapple", "Watermelon", "Rainbow Fruit"])
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        if MMTogglesMap["FarmFinalZone"] {
                            if RBLXInstancesMAP[InstanceID][5] != 149 {
                                TeleportToZone("Alien Lab")
                                SendEvent "{Q Down}{Q Up}"
                                Sleep(100)
                                SendEvent "{S Down}"
                                Sleep(NVMAP["DistanceIntoFinalZone"])
                                SendEvent "{S Up}"
                                RBLXInstancesMAP[InstanceID][5] := 149
                            }
        
                            if CVMAP["UserOwnsAutoFarm"] {
                                AFTL := PositionMap["AutofarmTL"]
                                AFBR := PositionMap["AutofarmBR"]
                                AF := PositionMap["Autofarm"]
        
                                if PixelSearch(&lll, &ll2, AFTL[1], AFTL[2], AFBR[1], AFBR[2], 0xFF1055, 20) {
                                    SendEvent "{Click, " AF[1] ", " AF[2] ", 1}"
                                }
                                Sleep(100)
                            }
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }
        
                        if MMTogglesMap["OpenBestEgg"] and not MMTogglesMap["FarmFinalZone"] {
                            TeleportToZone("Tech Spawn")
                            RBLXInstancesMAP[InstanceID][5] := 99
        
                            AHTL := PositionMap["AutoHatchTL"]
                            AHBR := PositionMap["AutoHatchBR"]
                            AH := PositionMap["AutoHatch"]
        
                            if PixelSearch(&lll, &ll2, AHTL[1], AHTL[2], AHBR[1], AHBR[2], 0xFF1055, 20) {
                                SendEvent "{Click, " AH[1] ", " AH[2] ", 1}"
                                Sleep(100)
                            }
        
                            R_Egg162()
                            Sleep(500)
                            loop 5 {
                                SendEvent "{E Down}{E Up}"
                                Sleep(300)
                                SendEvent "{Click, " PositionMap["EggBuyMax"][1] ", " PositionMap["EggBuyMax"][2] ", 1}"
                            }
                        }
        
                        if AutoReconnectItUp2(InstanceID) {
                            continue
                        }

                        RBLXInstancesMAP[InstanceID][6] := A_TickCount
                        RBLXInstancesMAPTime[InstanceID] := A_TickCount
                    } else {
                        MsgBox("How did you even get here? ALT")
                    }
                }
                Sleep(10)
            }
        }
    } else {
        WinActivate("ahk_exe RobloxPlayerBeta.exe")
        WinMove(0,0,A_ScreenWidth, A_ScreenHeight, "ahk_exe RobloxPlayerBeta.exe")
        WinMaximize("ahk_exe RobloxPlayerBeta.exe")
        BreakTime := A_TickCount
        loop {
            if PixelSearch(&A, &A, PositionMap["TpButtonRedPartTL"][1],PositionMap["TpButtonRedPartTL"][2],PositionMap["TpButtonRedPartBR"][1],PositionMap["TpButtonRedPartBR"][2], 0xEC0D3A, 15) {
                break
            }
            Sleep(100)
            if A_TickCount - BreakTime >= 15000 {
                MsgBox("lowkey cant find the tp button`nAre the postions / resolutions setup correctly?")
                ExitApp()
            }
        }

        ; World Check
        Sleep(100)
        SendEvent "{Click, " PositionMap["TpButtonRedPart"][1] ", " PositionMap["TpButtonRedPart"][2] ", 1}"
        BreakTime := A_TickCount
        loop {
            if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                break
            }
            if A_TickCount - BreakTime >= 6000 {
                break
            }
            Sleep(100)
        }

        SendEvent "{Click, " PositionMap["SearchBar"][1] ", " PositionMap["SearchBar"][2] ", 1}"
        Sleep(100)
        SendText "Rainbow River"

        NewPos := SpaceOutPositions([PositionMap["TpMenuButtonX3"], PositionMap["TpMenuButtonY1*Y"]], 8, false)

        BreakTime := A_TickCount
        W1 := false
        loop{
            if PixelSearch(&u,&u, NewPos[1],NewPos[2],NewPos[3],NewPos[4], 0x74F40A, 5) {
                W1 := true
                break
            }
            if A_TickCount - BreakTime >= 2300 {
                break
            }
            Sleep(100)
        }

        if W1 {
            global  CurrentWorld := "w1"
            OutputDebug("w1")
        } else {
            global CurrentWorld := "w2"
            OutputDebug("w2")
        }
    
        Sleep(100)
        SendEvent "{Click, " PositionMap["X"][1] ", " PositionMap["X"][2] ", 1}"
        Sleep(400)

        loop {
            if CurrentWorld = "w1" {
                if MMTogglesMap["CycleVendingMachines"] {
                    for AreaName, Route in W1Vends {
                        if (AreaName = "Underworld" or AreaName = "Samuari Village") and not CVMAP["CycleDiamondVendingMachines"] {
                            continue
                        }

                        TeleportToZone(AreaName)
                        if StupidCatCheck() {
                            SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ", 1}"
                            Sleep(300)
                        }
                        Route()
                        Sleep(400)
                        VendingItUp()
                        Sleep(400)
                    }
                }

                if AutoReconnectItUp() {
                    continue
                }

                if MMTogglesMap["CycleMerchants"] {
                    for AreaName, Route in W1Merchants {
                        if (AreaName = "Flower Field" or AreaName = "Frost Mountains") and not CVMAP["CycleUselessMerchants"] {
                            continue
                        }
                        TeleportToZone(AreaName)
                        Route()
                        Sleep(400)
                        MerchantItUp()
                        Sleep(400)
                    }
                }

                if AutoReconnectItUp() {
                    continue
                }

                if MMTogglesMap["ClaimFreeGifts"] {
                    FreeGiftItUp()
                }

                if AutoReconnectItUp() {
                    continue
                }

                if MMTogglesMap["ConsumeFruits"] {
                    MultipleUseItemTillFailure(["Apple", "Banana", "Orange", "Pineapple", "Watermelon", "Rainbow Fruit"])
                }

                if AutoReconnectItUp() {
                    continue
                }

                Sleep(NVMAP["LoopTime"])
            } else if CurrentWorld = "w2" {
                if MMTogglesMap["CycleVendingMachines"] {
                    global LastZone := 100
                    for AreaName, Route in W2Vends {
                        TeleportToZone(AreaName)
                        if StupidCatCheck() {
                            SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ", 1}"
                            Sleep(300)
                        }
                        Route()
                        Sleep(400)
                        VendingItUp()
                        Sleep(400)
                    }
                }

                if AutoReconnectItUp() {
                    continue
                }

                ; merchants (theres none)

                if MMTogglesMap["AutoDaycare"] {
                    global LastZone := 100
                    TeleportToZone("Tech Spawn")
                    R_SuperComputer()
                    Sleep(400)
                    DaycareItUp()
                }

                if AutoReconnectItUp() {
                    continue
                }

                if MMTogglesMap["AutoFlag"] or MMTogglesMap["AutoSprinkler"] {
                    if LastZone != 149 {
                        TeleportToZone("Alien Lab")
                        SendEvent "{Q Down}{Q Up}"
                        Sleep(100)
                        SendEvent "{S Down}"
                        Sleep(NVMAP["DistanceIntoFinalZone"])
                        SendEvent "{S Up}"
                        global LastZone := 149
                    }

                    if CVMAP["UserOwnsAutoFarm"] {
                        AFTL := PositionMap["AutofarmTL"]
                        AFBR := PositionMap["AutofarmBR"]
                        AF := PositionMap["Autofarm"]

                        if PixelSearch(&lll, &ll2, AFTL[1], AFTL[2], AFBR[1], AFBR[2], 0xFF1055, 20) {
                            SendEvent "{Click, " AF[1] ", " AF[2] ", 1}"
                        }
                        Sleep(100)
                    }
                    
                    if MMTogglesMap["AutoFlag"] and MMTogglesMap["AutoSprinkler"] {
                        MultipleUseItemTillFailure([TVMAP["TypeOfFlag"], "Sprinkler"])
                    } else if MMTogglesMap["AutoFlag"] {
                        MultipleUseItemTillFailure([TVMAP["TypeOfFlag"]])
                    } else if MMTogglesMap["AutoSprinkler"] {
                        MultipleUseItemTillFailure(["Sprinkler"])
                    }

                    if MMTogglesMap["ConsumeFruits"] {
                        MultipleUseItemTillFailure(["Apple", "Banana", "Orange", "Pineapple", "Watermelon", "Rainbow Fruit"])
                    }
                } else if MMTogglesMap["ConsumeFruits"] {
                    MultipleUseItemTillFailure(["Apple", "Banana", "Orange", "Pineapple", "Watermelon", "Rainbow Fruit"])
                }

                if AutoReconnectItUp() {
                    continue
                }

                if MMTogglesMap["FarmFinalZone"] {
                    if LastZone != 149 {
                        TeleportToZone("Alien Lab")
                        SendEvent "{Q Down}{Q Up}"
                        Sleep(100)
                        SendEvent "{S Down}"
                        Sleep(NVMAP["DistanceIntoFinalZone"])
                        SendEvent "{S Up}"
                        global LastZone := 149
                    }

                    if CVMAP["UserOwnsAutoFarm"] {
                        AFTL := PositionMap["AutofarmTL"]
                        AFBR := PositionMap["AutofarmBR"]
                        AF := PositionMap["Autofarm"]

                        if PixelSearch(&lll, &ll2, AFTL[1], AFTL[2], AFBR[1], AFBR[2], 0xFF1055, 20) {
                            SendEvent "{Click, " AF[1] ", " AF[2] ", 1}"
                        }
                        Sleep(100)
                    }

                    BreakTime := A_TickCount
                    loop {
                        if MMTogglesMap["AutoUseItem"] {
                            ItemUsageArray := []
                            if InStr(TVMAP["ItemToAutoUse"], ",") {
                                ItemUsageArray := StrSplit(TVMAP["ItemToAutoUse"], ",")
                            } else {
                                ItemUsageArray := [TVMAP["ItemToAutoUse"]]
                            }
    
                            MultipleSingleUseItem(ItemUsageArray, NVMAP["DelayBetweenItemUse"])
                        }

                        if MMTogglesMap["UseUltimate"] {
                            if PixelSearch(&u,&u,PositionMap["XTL"][1],PositionMap["XTL"][2],PositionMap["XBR"][1],PositionMap["XBR"][2], 0xEC0D3A, 15) {
                                SendEvent "{Click, " PositionMap["X"][1] ", " PositionMap["X"][2] ", 1}"
                                Sleep(300)
                            }

                            if PixelSearch(&u,&u,PositionMap["MiniXTL"][1],PositionMap["MiniXTL"][2],PositionMap["MiniXBR"][1],PositionMap["MiniXBR"][2], 0xFF0B4E, 5) {
                                SendEvent "{Click, " PositionMap["MiniX"][1] ", " PositionMap["MiniX"][2] ",1}"
                                Sleep(300)
                            }

                            Sleep(100)
                            SendEvent "{R Down}{R Up}"
                        }

                        if A_TickCount - BreakTime >= NVMAP["LoopTime"] {
                            break
                        }
                        Sleep(100)
                    }

                }

                if AutoReconnectItUp() {
                    continue
                }

                if MMTogglesMap["OpenBestEgg"] and not MMTogglesMap["FarmFinalZone"] {
                    TeleportToZone("Tech Spawn")

                    AHTL := PositionMap["AutoHatchTL"]
                    AHBR := PositionMap["AutoHatchBR"]
                    AH := PositionMap["AutoHatch"]

                    if PixelSearch(&lll, &ll2, AHTL[1], AHTL[2], AHBR[1], AHBR[2], 0xFF1055, 20) {
                        SendEvent "{Click, " AH[1] ", " AH[2] ", 1}"
                        Sleep(100)
                    }

                    R_Egg162()
                    Sleep(500)
                    loop 5 {
                        SendEvent "{E Down}{E Up}"
                        Sleep(300)
                        SendEvent "{Click, " PositionMap["EggBuyMax"][1] ", " PositionMap["EggBuyMax"][2] ", 1}"
                    }

                    breaktime := A_TickCount
                    loop {
                        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"

                        if A_TickCount - breaktime >= NVMAP["LoopTime"] {
                            break
                        }
                        Sleep(10)
                    }

                    Sleep(300)
                    SendEvent "{W Down}"
                    Sleep(2000)
                    SendEvent "{W Up}"
                    Sleep(500)

                    loop 30 {
                        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                        SendEvent "{Click, " PositionMap["TopOfGame"][1] ", " PositionMap["TopOfGame"][2] ", 1}"
                        Sleep(100)
                    }
                }

                if AutoReconnectItUp() {
                    continue
                }
            } else {
                MsgBox("How did you even get here?")
            }
        }
    }
}

F8::ExitApp
F6::{
    if not MacroSetup {
        return
    }

    global IsPaused
    if IsPaused {
        if RunningMultiInstance {
            MultiInstanceUI.Submit()
        } else {
            MMUI.Submit()
        }
        IsPaused := false
    } else {
        if RunningMultiInstance {
            MultiInstanceUI.Show()
        } else {
            MMUI.Show()
        }
        IsPaused := true
    }

    Pause -1
}

^LButton::{
    try {
        OutputDebug(Type(CurrentPostionLabel))
        if Type(CurrentPostionLabel) = "Array" {
            if Type(CurrentPostionLabel[2]) = "String" {
                if CurrentPostionLabel[2] = "X" {
                    MouseGetPos(&u,&u2)
                    CurrentPostionLabel[1].Text := u
                    global CurrentPostionLabel := ""
                } else {
                    MouseGetPos(&u,&u2)
                    CurrentPostionLabel[1].Text := u2
                    global CurrentPostionLabel := ""
                }
            } else {
                MouseGetPos(&u,&u2)
                CurrentPostionLabel[1].Text := u
                CurrentPostionLabel[2].Text := u2
                global CurrentPostionLabel := ""
            } 
        }
    }
}