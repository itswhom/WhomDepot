# Shell Aliases

## Git
``` sh
; Save current work
save = “!f() { git add -A && git commit -m \”SAVEPOINT: ${1}\”; }; f”
; Come back to last commit
undo = reset HEAD~1 –mixed
; Reset to original
wipe = “!f() { git add -A && git commit -qm \”WIPE SAVEPOINT: ${1}\” && git reset HEAD~1 –hard; }; f”
; What the hell i have done for the last week
standup = !”git log –reverse –branches –since=1.weeks –author=$(git config –get user.email) –format=format:’%C(cyan) %ad %C(yellow) %h %Creset %s %C(green)%d’ –date=local”
```
Source: [https://spin.atomicobject.com/](https://spin.atomicobject.com/2015/11/11/all-the-commits/#comment-537675)
