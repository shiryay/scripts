#SingleInstance Force
SendMode "Input"
SetWorkingDir A_ScriptDir

OpenObsidian() {
	SetTitleMatchMode 2
	If WinExist("- Vault -")
		WinActivate
	else
		Run "C:\Users\anon\AppData\Local\Programs\obsidian\Obsidian.exe"
	Sleep 3000
	WinActivate("- Vault -")
	Sleep 150
	Send "^+d"
	Sleep 150
	Send "^{End}"
	Send "{Enter}"
	return
}

CopyTextToObsidian() {
	A_Clipboard := ""
	Send "^c"
	ClipWait
	OpenObsidian
	Send "^v"
	return
}

OpenTg() {
	SetTitleMatchMode 2
	If WinExist("Telegram")
		WinActivate
	else
		Run "D:\Users\qrioz\AppData\Roaming\Telegram Desktop\Telegram.exe"
	Sleep 3000
	WinActivate("Telegram")
	return
}

CopyTextToTgSaved() {
	A_Clipboard := ""
	Send "^c"
	ClipWait
	OpenTg
	Send "^0"
	Sleep 150
	Send "^v"
	Send "{Enter}"
	return
}

; Downloading selected youtube link with savefrom web interface
; TODO: think about automating further with pressing download and saving file
^!y:: {
	A_Clipboard := ""
	Send "^l"
	Send "^c"
	ClipWait
	url := StrReplace(A_Clipboard, "youtube", "ssyoutube")
	;url := StrReplace(A_Clipboard, "https://www.youtube.com/watch?v=", "https://www.y2mate.com/youtube/")
	Run url
	return
}

; Bookmark a web page to obsidian from the page
^!u:: {
	A_Clipboard := ""
	Send "^l"
	Send "^c"
	ClipWait
	OpenObsidian
	Send "[Link]()"
	Send "{Left}"
	Send "^v"
	Send "{End}"
	Send "{Space}"
	Send "{Raw}#"
	Send "link"
	return
}

; Sending selected text to an opened Obsidian vault
!o:: {
	CopyTextToObsidian
}

#o:: {
	OpenObsidian
}

#t:: {
	OpenTg
}

;^!s:: {
;	CopyTextToTgSaved
;}

; Temporary function for searching a reference document
^7:: {
	A_Clipboard := ""
	Send "^c"
	ClipWait
	SetTitleMatchMode 2
	If WinExist("---for reference---") {
		WinActivate
		Sleep 150
		Send "^f"
		Sleep 1000
		Send "^v"
		Send "{Enter}"
	}
	else {

	}
	return
}

; Use F3 for Shift+F3 (change case in word)
F3:: {
	Send "+{F3}"
	return
}

; AutoHotkey Media Keys
; >^>Space::Send "{Media_Play_Pause}"
>^>Left:: Send "{Media_Prev}"
>^>Right:: Send "{Media_Next}"
; >^>Up::Send "{Volume_Up}"
; >^>Down::Send "{Volume_Down}"
>^>M:: Send "{Volume_Mute}"

; Enclose in quotes
^':: {
	Send "^c"
	Send Chr(34)
	Send "^v"
	Send Chr(34)
}

; Enclose in parens
^9:: {
	Send "^c"
	Send "("
	Send "^v"
	Send ")"
}

; Enclose in brackets
![:: {
	Send "^c"
	Send "["
	Send "^v"
	Send "]"
}

; Kill MS Word
^!w:: ProcessClose "winword.exe"

^-:: {
	Send "–"
}

; Open Windows Terminal
!Enter:: {
	Run "wt.exe"
}

; Open warp terminal
!^t:: {
	Run "d:\Users\unborn\AppData\Local\Programs\Warp\warp.exe"
}

ScrollLock:: {
	if GetKeyState("CapsLock", "T") {
		SetCapsLockState "Off"
	} else {
		SetCapsLockState "On"
	}
}

CapsLock:: {
	Send "{LAlt down}{Shift down}"
	Send "{LAlt up}{Shift up}"
}

; Save text to sticky note
^!n:: {
	Send "^c"
	Send "!v"
}
