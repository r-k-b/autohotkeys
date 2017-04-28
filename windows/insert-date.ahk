#SingleInstance, Force

;; https://github.com/r-k-b/autohotkeys

; - Insert ISO 8601 Date Time stamp
;
; Home: https://bitbucket.org/snippets/bigbluedigital/LRg5e
; 
; [Ctrl] + [Numpad0]
; A date like 2016-03-23
;
; [Ctrl] + [Alt] + [Numpad0]
; A date like 2016-03-23T08:44:48+10:00 (proper ISO 8601)
;
; [Ctrl] + [Alt] + [Shift] + [Numpad0]
; A date like 2016-03-23T084620+1000 (ISO8601, safe for filenames)

; Get local time UTC offset
T1 := A_Now
T2 := A_NowUTC
EnvSub, T1, %T2%, M

if (T1 >= 0) {
	TZD_hour := "+" . Floor( T1 / 60 )
	TZD_min := SubStr( "00" . Floor( Mod( T1, 60 ) ), 2)
	
} else {
	TZD_hour := "-" . Floor( Abs(T1) / 60 )
	TZD_min := SubStr( "00" . Floor( Mod( Abs(T1), 60 ) ), 2)
}

^$Numpad0::
   FormatTime, xx,, yyyy-MM-dd
   SendInput, {Raw}%xx%
Return

^!$Numpad0::
   FormatTime, yy,, yyyy-MM-ddTHH:mm:ss
   yy := yy . TZD_hour . ":" . TZD_min
   SendInput, {Raw}%yy%
Return

^!$NumpadIns::
   Send {Shift Up}
   FormatTime, zz,, yyyy-MM-ddTHHmmss
   zz := zz . TZD_hour . TZD_min
   SendInput, {Raw}%zz%
Return
