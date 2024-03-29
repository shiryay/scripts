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