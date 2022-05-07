; https://www.reddit.com/r/AutoHotkey/comments/mgalh9/comment/gssc2af/?utm_source=share&utm_medium=web2x&context=3
#if (current_layer = "Rewrite")
    ifRewrite(key, x, y) {
        SetTitleMatchMode, RegEx

        if WinActive("^Rewrite*")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    ; https://www.autohotkey.com/boards/viewtopic.php?p=186138#p186138
    $a::ifRewrite("a", 1016, 1057)
    $s::ifRewrite("s", 1709, 931)
    $t::ifRewrite("t", 1707, 985)
    $l::ifRewrite("l", 1836, 934)
    $f::ifRewrite("f", 1165, 1065)
    $v::ifRewrite("v", 750, 1059)
    $r::ifRewrite("r", 750, 1059)
    $c::ifRewrite("c", 1439, 1064)
    $m::ifRewrite("m", 1706, 1040)
    $o::ifRewrite("o", 1842, 1037)
    $d::ifRewrite("d", 1297, 1050)
    $Space::
        SetTitleMatchMode, RegEx

        if WinActive("^Rewrite*")
            SendInput, {Enter Down}
        else
            SendInput, {Space Down}
    Return
    $Space up::
        SetTitleMatchMode, RegEx

        if WinActive("^Rewrite*")
            SendInput, {Enter Up}
        else
            SendInput, {Space Up}
    Return
#if
#if (current_layer = "Dead Omegalul Aegis")
    ifDeadEndAegis(new_key, original_key) {
        if WinActive("ahk_exe DeadEndAegis.exe")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    $f::ifDeadEndAegis("LShift", "f")
    $c::ifDeadEndAegis("Space", "c")
    $PgUp::ifDeadEndAegis("Up", "PgUp")
    $PgDn::ifDeadEndAegis("Down", "PgDown")
    $o::ifDeadEndAegis("c", "o")
    $Space::ifDeadEndAegis("Enter", "Space")
    $t::ifDeadEndAegis("o", "t")
    $Esc::
        if WinActive("ahk_exe DeadEndAegis.exe")
            Click, Right
        else
            SendInput, {Esc}
    Return
#if
#if (current_layer = "Sugar * Style")
    $Space::
        if WinActive("ahk_exe SugarStyle.exe")
            SendInput, {Enter}
        else
            SendInput, {Space}             
    Return
    $r::
        if WinActive("ahk_exe SugarStyle.exe")
            clickAndReturn(1211, 1061)
        else
            SendInput, {r}      
    Return
    $v::
        if WinActive("ahk_exe SugarStyle.exe")
            clickAndReturn(1211, 1061)
        else
            SendInput, {v}      
    Return
    $Esc::
        if WinActive("ahk_exe SugarStyle.exe")
            Click, Right
        else
            SendInput, {Esc}
    Return
#if
#if (current_layer = "Kinkoi")
    IfKinkoiKey(new_key, original_key) {
        if WinActive("ahk_exe Kinkoi.exe")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfKinkoiClick(key, x, y) {
        if WinActive("ahk_exe Kinkoi.exe")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $a::IfKinkoiClick("a", 1331, 1054)
    $s::IfKinkoiClick("s", 1081, 1057)
    $l::IfKinkoiClick("l", 1150, 1052)
    $f::IfKinkoiClick("f", 1273, 1059)
    $v::IfKinkoiClick("v", 1620, 1054)
    $r::IfKinkoiClick("r", 1692, 1054)
    $c::IfKinkoiClick("c", 1780, 1056)
    $b::IfKinkoiClick("b", 1656, 1057)
    $m::
        if WinActive("ahk_exe Kinkoi.exe") {
            SetDefaultMouseSpeed, 0 ; Defaul is 2
            Send {Click 1503, 1056}
            SetDefaultMouseSpeed, 8 ; Defaul is 2
            Send {Click 1675, 139}
            Send {Click 229, 322}
            Send {Click, Right}
        } else {
            SendInput, {m}
        }
    Return
    $o::IfKinkoiClick("o", 1503, 1056)
    $t::
        if WinActive("ahk_exe Kinkoi.exe") {
            SetDefaultMouseSpeed, 0 ; Defaul is 2
            Send {Click 1503, 1056}
            SetDefaultMouseSpeed, 4 ; Defaul is 2
            sleep 0.1
            Send {Click, 1632, 1031}
            ; ; Moves mouse to center of screen. I don't like it tho lol
            ; CoordMode, Mouse, Screen
            ; MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2
        } else {
            SendInput, {t}
        }
    Return
    $Space::IfKinkoiKey("Enter", "Space")
    $Up::IfKinkoiKey("WheelUp", "Up")
    $Down::IfKinkoiKey("WheelDown", "Down")
    $PgUp::IfKinkoiKey("WheelUp", "PgUp")
    $PgDn::IfKinkoiKey("WheelDown", "PgDn")
#if
#if (current_layer = "Hatsukoi")
    IfHatsukoiKey(new_key, original_key) {
        if WinActive("Hatsukoi 1/1")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfHatsukoiClick(key, x, y) {
        if WinActive("Hatsukoi 1/1")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $s::IfHatsukoiClick("s", 713, 1048)
    $l::IfHatsukoiClick("l", 803, 1046)
    $f::IfHatsukoiClick("f", 906, 1051)
    $a::IfHatsukoiClick("a", 989, 1050)
    $v::IfHatsukoiClick("v", 1577, 1011)
    $r::IfHatsukoiClick("r", 1577, 1011)
    $c::IfHatsukoiClick("c", 1523, 1049)
    $m::
        if WinActive("Hatsukoi 1/1") {
            SetDefaultMouseSpeed, 4 ; Defaul is 2
            Send {Click 1320, 1053}
            Send {Click 809, 168}
            Send {Click 877, 353}
        } else {
            SendInput, {m}
        }
    Return
    $o::IfHatsukoiClick("o", 1320, 1053)
    $t::
        if WinActive("Hatsukoi 1/1") {
            SetDefaultMouseSpeed, 4 ; Defaul is 2
            Send {Click 1320, 1053}
            Send {Click 1600, 979}
            CoordMode, Mouse, Screen
            MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2
        } else {
            SendInput, {t}
        }
    Return
    $Space::IfHatsukoiKey("Enter", "Space")
    $Up::IfHatsukoiKey("WheelUp", "Up")
    $Down::IfHatsukoiKey("WheelDown", "Down")
    $PgUp::IfHatsukoiKey("WheelUp", "PgUp")
    $PgDn::IfHatsukoiKey("WheelDown", "PgDn")
#if
#if (current_layer = "Hoshi Ori")
    IfHoshiOriKey(new_key, original_key) {
        if WinActive("Hoshi Ori Yume Mirai")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfHoshiOriClick(key, x, y) {
        if WinActive("Hoshi Ori Yume Mirai")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $s::IfHoshiOriClick("s", 714, 1054)
    $l::IfHoshiOriClick("l", 820, 1049)
    $f::IfHoshiOriClick("f", 912, 1049)
    $a::IfHoshiOriClick("a", 1001, 1046)
    $v::IfHoshiOriClick("v", 1523, 1002)
    $r::IfHoshiOriClick("r", 1523, 1002)
    $c::IfHoshiOriClick("c", 1476, 1051)
    $m::
        if WinActive("Hoshi Ori Yume Mirai") {
            SetDefaultMouseSpeed, 8 ; Defaul is 2
            Send {Click 1307, 1049}
            Send {Click 775, 116}
            Send {Click 794, 280}
        } else {
            SendInput, {m}
        }
    Return
    $o::IfHoshiOriClick("o", 1307, 1049)
    $t::
        if WinActive("Hoshi Ori Yume Mirai") {
            SetDefaultMouseSpeed, 8 ; Defaul is 2
            Send {Click 1307, 1049}
            Send {Click 1484, 913}
            CoordMode, Mouse, Screen
            MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2
        } else {
            SendInput, {t}
        }
    Return
    $Space::IfHoshiOriKey("Enter", "Space")
    $Up::IfHoshiOriKey("WheelUp", "Up")
    $Down::IfHoshiOriKey("WheelDown", "Down")
    $PgUp::IfHoshiOriKey("WheelUp", "PgUp")
    $PgDn::IfHoshiOriKey("WheelDown", "PgDn")
#if
#if (current_layer = "Cafe Stella")
    IfCafeStellaKey(new_key, original_key) {
        ; WinActive("Café Stella and the Reapers' Butterflies") and 
        ; Doesnt work... prolly cuz of the 'e' in cafe
        if (WinActive("ahk_class TVPMainWindow") and WinActive("ahk_exe CafeStella.exe"))
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    $m::
        if (WinActive("ahk_class TVPMainWindow") and WinActive("ahk_exe CafeStella.exe")) {
            MouseGetPos, x_original, y_original 
            SendInput, {m}
            SetDefaultMouseSpeed, 0 ; Default is 2
            Sleep, 10
            Send {Click 604, 567}
            SendInput, {m}
            CoordMode, Mouse, Screen
            MouseMove, x_original, y_original
        } else {
            SendInput, {m}
        }
    Return
    $t::IfCafeStellaKey("y", "t")
    $c::IfCafeStellaKey("0", "c")
    $j::IfCafeStellaKey("", "j")
#if

#if (current_layer = "Parquet")
    IfParquetKey(new_key, original_key) {
        if WinActive("ahk_exe PARQUET.exe")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    $t::IfParquetKey("y", "t")
    $c::IfParquetKey("0", "c")
    $j::IfParquetKey("", "j")
#if

#if (current_layer = "Cyanotype Daydream") ; FRICK this isn't gonna work out...
    IfCyanotypeDaydreamKey(new_key, original_key) {
        if WinActive("Cyanotype Daydream")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfCyanotypeDaydreamClick(key, x, y) {
        if WinActive("Cyanotype Daydream")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    1::
        if WinActive("Cyanotype Daydream") {
            cyanotype_daydream_layer := "Rin"
            GuiTopLeft("Rin")
        } else {
            SendInput, {1}
        }
    Return
    2::
        if WinActive("Cyanotype Daydream") {
            cyanotype_daydream_layer := "Thinking and H-Scene"
            GuiTopLeft("Thinking and H-Scene")
        } else {
            SendInput, {2}
        }
    Return
    3::
        if WinActive("Cyanotype Daydream") {
            cyanotype_daydream_layer := "No dream"
            GuiTopLeft("No dream")
        } else {
            SendInput, {3}
        }
    Return
    4::
        if WinActive("Cyanotype Daydream") {
            cyanotype_daydream_layer := "Europe"
            GuiTopLeft("Europe")
        } else {
            SendInput, {4}
        }
    Return
    5::
        if WinActive("Cyanotype Daydream") {
            cyanotype_daydream_layer := "Car"
            GuiTopLeft("Car")
        } else {
            SendInput, {5}
        }
    Return
    CyanotypeDaydreamMapKey(key) {
        global cyanotype_daydream_key_bindings
        global cyanotype_daydream_layer
        if WinActive("Cyanotype Daydream") and cyanotype_daydream_key_bindings[cyanotype_daydream_layer].HasKey(key) and (key = "m") {
            SetDefaultMouseSpeed, 0
            ; this syntax is so bad, wtf
            Click % cyanotype_daydream_key_bindings[cyanotype_daydream_layer]["m"][1] . " " . cyanotype_daydream_key_bindings[cyanotype_daydream_layer]["m"][2]
            Sleep, 1600
            Send {Click 1706, 68}
            Sleep, 500
            Send {Click 76, 275}
            Return
        }
        if WinActive("Cyanotype Daydream") and cyanotype_daydream_key_bindings[cyanotype_daydream_layer].HasKey(key) {
            clickAndReturn(cyanotype_daydream_key_bindings[cyanotype_daydream_layer][key][1]
                         , cyanotype_daydream_key_bindings[cyanotype_daydream_layer][key][2])
        } else {
            SendInput, {%key%}
        }
    }

    $a::CyanotypeDaydreamMapKey("a")
    $s::CyanotypeDaydreamMapKey("s")
    $l::CyanotypeDaydreamMapKey("l")
    $c::CyanotypeDaydreamMapKey("c")
    $f::CyanotypeDaydreamMapKey("f")
    $y::CyanotypeDaydreamMapKey("y")
    $o::CyanotypeDaydreamMapKey("o")
    $m::CyanotypeDaydreamMapKey("m")
    $r::CyanotypeDaydreamMapKey("r")
    $v::CyanotypeDaydreamMapKey("v")
    $Space::IfCyanotypeDaydreamKey("Enter", "Space")
    $t::
        if WinActive("Cyanotype Daydream") {
            SetDefaultMouseSpeed, 0 ; Default is 2
            Send, {Click 0, 0}
            Sleep, 35
            Send, {Click 58, 35}
            Sleep, 35
            Send, {Enter}
        } else {
            SendInput, {t}
        }
    Return
#if
#if (current_layer = "Koichoco")
    ; Supposed to be the following...
    ; ahk_exe 恋と選挙とチョコレート.exe
    ; 恋と選挙とチョコレート
    ; doesn't work tho
    ; I used a variable but eh:
    ; "ahk_pid " . koichoco_pid
    IfKoichocoKey(new_key, original_key) {
        global koichoco_pid
        if WinActive("ahk_class BGI - Main window")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfKoichocoClick(key, x, y) {
        global koichoco_pid
        if WinActive("ahk_class BGI - Main window")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $a::IfKoichocoClick("a", 1698, 796)
    $s::IfKoichocoClick("s", 1804, 803)
    $l::IfKoichocoClick("l", 1798, 859)
    $c::IfKoichocoClick("c", 1697, 1058)
    $f::IfKoichocoClick("f", 1699, 853)
    $o::IfKoichocoClick("o", 1696, 998)
    $t::
        if WinActive("ahk_class BGI - Main window") {
            SetDefaultMouseSpeed, 0 ; Defaul is 2
            Send {Click 1696, 998}
            sleep 500
            Click Left
        } else {
            SendInput, {t}
        }
    Return
    $Space::IfKoichocoKey("Enter", "Space")
#if
