;; autohotkey script
;; automatically click LMB every 34ms when holding alt+c

!c::
  while GetKeyState("c")
  {
    Click
    Sleep, 34
  }
return
