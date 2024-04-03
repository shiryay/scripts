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
	Send, ^+d
	Sleep, 150
	Send, ^{End}
	Send, {Enter}
	Send, ^v
	return

; Downloading selected youtube link with savefrom web interface
^!y::
	Send ^l
	Send ^c
	Sleep 150
	url := StrReplace(clipboard, "youtube", "ssyoutube")
	Run, %url%
	return

; Bookmark a web page to obsidian from the page
^!l::
	Send ^l
	Send ^c
	Sleep 150
	SetTitleMatchMode, 2
	WinActivate, - Vault -
	Sleep, 150
	Send, ^+d
	Sleep, 150
	Send, ^{End}
	Send, {Enter}
	Send, [Link]()
	Send, {Left}
	Send, ^v
	Send, {End}
	Send, {Space}
	Send, {Raw}#
	Send, link
	return
