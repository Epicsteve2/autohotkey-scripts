#if (current_layer = "BTD6")
    NumpadUp::MouseMove, 0, -1 , 0, R
    NumpadDown::MouseMove, 0, 1 , 0, R
    NumpadLeft::MouseMove, -1, 0 , 0, R
    NumpadRight::MouseMove, 1, 0 , 0, R
    LShift & NumpadUp::
        If GetKeyState("LControl", "P")
            MouseMove, 0, -15 , 0, R
        Else
            MouseMove, 0, -5 , 0, R        
    Return
    LShift & NumpadDown::
        If GetKeyState("LControl", "P")
            MouseMove, 0, 15 , 0, R
        Else
            MouseMove, 0, 5 , 0, R        
    Return
    LShift & NumpadLeft::
        If GetKeyState("LControl", "P")
            MouseMove, -15, 0 , 0, R
        Else
            MouseMove, -5, 0 , 0, R
    Return
    LShift & NumpadRight::
        If GetKeyState("LControl", "P")
            MouseMove, 15, 0 , 0, R
        Else
            MouseMove, 5, 0 , 0, R       
    Return
    
    ; distance of a farm
    LControl & NumpadUp::
        If GetKeyState("Lalt", "P")
            MouseMove, 0, -15 , 0, R
        Else
            MouseMove, 0, -141 , 0, R        
    Return
    LControl & NumpadDown::
        If GetKeyState("Lalt", "P")
            MouseMove, 0, 15 , 0, R
        Else
            MouseMove, 0, 141 , 0, R        
    Return
    LControl & NumpadLeft::
        If GetKeyState("Lalt", "P")
            MouseMove, -15, 0 , 0, R
        Else
            MouseMove, -162, 0 , 0, R
    Return
    LControl & NumpadRight::
        If GetKeyState("Lalt", "P")
            MouseMove, 15, 0 , 0, R
        Else
            MouseMove, 162, 0 , 0, R       
    Return

    NumpadClear:: Send {Click}

    PlaceTower(tower, x_position, y_position) {
        global btd6_key_bindings
        global tower_click

        key_to_press := btd6_key_bindings[tower]

        CoordMode, Mouse, Screen
        MouseMove, x_position, y_position, 0
        SendInput, {%key_to_press%}

        if (tower_click) {
            Sleep, 35
            SendInput, {Click}
        }
    }
    PlaceTowerAndUpgrade(tower, x_position, y_position, top_upgrade, middle_upgrade, bottom_upgrade) {
        global btd6_key_bindings
        global tower_click
        global tower_upgrade

        key_to_press := btd6_key_bindings[tower]

        CoordMode, Mouse, Screen
        MouseMove, x_position, y_position, 0
        SendInput, {%key_to_press%}

        if (tower_click) {
            Sleep, 65
            SendInput, {Click}

            if (tower_upgrade) {
                Sleep, 65
                SendInput, {Click}
                Sleep, 65

                Loop %top_upgrade% {
                    Sleep, 65
                    SendInput, {,}
                }
                Loop %middle_upgrade% {
                    Sleep, 65
                    SendInput, {.}
                }
                Loop %bottom_upgrade% {
                    Sleep, 65
                    SendInput, {/}
                }
            }
        }
    }

    NumpadIns & F1::
        global tower_click

        tower_click := !tower_click
        if tower_click
            GuiTopLeft("Tower click is on")
        else
            GuiTopLeft("Tower click is off")
    Return
    NumpadIns & F2::
        global tower_upgrade

        tower_upgrade := !tower_upgrade
        if tower_upgrade
            GuiTopLeft("Tower upgrade is on")
        else
            GuiTopLeft("Tower upgrade is off")
    Return

    ; auto cash drop
    cash_drop := false
    #MaxThreadsPerHotKey, 2 ; this only affects this keybinding, nice!
    NumpadIns & F3::
    global cash_drop
        cash_drop := !cash_drop
        if cash_drop
            GuiTopLeft("Cash drop spam is on")
        else
            GuiTopLeft("Cash drop spam is off")
        while (cash_drop) {
            Send {Click, 1724, 408, Down}
            CoordMode, Mouse, Screen
            MouseMove, 1600, 410
            Send {Click, Up}
            sleep, 34
        }
    Return

    ; ; Update 31.0: Disable alt tab
    ; #if WinActive("ahk_class UnityWndClass") and WinActive("ahk_exe BloonsTD6.exe")
    ;     LAlt::Return
    ; #if
    
    ; Maps
    global btd6_map
    #if (btd6_map = "Chutes") 
        NumpadIns & q::PlaceTower("dart", 882, 815)
        NumpadIns & w::PlaceTower("sniper", 303, 197)
        NumpadIns & e::PlaceTower("dart", 783, 816)
        NumpadIns & r::PlaceTower("dart", 811, 524)
        NumpadIns & t::PlaceTower("dart", 872, 476)
        NumpadIns & y::PlaceTower("hero", 836, 619)
        NumpadIns & u::PlaceTower("sub", 992, 535)
        NumpadIns & i::PlaceTower("alch", 1233, 511)
        NumpadIns & o::PlaceTower("village", 897, 553)
        NumpadIns & p::PlaceTower("village", 646, 515)
        NumpadIns & a::PlaceTower("spike", 810, 438)
        NumpadIns & s::PlaceTower("alch", 816, 372)
        NumpadIns & d::PlaceTower("glue", 734, 414)
        NumpadIns & f::PlaceTower("dart", 935, 700)
        NumpadIns & g::PlaceTower("dart", 984, 663)
        NumpadIns & h::PlaceTower("dart", 733, 701)
        NumpadIns & j::PlaceTower("dart", 937, 481)
        NumpadIns & k::PlaceTower("dart", 732, 543)
        NumpadIns & l::PlaceTower("dart", 757, 491)
        NumpadIns & z::PlaceTower("dart", 684, 664)
        NumpadIns & x::PlaceTower("dart", 997, 718)
        NumpadIns & c::PlaceTower("tack", 833, 778)
        NumpadIns & v::PlaceTower("alch", 786, 576)
        NumpadIns & b::PlaceTower("alch", 671, 719)
    #if
    #if (btd6_map = "Bazaar")
        NumpadIns & q::PlaceTower("engineer", 1004, 541)
        NumpadIns & w::PlaceTower("dart", 1283, 532)
        NumpadIns & e::PlaceTower("sniper", 480, 545)
        NumpadIns & r::PlaceTower("hero", 1379, 541)
        NumpadIns & t::PlaceTower("village", 201, 539)
        NumpadIns & y::PlaceTower("bomb", 299, 541)
        NumpadIns & u::PlaceTower("alch", 180, 617)
        NumpadIns & i::PlaceTower("bomb", 250, 612)
        NumpadIns & o::PlaceTower("village", 1475, 555)
        NumpadIns & p::PlaceTower("bomb", 1422, 484)
        NumpadIns & a::PlaceTower("bomb", 1422, 418)
        NumpadIns & s::PlaceTower("alch", 1495, 477)
        NumpadIns & d::PlaceTower("wizard", 250, 466)
        NumpadIns & f::PlaceTower("wizard", 1422, 626)
        NumpadIns & g::PlaceTower("ninja", 189, 353)
        NumpadIns & h::PlaceTower("glue", 1491, 638)
        NumpadIns & j::PlaceTower("ice", 415, 545)
        NumpadIns & k::PlaceTower("spike", 1426, 697)
    #if
    #if (btd6_map = "Peninsula") 
        NumpadIns & q::PlaceTower("dart", 1073, 788)
        NumpadIns & w::PlaceTower("sub", 1228, 648)_
        NumpadIns & e::PlaceTower("dart", 1123, 744)
        NumpadIns & r::PlaceTower("sniper", 898, 327)
        NumpadIns & t::PlaceTower("hero", 1237, 582)
        NumpadIns & y::PlaceTower("bucc", 1252, 513)
        NumpadIns & u::PlaceTower("sub", 341, 223)
        NumpadIns & i::PlaceTower("spike", 1437, 158)
        NumpadIns & o::PlaceTower("alch", 1524, 235)
        NumpadIns & p::PlaceTower("druid", 1142, 803) ; dont need, lol
        NumpadIns & a::PlaceTower("ice", 1271, 373)
        NumpadIns & s::PlaceTower("village", 1411, 412)
        NumpadIns & d::PlaceTower("tack", 1152, 411)
        NumpadIns & f::PlaceTower("boomer", 1337, 352)
        NumpadIns & g::PlaceTower("boomer", 1330, 286)
        NumpadIns & h::PlaceTower("boomer", 1402, 306)
        NumpadIns & j::PlaceTower("glue", 1310, 418)
        NumpadIns & k::PlaceTower("glue", 1326, 529)
        
        NumpadIns & z::PlaceTower("spike", 1448, 233)
        NumpadIns & x::PlaceTower("alch", 1512, 171)
        NumpadIns & c::PlaceTower("ice", 1461, 479)
        ; NumpadIns & f::PlaceTower("glue", 1326, 529)
        ; NumpadIns & l::PlaceTower("glue", 1332, 471)
        ; NumpadIns & z::PlaceTower("glue", 1387, 501)
        ; NumpadIns & x::PlaceTower("engineer", 1332, 527)
        ; NumpadIns & c::PlaceTower("engineer", 1395, 496)
        ; NumpadIns & n::PlaceTower("glue", 1310, 418)
        ; NumpadIns & m::PlaceTower("glue", 1310, 418)
    #if
    #if (btd6_map = "Underground") 
        NumpadIns & q::PlaceTower("druid", 602, 405)
        NumpadIns & w::PlaceTower("dart", 508, 535)_
        NumpadIns & e::PlaceTower("engineer", 637, 528)
        NumpadIns & r::PlaceTower("hero", 690, 481)
        NumpadIns & t::PlaceTower("sniper", 493, 480)
        NumpadIns & y::PlaceTower("village", 943, 568)
        NumpadIns & u::PlaceTower("bomb", 1026, 524)
        NumpadIns & i::PlaceTower("alch", 1067, 422)
        NumpadIns & o::PlaceTower("bomb", 970, 479)
        NumpadIns & p::PlaceTower("mortar", 1187, 643)
        NumpadIns & a::PlaceTower("tack", 831, 531)
        NumpadIns & s::PlaceTower("alch", 792, 741) ; dont need, lol
        NumpadIns & d::PlaceTower("super", 1170, 529)
        NumpadIns & f::PlaceTower("sniper", 751, 512) ; or ninja
        NumpadIns & g::PlaceTower("engineer", 758, 451)
        ; NumpadIns & u::PlaceTower("village", 955, 567)
        ; NumpadIns & t::PlaceTower("ninja",1032, 523 )
        ; NumpadIns & y::PlaceTower("bomb", 978, 483)
        ; NumpadIns & h::PlaceTower("super", 1043, 674)
        NumpadIns & n::PlaceTower("alch", 956, 783)
    #if
    #if (btd6_map = "Cargo")
        NumpadIns & q::PlaceTower("sub",  152, 163)
        NumpadIns & w::PlaceTower("dart", 1261, 360)
        NumpadIns & e::PlaceTower("engineer", 1167, 360)
        NumpadIns & r::PlaceTower("hero", 918, 487)
        NumpadIns & t::PlaceTower("sniper", 749, 250)
        NumpadIns & y::PlaceTower("alch", 372, 251)
        NumpadIns & u::PlaceTower("village", 711, 547)
        NumpadIns & i::PlaceTower("village", 719, 650)
        NumpadIns & o::PlaceTower("bomb", 598, 481)
        NumpadIns & p::PlaceTower("alch", 527, 477)
        NumpadIns & a::PlaceTower("bomb", 613, 546)
        NumpadIns & s::PlaceTower("ice", 953, 540)
        NumpadIns & d::PlaceTower("dart", 848, 482)
        NumpadIns & f::PlaceTower("glue", 796, 516)
        NumpadIns & g::PlaceTower("dart", 876, 536)
        NumpadIns & h::PlaceTower("dart", 883, 592)
        NumpadIns & j::PlaceTower("dart", 948, 596)
        NumpadIns & k::PlaceTower("dart", 823, 569)
        NumpadIns & l::PlaceTower("dart", 940, 652)
        NumpadIns & z::PlaceTower("dart", 876, 664)
        NumpadIns & x::PlaceTower("dart", 874, 721)
        NumpadIns & c::PlaceTower("dart", 805, 680)
        NumpadIns & v::PlaceTower("dart", 818, 625)
        NumpadIns & b::PlaceTower("mortar", 558, 728)
    #if
    #if (btd6_map = "Cornfield") ; this strat sucls
        NumpadIns & q::PlaceTower("dart", 749, 646) ;
        NumpadIns & w::PlaceTower("tack", 751, 473)
        NumpadIns & e::PlaceTower("bomb", 822, 477)
        NumpadIns & r::PlaceTower("bomb", 898, 477)
        NumpadIns & t::PlaceTower("hero", 753, 585)
        NumpadIns & y::PlaceTower("alch", 859, 529)
        NumpadIns & u::PlaceTower("village", 846, 671)
        NumpadIns & i::PlaceTower("ice", 773, 526)
        NumpadIns & a::PlaceTower("spike", 927, 751) ; !
        ; NumpadIns & u::PlaceTower("village", 890, 627)

        ; NumpadIns & i::PlaceTower("dart", 848, 482)
        NumpadIns & o::PlaceTower("dart", 814, 646)
        NumpadIns & p::PlaceTower("engineer", 820, 642)
        NumpadIns & s::PlaceTower("druid", 829, 588) ; dont need, lol
        NumpadIns & d::PlaceTower("dart", 823, 569) ; !
        NumpadIns & f::PlaceTower("dart", 940, 652) ; or ninja
        NumpadIns & g::PlaceTower("dart", 876, 664)
        NumpadIns & h::PlaceTower("dart", 874, 721)
        NumpadIns & j::PlaceTower("dart", 805, 680)
        NumpadIns & k::PlaceTower("dart", 818, 625)
        NumpadIns & l::PlaceTower("dart", 818, 625)
        ; 850, 570
        
        
        NumpadIns & x::PlaceTower("dart", 997, 718)
        NumpadIns & c::PlaceTower("tack", 833, 778)
        NumpadIns & v::PlaceTower("alch", 786, 576)
        NumpadIns & b::PlaceTower("alch", 671, 719)
        ; 1218, 249
        
    #if
    #if (btd6_map = "Flooded Valley") ; this strat sucls
        NumpadIns & q::PlaceTower("sub", 1087, 881) ;
        NumpadIns & e::PlaceTower("sub", 990, 159)
        NumpadIns & t::PlaceTower("hero", 753, 625)
        NumpadIns & w::PlaceTower("sub", 995, 769)
        NumpadIns & r::PlaceTower("sniper", 593, 773)
        NumpadIns & y::PlaceTower("bucc", 1035, 708)
        NumpadIns & u::PlaceTower("village", 550, 591)
        NumpadIns & i::PlaceTower("wizard", 707, 677)
        NumpadIns & a::PlaceTower("wizard", 667, 733) ; !

        ; NumpadIns & u::PlaceTower("village", 890, 627)

        ; NumpadIns & i::PlaceTower("dart", 848, 482)
        NumpadIns & o::PlaceTower("heli", 337, 586)
        NumpadIns & p::PlaceTower("wizard", 756, 559)
        NumpadIns & s::PlaceTower("druid", 829, 588) ; dont need, lol
        NumpadIns & d::PlaceTower("dart", 823, 569) ; !
        NumpadIns & f::PlaceTower("dart", 940, 652) ; or ninja
        NumpadIns & g::PlaceTower("dart", 876, 664)
        NumpadIns & h::PlaceTower("dart", 874, 721)
        NumpadIns & j::PlaceTower("dart", 805, 680)
        NumpadIns & k::PlaceTower("dart", 818, 625)
        NumpadIns & l::PlaceTower("dart", 818, 625)
        ; 850, 570
        
        
        NumpadIns & x::PlaceTower("hero", 764, 608)
        NumpadIns & c::PlaceTower("sub", 995, 767)
        NumpadIns & v::PlaceTower("village", 701, 673)
        NumpadIns & b::PlaceTower("bucc", 1036, 706)
        ; 1218, 249
        
    #if
    #if (btd6_map = "X Factor")
        NumpadIns & q::PlaceTower("dart", 1358, 267)
        NumpadIns & w::PlaceTower("dart", 353, 203)
        NumpadIns & e::PlaceTower("sniper", 728, 137)
        NumpadIns & r::PlaceTower("sniper", 923, 137)
        NumpadIns & t::PlaceTower("hero", 570, 561)
        NumpadIns & y::PlaceTower("ninja", 1103, 531)
        NumpadIns & u::PlaceTower("alch", 1168, 526) ; only 320
        NumpadIns & i::PlaceTower("village", 329, 598) ; no camo
        NumpadIns & o::PlaceTower("village", 328, 495) 
        NumpadIns & p::PlaceTower("bomb", 235, 469)
        NumpadIns & a::PlaceTower("bomb", 232, 607)
        NumpadIns & s::PlaceTower("alch", 142, 669)
        NumpadIns & d::PlaceTower("dart", 537, 507)
        NumpadIns & f::PlaceTower("dart", 516, 600)
        NumpadIns & g::PlaceTower("dart", 488, 463)
        NumpadIns & h::PlaceTower("dart", 491, 548)
        NumpadIns & j::PlaceTower("dart", 487, 651)
        NumpadIns & k::PlaceTower("dart", 451, 593)
        NumpadIns & l::PlaceTower("dart", 421, 643)
        NumpadIns & z::PlaceTower("dart", 446, 507)
        NumpadIns & x::PlaceTower("dart", 424, 454)
        NumpadIns & c::PlaceTower("dart", 399, 546)
        NumpadIns & v::PlaceTower("spike", 459, 712)
        NumpadIns & b::PlaceTower("glue", 369, 423)
        ; NumpadIns & n::PlaceTower("", 0,0)
        ; NumpadIns & m::PlaceTower("", 0,0)

        ; 67 camo
        ; 218, 410
        ; 40 mael
        ; 41 camo cannons
        ; 98 4 super mael in left corners
        ; also buy 2 genies
        ; buy geraldo on 75
        ; 82 buy fire + pickle on ninja
    #if
    #if (btd6_map = "X Factor OLD!")
        NumpadIns & q::PlaceTowerAndUpgrade("dart", 1358, 267, 0,0,0) ;
        NumpadIns & w::PlaceTowerAndUpgrade("dart", 353, 203, 0,0,0)
        NumpadIns & e::PlaceTowerAndUpgrade("sniper", 158, 547, 0,5,2)
        NumpadIns & r::PlaceTowerAndUpgrade("sniper", 232, 687, 4,2,0)
        NumpadIns & t::PlaceTowerAndUpgrade("hero", 570, 561, 20,0,0)
        NumpadIns & y::PlaceTowerAndUpgrade("ninja", 1103, 531, 4,0,2)
        NumpadIns & u::PlaceTowerAndUpgrade("alch", 1168, 526, 4,2,0)

        NumpadIns & i::PlaceTowerAndUpgrade("village", 374, 481, 4,0,2) ; !
        NumpadIns & o::PlaceTowerAndUpgrade("village", 348, 582, 0,2,2) ; or ninja
        NumpadIns & p::PlaceTowerAndUpgrade("bomb", 528, 506, 0,2,4)
        NumpadIns & a::PlaceTowerAndUpgrade("alch", 473, 468, 4,0,1)
        NumpadIns & s::PlaceTowerAndUpgrade("bomb", 467, 545, 0,2,4) ; !
        NumpadIns & d::PlaceTowerAndUpgrade("bomb", 509, 600, 0,2,4)
        NumpadIns & f::PlaceTowerAndUpgrade("bomb", 436, 618, 0,2,4)
        NumpadIns & g::PlaceTowerAndUpgrade("alch", 485, 662, 4,0,1) ; dont need, lol
        NumpadIns & h::PlaceTowerAndUpgrade("alch", 154, 604, 4,0,1)
        NumpadIns & j::PlaceTowerAndUpgrade("sniper", 219, 576, 0,3,2)
        NumpadIns & k::PlaceTowerAndUpgrade("sniper", 238, 630, 0,3,2)
        NumpadIns & l::PlaceTowerAndUpgrade("alch", 176, 658, 4,0,1)

        NumpadIns & z::PlaceTowerAndUpgrade("ninja", 260, 391, 0,4,0) ; original spot
        NumpadIns & x::PlaceTowerAndUpgrade("glue", 324, 378, 2,5,0)
        NumpadIns & c::PlaceTowerAndUpgrade("ice", 362, 727, 4,1,0)
        NumpadIns & v::PlaceTowerAndUpgrade("glue", 1281, 192, 0,2,3)
        NumpadIns & b::PlaceTowerAndUpgrade("boomer", 1256, 267, 2,0,4)
        NumpadIns & n::PlaceTowerAndUpgrade("boomer", 1160, 197, 2,0,4)
        NumpadIns & m::PlaceTowerAndUpgrade("tack", 454, 718, 2,0,4)
        NumpadDel & q::PlaceTowerAndUpgrade("tack", 314, 785, 2,0,4) 
        NumpadDel & w::PlaceTowerAndUpgrade("heli", 218, 410, 2,0,4) 

        NumpadDel & i::PlaceTowerAndUpgrade("dart", 537, 507, 0,0,0)
        NumpadDel & o::PlaceTowerAndUpgrade("dart", 516, 600, 0,0,0)
        NumpadDel & p::PlaceTowerAndUpgrade("dart", 488, 463, 0,0,0)
        NumpadDel & a::PlaceTowerAndUpgrade("dart", 491, 548, 0,0,0)
        NumpadDel & s::PlaceTowerAndUpgrade("dart", 487, 651, 0,0,0)
        NumpadDel & d::PlaceTowerAndUpgrade("dart", 451, 593, 0,0,0)
        NumpadDel & f::PlaceTowerAndUpgrade("dart", 421, 643, 0,0,0)
        NumpadDel & g::PlaceTowerAndUpgrade("dart", 446, 507, 0,0,0)
        NumpadDel & h::PlaceTowerAndUpgrade("dart", 424, 454, 0,0,0)
        NumpadDel & j::PlaceTowerAndUpgrade("dart", 399, 546, 0,0,0)
        NumpadDel & k::PlaceTowerAndUpgrade("village", 329, 598, 0,0,0)
        NumpadDel & l::PlaceTowerAndUpgrade("village", 328, 495, 0,0,0)
        NumpadDel & z::PlaceTowerAndUpgrade("spike", 459, 712, 0,0,0)
        NumpadDel & x::PlaceTowerAndUpgrade("bomb", 235, 469, 0,0,0)
        NumpadDel & c::PlaceTowerAndUpgrade("bomb", 232, 607, 0,0,0)
        NumpadDel & v::PlaceTowerAndUpgrade("alch", 142, 669, 0,0,0)
        NumpadDel & b::PlaceTowerAndUpgrade("", 0,0, 0,0,0)
        NumpadDel & n::PlaceTowerAndUpgrade("", 0,0, 0,0,0)
        NumpadDel & m::PlaceTowerAndUpgrade("", 0,0, 0,0,0)
        ; 67 camo
        ; 218, 410
    #if
    #if (btd6_map = "High Finance")
        NumpadIns & q::PlaceTower("sub", 864, 479)
        NumpadIns & w::PlaceTower("dart", 970, 665)
        NumpadIns & e::PlaceTower("dart", 970, 475)
        NumpadIns & r::PlaceTower("hero", 702, 704)
        NumpadIns & t::PlaceTower("bucc", 745, 644)
        NumpadIns & y::PlaceTower("spike", 960, 406)
        NumpadIns & u::PlaceTower("village", 719, 423)
        NumpadIns & i::PlaceTower("alch", 885, 415)
        NumpadIns & o::PlaceTower("dart", 645, 557)
        NumpadIns & p::PlaceTower("dart", 735, 488)
        NumpadIns & a::PlaceTower("alch", 518, 353)
        NumpadIns & s::PlaceTower("glue", 814, 218)
        NumpadIns & d::PlaceTower("ninja", 809, 405)
    #if
    #if (btd6_map = "Adora's Temple")
        NumpadIns & q::PlaceTower("dart", 873, 869)
        NumpadIns & w::PlaceTower("sub", 1096, 183)
        NumpadIns & e::PlaceTower("hero", 769, 336)
        NumpadIns & r::PlaceTower("ninja", 897, 447)
        NumpadIns & t::PlaceTower("village", 774, 560)
        NumpadIns & y::PlaceTower("alch", 1033, 554)
        NumpadIns & u::PlaceTower("druid", 769, 451)
        NumpadIns & i::PlaceTower("alch", 560, 487)
        NumpadIns & o::PlaceTower("glue", 58, 25)
        NumpadIns & p::PlaceTower("tack", 618, 713)
        NumpadIns & a::PlaceTower("tack", 664, 753)
    #if
    #if (btd6_map = "Pat's Pond") ; nvm i don't wanna do this map
        NumpadIns & q::PlaceTower("sub", 1370, 442)
        NumpadIns & w::PlaceTower("dart", 1470, 605)
        NumpadIns & e::PlaceTower("sub", 345, 674)
        NumpadIns & r::PlaceTower("hero", 69, 482)
        NumpadIns & t::PlaceTower("", 0,0)
        NumpadIns & y::PlaceTower("", 0,0)
        NumpadIns & u::PlaceTower("", 0,0)
        NumpadIns & i::PlaceTower("", 0,0)
        NumpadIns & o::PlaceTower("", 0,0)
        NumpadIns & p::PlaceTower("", 0,0)
        NumpadIns & a::PlaceTower("", 0,0)
        NumpadIns & s::PlaceTower("", 0,0)
        NumpadIns & d::PlaceTower("", 0,0)
        NumpadIns & f::PlaceTower("", 0,0)
        NumpadIns & g::PlaceTower("", 0,0)
        NumpadIns & h::PlaceTower("", 0,0)
        NumpadIns & j::PlaceTower("", 0,0)
        NumpadIns & k::PlaceTower("", 0,0)
        NumpadIns & l::PlaceTower("", 0,0)
        NumpadIns & z::PlaceTower("", 0,0)
        NumpadIns & x::PlaceTower("", 0,0)
        NumpadIns & c::PlaceTower("", 0,0)
        NumpadIns & v::PlaceTower("", 0,0)
        NumpadIns & b::PlaceTower("", 0,0)
    #if
    #if (btd6_map = "Dark Castle") ; dead after version 31. pat is bigger now
        NumpadIns & q::PlaceTower("sub",  1090, 709)
        NumpadIns & w::PlaceTower("dart", 812, 657)
        NumpadIns & e::PlaceTower("dart", 747, 656)
        NumpadIns & r::PlaceTower("dart", 713, 704)
        NumpadIns & t::PlaceTower("hero", 878, 679)
        NumpadIns & y::PlaceTower("dart", 781, 763)
        NumpadIns & u::PlaceTower("alch", 979, 721)
        NumpadIns & i::PlaceTower("village", 947, 806)
        NumpadIns & o::PlaceTower("bomb", 951, 661)
        NumpadIns & p::PlaceTower("village", 831, 830)
        NumpadIns & a::PlaceTower("bomb", 1025, 675)
        NumpadIns & s::PlaceTower("dart", 778, 706)
        NumpadIns & d::PlaceTower("dart", 836, 732)
        NumpadIns & f::PlaceTower("dart", 716, 761)
        NumpadIns & g::PlaceTower("dart", 741, 813)
        NumpadIns & h::PlaceTower("dart", 901, 737)
        NumpadIns & j::PlaceTower("dart", 1029, 757)
        NumpadIns & k::PlaceTower("glue", 1029, 943)

        NumpadIns & z::PlaceTower("spike", 1575, 559)
        NumpadIns & x::PlaceTower("alch", 1612, 617)
    #if
    #if (btd6_map = "Rake")
        NumpadIns & q::PlaceTower("sub", 963, 426)
        NumpadIns & w::PlaceTower("dart", 1080, 364)
        NumpadIns & e::PlaceTower("hero", 1068, 457)
        NumpadIns & r::PlaceTower("sub", 868, 405)
        NumpadIns & t::PlaceTower("village", 899, 627)
        NumpadIns & y::PlaceTower("spike", 974, 841)
        NumpadIns & u::PlaceTower("alch", 899, 851)
        NumpadIns & i::PlaceTower("dartling", 753, 571)
        NumpadIns & o::PlaceTower("alch", 650, 567)
        NumpadIns & p::PlaceTower("glue", 1085, 568)
        NumpadIns & a::PlaceTower("ice", 1079, 648)
    #if
    #if (btd6_map = "Encrypted")
        NumpadIns & q::PlaceTower("dart", 820, 378) ; strong
        NumpadIns & w::PlaceTower("dart", 272, 880)
        NumpadIns & e::PlaceTower("dart", 1398, 880)
        NumpadIns & r::PlaceTower("hero", 498, 389)
        NumpadIns & t::PlaceTower("wizard", 721, 285)
        NumpadIns & y::PlaceTower("village", 824, 409)
        NumpadIns & u::PlaceTower("engineer", 951, 285)
        NumpadIns & i::PlaceTower("dart", 768, 472)
        NumpadIns & k::PlaceTower("village", 447, 208)
        NumpadIns & l::PlaceTower("alch", 260, 363)
        NumpadIns & o::PlaceTower("ice", 745, 525) 
    #if
    #if (btd6_map = "Bloonarius Prime")
        NumpadIns & q::PlaceTower("dart", 230, 268)
        NumpadIns & w::PlaceTower("engineer", 958, 833)
        NumpadIns & e::PlaceTower("sniper", 861, 25)
        NumpadIns & r::PlaceTower("hero", 872, 800)
        NumpadIns & t::PlaceTower("sub", 722, 764)
        NumpadIns & y::PlaceTower("village", 857, 884)
        NumpadIns & u::PlaceTower("bomb", 973, 899)
        NumpadIns & i::PlaceTower("alch", 953, 1002)
        NumpadIns & o::PlaceTower("village", 857, 987)
        NumpadIns & p::PlaceTower("bomb", 963, 833)
        NumpadIns & a::PlaceTower("alch", 682, 912)
        NumpadIns & s::PlaceTower("village", 1064, 982)
        NumpadIns & d::PlaceTower("super", 970, 919) 
        NumpadIns & f::PlaceTower("engineer", 953, 1002)
        NumpadIns & g::PlaceTower("ice", 1005, 1043)
        NumpadIns & h::PlaceTower("bomb", 937, 836)
        ; 94 use abilities early, make sure 
    #if
    #if (btd6_map = "Infernal")
        NumpadIns & q::PlaceTower("boomer", 836, 696)
        NumpadIns & w::PlaceTower("sniper", 1181, 798)
        NumpadIns & e::PlaceTower("hero", 494, 270)
        NumpadIns & r::PlaceTower("sniper", 1243, 815)
        NumpadIns & t::PlaceTower("dartling", 825, 383)
        NumpadIns & y::PlaceTower("alch", 881, 328)
        NumpadIns & i::PlaceTower("village", 1585, 674)
        NumpadIns & u::PlaceTower("spike", 1528, 545)
        NumpadIns & o::PlaceTower("alch", 1579, 594)
        NumpadIns & a::PlaceTower("glue", 839, 794)
        NumpadIns & p::PlaceTower("ice", 450, 222)
    #if
    #if (btd6_map = "Firing Range")
        NumpadIns & q::PlaceTower("sub", 1309, 454)
        NumpadIns & w::PlaceTower("hero", 684, 574)
        NumpadIns & e::PlaceTower("druid", 757, 435)
        NumpadIns & r::PlaceTower("druid", 833, 435)
        NumpadIns & t::PlaceTower("village", 661, 657)
        NumpadIns & y::PlaceTower("village", 839, 638)
        NumpadIns & u::PlaceTower("druid", 867, 494)
        NumpadIns & i::PlaceTower("druid", 791, 494)
        NumpadIns & o::PlaceTower("druid", 756, 554) ; maybe only upgrade first 5-6 to tornado before saveup
        NumpadIns & p::PlaceTower("druid", 713, 859) ; vine
        NumpadIns & a::PlaceTower("alch", 751, 615)
        NumpadIns & s::PlaceTower("druid", 832, 553)
        NumpadIns & d::PlaceTower("druid", 904, 575) 
        NumpadIns & f::PlaceTower("druid", 608, 574)
        NumpadIns & g::PlaceTower("druid", 532, 574)
        NumpadIns & h::PlaceTower("druid", 459, 592) 
        NumpadIns & j::PlaceTower("druid", 937, 634)
        NumpadIns & k::PlaceTower("druid", 568, 632)
        NumpadIns & l::PlaceTower("druid", 495, 650)
        NumpadIns & z::PlaceTower("druid", 980, 575)
        NumpadIns & x::PlaceTower("druid", 1013, 634)
        NumpadIns & c::PlaceTower("ice", 783, 868)
    #if
    #if (btd6_map = "Haunted")
        NumpadIns & q::PlaceTower("sub", 778, 856)
        NumpadIns & w::PlaceTower("", 0,0)
        NumpadIns & e::PlaceTower("", 0,0)
        NumpadIns & r::PlaceTower("", 0,0)
        NumpadIns & t::PlaceTower("", 0,0)
        NumpadIns & y::PlaceTower("", 0,0)
        NumpadIns & u::PlaceTower("", 0,0)
        NumpadIns & i::PlaceTower("", 0,0)
        NumpadIns & o::PlaceTower("", 0,0)
        NumpadIns & p::PlaceTower("", 0,0)
        NumpadIns & a::PlaceTower("", 0,0)
        NumpadIns & s::PlaceTower("", 0,0)
        NumpadIns & d::PlaceTower("", 0,0) 
        NumpadIns & f::PlaceTower("", 0,0)
        NumpadIns & g::PlaceTower("", 0,0)
        NumpadIns & h::PlaceTower("", 0,0) 
        NumpadIns & j::PlaceTower("", 0,0)
        NumpadIns & k::PlaceTower("", 0,0)
        NumpadIns & l::PlaceTower("", 0,0)
        NumpadIns & z::PlaceTower("", 0,0)
        NumpadIns & x::PlaceTower("", 0,0)
        NumpadIns & c::PlaceTower("", 0,0)
    #if
    #if (btd6_map = "Spillway")
        NumpadIns & q::PlaceTower("boomer", 479, 724)
        NumpadIns & w::PlaceTower("dart", 1355, 259)
        NumpadIns & e::PlaceTower("sniper", 271, 873) ; get 101 before boomerang bionic
        NumpadIns & r::PlaceTower("hero", 431, 503) ; etienne
        NumpadIns & t::PlaceTower("village", 312, 702)
        NumpadIns & y::PlaceTower("dartling", 214, 909) 
        NumpadIns & u::PlaceTower("tack", 843, 546)
        NumpadIns & i::PlaceTower("glue", 438, 564)
        NumpadIns & o::PlaceTower("ice", 438, 564) ; do this after update cuz it broken
        ; don't get turbo charge
        ; ability 22 and 27
        ; possible to double discount boomer, but idk how viable it is
        ; also upgrade sniper
        ; perma a bit before glone on 98s
    #if
#if
