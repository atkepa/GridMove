; #NoTrayIcon
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

!F4:: return
F9:: SendInput, {Text}%A_YYYY%.%A_MM%.%A_DD%
^F9:: SendInput, {Text}%A_YYYY%年%A_MM%月%A_DD%日%A_Hour%时%A_Min%分
!F9:: SendInput, {Text}%A_Now%
+F9::
    Time := A_NowUTC
    EnvSub, Time, 19700101000000, Seconds
    SendInput, {Text}%Time%
return

!`;:: SendInput, ^{left}
!':: SendInput, ^{Right}
!K:: SendInput, {Up}
!J:: SendInput,{Down}
!H:: SendInput, {Left}
!L:: SendInput, {Right}
![:: SendInput,{Home}
!]:: SendInput, {End}

#If WinActive("ahk_class Progman") or WinActive("ahk_class CabinetWClass") or WinActive("ahk_class ExploreWClass")
    F1::
    ^+C::
        Clipboard:=""
        Send,^c
        ClipWait,1
        path:= Clipboard
        if ErrorLevel
            return
        Clipboard:= path
    return
#if


#if GetKeyState("F16", "P")
    ; Ahk hotkey
    ^d:: reload
    ^p:: Pause

    ; emulate win key
    `:: send, #``
    e:: send, #e
    a:: send, #a
    i:: send, #i
    s:: send, #s
    z:: send, #x
    v:: send, #v
    Tab:: send, #{Tab}
    +s:: Send, #+{s}

    ':: Send, ^{Right}
    `;::Send, ^{Left}
    k:: Send, {Up}
    j:: Send,{Down}
    ^j:: Send, {PgDn}
    ^k:: Send, {PgUp}
    ^h:: Send, ^{Left}
    ^l:: send, ^{Right}
    h:: Send, {Left}
    l:: Send, {Right}
    [:: Send, {Home}
    ]:: Send, {End}
    Space:: Send, {RShift}
    +Space:: send, #{Space}
    1:: MoveToGrid(1)
    2:: MoveToGrid(2)
    3:: MoveToGrid(3)
    4:: MoveToGrid(4)
    5:: MoveToGrid(5)
    6:: MoveToGrid(6)
    7:: MoveToGrid(7)
    8:: MoveToGrid(8)
    9:: MoveToGrid(9)
    0:: MoveToGrid(10)

    ; Some script or function
    Esc:: Winset, Alwaysontop, , A
    p:: Run, "C:\Program Files\ShareX\ShareX.exe" -workflow Shot
    b:: Run, "D:\Scripts\Toggle-Theme.bat",,hide
    ^c::
        Send,^c
        Run, pwsh.exe -nop -nologo -file "D:\Scripts\New-QuickNote.ps1",,hide
    Return
    x::
    c::
        WinGetClass,aClass,A
        if (aClass = "WorkerW" or aClass = "Windows.UI.Core.CoreWindow" or aClass = "Shell_TrayWnd")
            Return
        if (aClass = "CASCADIA_HOSTING_WINDOW_CLASS"){
            Send, ^!t ; Send Ctrl+Alt+T
            Return
        }
        IfWinActive, ahk_exe Flow.Launcher.exe
        {
            Return
        }
        WinClose A
    return

    r::
        Process, Exist, WindowsTerminal.exe
        If ErrorLevel = 0 ; Process not exists
        {
            ; Send, #x
            ; WinActivate , ahk_class Xaml_WindowedPopupClass
            ; Sleep, 100
            ; Send, I
            Send, #t
            WinActivate, ahk_class Shell_TrayWnd
            Sleep, 100
            send, #1
        }
        Else
        {
            Send, ^!t
        }
    Return
    ^r::
        Process, Exist, WindowsTerminal.exe
        If ErrorLevel = 0
        {
            Run wt.exe
            WinWait , ahk_class CASCADIA_HOSTING_WINDOW_CLASS
            WinActivate
        }
        ; Run, pwsh.exe -nologo -noexit -command ". D:\Documents\PowerShell\interact.ps1", D:\Downloads,
        Else ; Process does not exist
        {
            Send, ^!t ; Send Ctrl+Alt+T
        }
    return

    ; Switch V desktop part

    WheelUp::
    Up::
    Q::
        run, VirtualDesktop11 /w /left,,hide
    return

    WheelDown::
    Down::
    W::
        run, VirtualDesktop11 /w /Right,,hide
    return

    +1::
    F1::
        run, VirtualDesktop11 /s:0,,hide
    Return
    +2::
    F2::
        run, VirtualDesktop11 /s:1,,hide
    Return
    +3::
    F3::
        run, VirtualDesktop11 /s:2,,hide
    Return
    +4::
    F4::
        run, VirtualDesktop11 /s:3,,hide
    Return
    +5::
    F5::
        run, VirtualDesktop11 /s:4,,hide
    Return
    +6::
    F6::
        run, VirtualDesktop11 /s:5,,hide
    Return
    +7::
    F7::
        run, VirtualDesktop11 /s:6,,hide
    Return
    +8::
    F8::
        run, VirtualDesktop11 /s:7,,hide
    Return
    +9::
    F9::
        run, VirtualDesktop11 /s:8,,hide
    Return
    +0::
    F10::
        run, VirtualDesktop11 /s:9,,hide
    Return
    ^1::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:0 /maw,,hide
        run, VirtualDesktop11 /s:0,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^2::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:1 /maw,,hide
        run, VirtualDesktop11 /s:1,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^3::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:2 /maw,,hide
        run, VirtualDesktop11 /s:2,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^4::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:3 /maw,,hide
        run, VirtualDesktop11 /s:3,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^5::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:4 /maw,,hide
        run, VirtualDesktop11 /s:4,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^6::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:5 /maw,,hide
        run, VirtualDesktop11 /s:5,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^7::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:6 /maw,,hide
        run, VirtualDesktop11 /s:6,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^8::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:7 /maw,,hide
        run, VirtualDesktop11 /s:7,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^9::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:8 /maw,,hide
        run, VirtualDesktop11 /s:8,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
    ^0::
        WinGet, win, ID, A
        run, VirtualDesktop11 /GetDesktop:9 /maw,,hide
        run, VirtualDesktop11 /s:9,,hide
        Sleep, 100
        WinActivate, ahk_id %win%
    Return
#if

