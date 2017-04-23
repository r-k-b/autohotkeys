;; https://github.com/r-k-b/autohotkeys

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Unicode Support
;; http://superuser.com/a/1047221/144573
;; 
;; Win+U for 4 digit hex codes
;; Shift+Win+U for 5 digit hex codes (doesn't work yet)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#U::SendUnicode()
SendUnicode()
{
    Input, hex, l4
    Send {U+%hex%}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; todo: implement Surrogate Pairs algo from http://stackoverflow.com/a/36568246/2014893

#+U::SendUnicode5()
SendUnicode5()
{
    Input, hex, l5
    Send {U+%hex%}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
