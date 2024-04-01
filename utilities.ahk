#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Sending selected text to an opened Obsidian vault
!o::
	Send, ^c
	SetTitleMatchMode, 2
	WinActivate, - Vault -
	Sleep, 150
	Send, ^{End}
	Send, {Enter}
	Send, ^v
	return

; Downloading selected youtube link with savefrom web interface
^!y::
	Send ^c
	Sleep 150
	url := StrReplace(clipboard, "youtube", "ssyoutube")
	Run, %url%
	return

