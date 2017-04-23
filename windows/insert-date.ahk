;; https://github.com/r-k-b/autohotkeys

; - Insert ISO 8601 Date Time stamp
;
; Home: https://bitbucket.org/snippets/bigbluedigital/LRg5e
; 
; [Ctrl] + [Numpad0]
; A date like 2016-03-23
;
; [Ctrl] + [Alt] + [Numpad0]
; A date like 2016-03-23T08:44:48 (proper ISO 8601)
;
; [Ctrl] + [Alt] + [Shift] + [Numpad0]
; A date like 2016-03-23T08-46-20 (safe for filenames)


^$Numpad0::
   FormatTime, xx,, yyyy-MM-dd
   SendInput, %xx%
Return

^!$Numpad0::
   FormatTime, yy,, yyyy-MM-ddTHH:mm:ss
   SendInput, %yy%
Return

^!$NumpadIns::
   Send {Shift Up}
   FormatTime, zz,, yyyy-MM-ddTHH-mm-ss
   SendInput, %zz%
Return
