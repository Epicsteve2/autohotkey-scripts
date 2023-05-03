#SingleInstance, Force
; SendMode Input
SetWorkingDir, %A_ScriptDir%

current_layer := "BTD6"
numpad8_layer := "The Eden of Grisaia"
tower_click := false
tower_upgrade := false
btd6_map := "X Factor"
; btd6_map := "Geared"

; sendinput breaks osu editor, some VN's and yea

; dumb syntax -> https://www.autohotkey.com/boards/viewtopic.php?t=66878
layer_list := ["Main"
    ,"Sugar * Style"
    ,"BTD6"
    ,"Dead Omegalul Aegis"
    ,"Rewrite"
    ,"Kinkoi"
    ,"Hatsukoi"
    ,"Hoshi Ori"
    ,"Cafe Stella"
    ,"Cyanotype Daydream"
    ,"Koichoco"
    ,"Parquet"
    ,"Summer Pockets"
    ,"Ever17"
    ,"The Fruit of Grisaia"
    ,"The Labyrinth of Grisaia"
    ,"The Eden of Grisaia"]

map_list := ["Chutes"
    ,"Bazaar"
    ,"Peninsula"
    ,"Underground"
    ,"Cargo"
    ,"Cornfield"
    ,"Flooded Valley"
    ,"X Factor"
    ,"Underground"
    ,"High Finance"
    ,"Adora's Temple"
    ,"Pat's Pond"
    ,"Dark Castle"
    ,"Encrypted"
    ,"Bloonarius Prime"
    ,"Infernal"
    ,"Haunted"
    ,"Spillway"
    ,"Quarry"
    ,"Mesa"
    ,"Geared"]

btd6_key_bindings := {"dart": "q"
    , "hero": "u"
    , "tack": "r"
    , "village": "k"
    , "alch": "f"
    , "sniper": "z"
    , "glue": "y"
    , "spike": "j"
    , "sub": "x"
    , "heli": "b"
    , "boomer": "w"
    , "bomb": "e"
    , "ice": "t"
    , "bucc": "c"
    , "ace": "v"
    , "heli": "b"
    , "mortar": "n"
    , "dartling": "m"
    , "wizard": "a"
    , "super": "s"
    , "druid": "g"
    , "farm": "h"
    , "ninja": "d"
    , "engineer": "l"}

cyanotype_daydream_layer := "No dream"
cyanotype_daydream_key_bindings := {"Rin": { "a": [1455, 1065]
        , "s": [1585, 1058]
        , "l": [1624, 1059]
        , "c": [1904, 884]
        , "f": [1498, 1065]
        , "y": [1841, 1066]
        , "o": [1887, 1061]
        , "m": [1887, 1061]} 
    , "Thinking and H-Scene": { "a": [1731, 1023]
        , "s": [1698, 1060]
        , "l": [1737, 1063]
        , "c": [1891, 1064]
        , "f": [1761, 1030]
        , "y": [1893, 979]
        , "o": [1849, 1063]
        , "m": [1849, 1063]} 
    , "No dream": { "a": [1824, 908]
        , "s": [1758, 1011]
        , "l": [1788, 1002]
        , "c": [1737, 1062]
        , "f": [1825, 939]
        , "y": [1879, 892]
        , "o": [1827, 1046]
        , "m": [1827, 1046]
        , "r": [473, 875]
        , "v": [473, 875]}
    , "Europe": {"a": [1193, 891]
        , "s": [1372, 889]
        , "l": [1482, 889]
        , "c": [1876, 892]
        , "f": [1234, 892]
        , "y": [1871, 1042]
        , "o": [1804, 891] 
        , "m": [1804, 891]
        , "r": [779, 869]
        , "v": [779, 869]}
    , "Car": {"a": [1255, 1060]
        , "s": [1398, 1065]
        , "l": [1493, 1060]
        , "c": [1900, 1060]
        , "f": [1288, 1060]
        , "y": [1849, 1063]
        , "o": [1693, 1060] 
        , "m": [1693, 1060]
        , "r": [583, 876]
        , "v": [583, 876]}}

