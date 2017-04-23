;; https://github.com/r-k-b/autohotkeys

; [Ctrl] + [Alt] + [Shift] + [m] to toggle a finer control, such as for drawing.


; GET INTIAL MOUSE SPEED:
; 0x70 (SPI_GETMOUSESPEED), third parameter is the speed (range is 1-20, 10 is default)
DllCall("SystemParametersInfo", UInt, 0x70, UInt, 0, UIntP, Mouse_Speed_Orig, UInt, 0)

Mouse_Speed_Slow := Mouse_Speed_Orig * 0.25
Mouse_Speed_Slow := Floor(Mouse_Speed_Slow)
; Or directly set the speed: Mouse_Speed_Slow =5
Return

^+!M::
  ; 0x71 (SPI_SETMOUSESPEED), third parameter is the speed (range is 1-20, 10 is default)
  DllCall("SystemParametersInfo", UInt, 0x70, UInt, 0, UIntP, Mouse_Speed_Now, UInt, 0)
  If Mouse_Speed_Now =%Mouse_Speed_Orig%
    DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, Mouse_Speed_Slow, UInt, 0)
  Else
    DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, Mouse_Speed_Orig, UInt, 0)
Return