keyboard_order := ["q"
    ,"w"
    ,"e"
    ,"r"
    ,"t"
    ,"y"
    ,"u"
    ,"i"
    ,"o"
    ,"p"
    ,"a"
    ,"s"
    ,"d"
    ,"f"
    ,"g"
    ,"h"
    ,"j"
    ,"k"
    ,"l"
    ,"z"
    ,"x"
    ,"c"
    ,"v"
    ,"b"
    ,"n"
    ,"m"]

ChangeLayer() {
    global layer_list
    global current_layer
    global keyboard_order

    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Current layer is: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, Font, S15 norm
    Gui, Add, Text, XM, % "Select a layer..."

    for index, layer in layer_list {
        Gui, Font, S15 bold
        Gui, Add, Text, XM Y+1, % "  " . keyboard_order[index]

        Gui, Font, S15 norm
        Gui, Add, Text, X+0 , % ": " . layer
    }

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Input, key_pressed, L1 T5
    Gui, Destroy

    for index, layer in layer_list {
        if (key_pressed = keyboard_order[index]) {
            current_layer := layer
            
            Gui, New, ToolWindow, 

            Gui, Font, S15, MesloLGS NF
            Gui, Add, Text, , % "Layer: "

            Gui, Font, S15 bold
            Gui, Add, Text, X+0, % layer

            Gui, -Caption +AlwaysOnTop
            Gui, Show, NoActivate AutoSize X1920 Y0,
            sleep, 750
            Gui, Destroy

            Break
        }
    } 
}

ChangeBTD6Map() {
    global btd6_map
    global map_list
    global keyboard_order

    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Current BTD6 map is: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % btd6_map

    Gui, Font, S15 norm
    Gui, Add, Text, XM, % "Select a map..."

    for index, map in map_list {
        Gui, Font, S15 bold
        Gui, Add, Text, XM Y+1, % "  " . keyboard_order[index]

        Gui, Font, S15 norm

        Gui, Add, Text, X+0 , % ": " . map
    }

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Input, key_pressed, L1 T5
    Gui, Destroy

    for index, map in map_list {
        if (key_pressed = keyboard_order[index]) {
            btd6_map := map
            
            Gui, New, ToolWindow, 

            Gui, Font, S15, MesloLGS NF
            Gui, Add, Text, , % "BTD6 Map: "

            Gui, Font, S15 bold
            Gui, Add, Text, X+0, % map

            Gui, -Caption +AlwaysOnTop
            Gui, Show, NoActivate AutoSize X1920 Y0,
            sleep, 750
            Gui, Destroy

            Break
        }
    } 
}

discordOrStrawberry() {
    if (WinActive("ahk_exe Discord.exe"))
        launchOrSwitchMusic()
    else
        launchOrSwitchDiscord()
}
launchOrSwitchFirefox() {
    if (WinExist("ahk_exe Discord.exe"))
        WinActivate, ahk_exe firefox.exe
    else
        Run "C:\Users\Stephen\AppData\Local\Mozilla Firefox\firefox.exe"
}
launchOrSwitchDiscord() {
    IfWinExist, ahk_exe Discord.exe
    {
        WinActivate, ahk_exe Discord.exe
    } 
    Else
    {
        Run "C:\Users\Stephen\AppData\Local\Discord\Update.exe"
    }
    Return
}
launchOrSwitchMusic() {
    ; ; Can't find a good way to just activate the music playt
    ; if (WinExist("ahk_exe strawberry.exe"))
    ;     WinActivate, ahk_exe strawberry.exe, , "Strawberry",
    ; else
        Run "C:\Program Files\Strawberry Music Player\strawberry.exe"
    if (WinExist("ahk_exe strawberry.exe"))
        WinActivate, ahk_exe strawberry.exe, , "Strawberry",
}
launchOrSwitchCode() {
    if (WinExist("ahk_exe Code.exe"))
        if (WinActive("ahk_exe Code.exe"))
            WinActivateBottom, ahk_exe Code.exe
        else
            WinActivate, ahk_exe Code.exe
    Else
        Run "C:\Users\Stephen\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}

launchOrSwitchThunderbird() {
    if (WinExist("ahk_exe thunderbird.exe") and WinExist("ahk_class MozillaWindowClass"))
        WinActivate, ahk_exe thunderbird.exe
    Else
        Run "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe"
}

launchOrSwitchBottom() {
    ; WinExist("bottom") and 
    if (WinExist("ahk_exe WindowsTerminal.exe"))
        WinActivate
    else
        Run, % "wt -w 0 new-tab -p bottom --title bottom"
}

thunderbirdOrBottom() {
    if WinActive("ahk_exe WindowsTerminal.exe") {
        launchOrSwitchThunderbird()
    } else {
        launchOrSwitchBottom()
    }
}

Numpad0 & Numpad4::thunderbirdOrBottom()
NumpadDel & NumpadLeft::thunderbirdOrBottom()

; NumpadDot & e::launchOrSwitchBottom()
; NumpadDot & r::launchOrSwitchThunderbird()
; NumpadDot & t::thunderbirdOrBottom()

; www.autohotkey.com/board/topic/31878-get-alwaysontop-state/?p=203015
NumpadDot & t::
    active_window_id := WinExist("A")
    Winset, Alwaysontop, , % "ahk_id " . active_window_id
    WinGet, active_title, ProcessName, % "ahk_id " . active_window_id
    WinGet, ExStyle, ExStyle, % "ahk_id " . active_window_id
    if (ExStyle & 0x8)
        GuiTopLeft(active_title . "`nis now always on top")
    else
        GuiTopLeft(active_title . "`nis normal")
Return

; List of keybindings (manually updated...)
NumpadDot & /::
    ; what the f**k? Why do you have to escape '&'?
    keybinding_list := [["Numpad0 && t", "Toggle always on top"]
        ,["NumpadDot && Numpad1", "Select layer"]]
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Keybindings: "

    for index, keybind in keybinding_list {
        Gui, Font, S15 bold
        Gui, Add, Text, XM Y+1, % "  " . keybind[1]

        Gui, Font, S15 norm

        Gui, Add, Text, X+0 , % ": " . keybind[2]
    }

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    sleep, 5000
    Gui, Destroy
Return

clickAndReturn(x, y) {
    SetDefaultMouseSpeed, 0
    MouseGetPos, x_original, y_original 
    Send {Click %x%, %y%}

    ; idk why i need this lol
    ; more info -> //www.autohotkey.com/board/topic/57890-return-mouse-to-original-position-after-auto-click/?p=363564
    CoordMode, Mouse, Screen
    MouseMove, x_original, y_original
    Return
}

GuiTopLeft(string) {
    Gui, New, ToolWindow, 
    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % string
    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep 750
    Gui, Destroy
}

; RWin::F15
; Calculator
; Launch_App2::Media_Next
; RWin::Media_Play_Pause

; CapsLock::AppsKey

; RWin::AppsKey
; NumpadIns
Pause::f15
Insert::F13
ScrollLock::F14
NumpadDiv::Media_Prev
NumpadMult::Media_Play_Pause
NumpadSub::Media_Next

Numpad0::return
NumpadIns::return
Numpad0 up::Send {Numpad0}
NumpadIns up::Send {NumpadIns}

NumpadAdd::Return
NumpadAdd up::Send {NumpadAdd}

NumpadDel::return
NumpadDel up:: Send {NumpadDel}
NumpadDot::return
NumpadDot up::Send {NumpadDot}

Numpad0 & Numpad1::discordOrStrawberry()
Numpad0 & Numpad2::launchOrSwitchFirefox()
Numpad0 & Numpad3::launchOrSwitchCode()
NumpadIns & NumpadEnd::discordOrStrawberry()
NumpadIns & NumpadDown::launchOrSwitchFirefox()
NumpadIns & NumpadPgdn::launchOrSwitchCode()
NumpadDot & Numpad1::ChangeLayer()
NumpadDel & NumpadEnd::ChangeLayer()
NumpadDot & Numpad2::ChangeBTD6Map()
NumpadDel & NumpadDown::ChangeBTD6Map()

Numpad0 & NumpadDiv::NumpadDiv
Numpad0 & NumpadMult::NumpadMult
Numpad0 & NumpadSub::NumpadSub
Numpad0 & CapsLock::CapsLock

NumpadDel & NumpadDiv::NumpadDiv
NumpadDel & NumpadMult::NumpadMult
NumpadDel & NumpadSub::NumpadSub
NumpadDel & CapsLock::CapsLock

; Youtube speed setting
Numpad0 & s::
    SetDefaultMouseSpeed, 4 ; Defaul is 2
    Send {Click 1789, 1051}
    MouseMove, 1714, 829
    ; MouseMove, 1585, 835
Return

auto_click := false
#MaxThreadsPerHotKey, 2 ; this only affects this keybinding, nice!
Numpad0 & a::	
    global auto_click
    auto_click := !auto_click
    if auto_click
        GuiTopLeft("Auto click is on")
    else
        GuiTopLeft("Auto click is off")
    while (auto_click) {
        Click, Left
        sleep, 34
    }
return

CapsLock::Esc 

; ; Layers
; Main
Numpad0 & Numpad7::
    current_layer := "Main"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
NumpadIns & NumpadHome::
    current_layer := "Main"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
; The Eden of Grisaia
Numpad0 & Numpad8::
    current_layer := numpad8_layer
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
NumpadIns & NumpadUp::
    current_layer := numpad8_layer

    Gui, New, ToolWindow, 

 
    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,

    Sleep, 750
    Gui, Destroy
Return
; ; BTD6
; Numpad0 & Numpad4::
;     current_layer := "BTD6"
;     Gui, New, ToolWindow, 

;     Gui, Font, S15, MesloLGS NF
;     Gui, Add, Text, , % "Layer: "

;     Gui, Font, S15 bold
;     Gui, Add, Text, X+0, % current_layer

;     Gui, -Caption +AlwaysOnTop
;     Gui, Show, NoActivate AutoSize X1920 Y0,
;     Sleep, 750
;     Gui, Destroy
; Return
; NumpadIns & NumpadLeft::
;     current_layer := "BTD6"
;     Gui, New, ToolWindow, 

;     Gui, Font, S15, MesloLGS NF
;     Gui, Add, Text, , % "Layer: "

;     Gui, Font, S15 bold
;     Gui, Add, Text, X+0, % current_layer

;     Gui, -Caption +AlwaysOnTop
;     Gui, Show, NoActivate AutoSize X1920 Y0,
;     Sleep, 750
;     Gui, Destroy
; Return

; Reload script
NumpadIns & NumpadPgup::
    GuiTopLeft("Reloading script...")
    Reload
Return
Numpad0 & Numpad9::
    GuiTopLeft("Reloading script...")
    Reload
Return

; remove title bar
Numpad0 & t::
    WinSet, Style, -0xC00000, A
Return
NumpadIns & t::
    WinSet, Style, -0xC00000, A
Return

; test title bar
Numpad0 & y::
    WinSet, Style, -0xC00000, A
Return
NumpadIns & y::
    WinSet, Style, -0xC00000, A
Return

; Print cursor position. relative to window
Numpad0 & /::
    CoordMode, mouse, Screen
    MouseGetPos, x_position, y_position
    GuiTopLeft("The cursor is at`nx=" . x_position . ", y=" . y_position)
return
NumpadIns & /::
    CoordMode, mouse, Screen
    MouseGetPos, x_position, y_position
    GuiTopLeft("The cursor is at`nx=" . x_position . ", y=" . y_position)
Return
; Get absolute mouse pos
; NumpadDot & /::
;     CoordMode, mouse, Screen
;     MouseGetPos, x_position, y_position
;     GuiTopLeft("The cursor is at`nx=" . x_position . ", y=" . y_position)
; return
; Copy cursor position to clipboard
NumpadIns & NumpadClear::
    CoordMode, mouse, Screen
    MouseGetPos, x_position, y_position
    clipboard := x_position ", " y_position
    GuiTopLeft("Copied to clipboard:`n" . x_position . ", " . y_position)
Return
Numpad0 & Numpad5::
    CoordMode, mouse, Screen
    MouseGetPos, x_position, y_position
    clipboard := x_position ", " y_position
    GuiTopLeft("Copied to clipboard:`n" . x_position . ", " . y_position)
Return
; Open Window spy
Numpad0 & .::run, "C:\Program Files\AutoHotkey\WindowSpy.ahk"
NumpadIns & .::run, "C:\Program Files\AutoHotkey\WindowSpy.ahk"

NumpadDot & q:: ; I think this is for cyanotype daydream, idk
    if (WinExist("Translation Aggregator v1.0.6 (Unofficial)") and WinExist("ahk_class Translation Aggregator Main Window") and WinExist("ahk_exe TranslationAggregator.exe")) {
        WinSet, Top,, % "Translation Aggregator v1.0.6 (Unofficial)"
        WinClose, % "Translation Aggregator v1.0.6 (Unofficial)"
    }
    if (WinExist("Menu Window") and WinExist("ahk_class Chrome_WidgetWin_1") and WinExist("ahk_exe userInterface.exe")) {
        WinHide, % "Menu Window"
    }
    if (WinExist("Translation Display Window") and WinExist("ahk_class Chrome_WidgetWin_1") and WinExist("ahk_exe userInterface.exe")) {
        WinSet, Top,, % "Translation Display Window"
        WinMove, % "Translation Display Window", , 1920, 0
    }
    if (WinExist("Screen Capture Window") and WinExist("ahk_class Chrome_WidgetWin_1") and WinExist("ahk_exe userInterface.exe")) {
        WinSet, Top,, % "Screen Capture Window"
        WinMove, % "Screen Capture Window", , 2600, 0
    }
    if (WinExist("Background Removal Window") and WinExist("ahk_class Chrome_WidgetWin_1") and WinExist("ahk_exe userInterface.exe")) {
        WinSet, Top,, % "Background Removal Window"
        WinMove, % "Background Removal Window", , 2880, 0, A_ScreenWidth / 2, A_ScreenHeight ;/ 2
    }
    if (WinExist("electron-quick-start") and WinExist("ahk_class Chrome_WidgetWin_1") and WinExist("ahk_exe userInterface.exe")) {
        WinSet, Top,, % "electron-quick-start"
        WinMove, % "electron-quick-start", , 301, 960, 1300, 104 ; for cyanotype (and prolly principia games and newton)
        WinSet AlwaysOnTop, On, % "electron-quick-start"
    }
    if (WinExist("C:\windows\system32\cmd.exe") and WinExist("ahk_class ConsoleWindowClass") and WinExist("ahk_exe userInterface.exe")) {
        WinHide, % "C:\windows\system32\cmd.exe"
    }
    ; brightness min is 171
Return

NumpadDot & w::
    WinGetTitle, active_title, A
    GuiTopLeft("Active window is:`n" . active_title)
Return

#Include, visual-novels.ahk
#Include, btd6.ahk

; https://www.autohotkey.com/boards/viewtopic.php?t=57703
#Include, easy-window-dragging.ahk
!LButton::WindowMouseDragMove()
!RButton::WindowMouseDragResize()