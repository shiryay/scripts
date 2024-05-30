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
		Run "C:\Users\anon\AppData\Roaming\Telegram Desktop\Telegram.exe"
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
	;url := StrReplace(A_Clipboard, "youtube", "ssyoutube")
	url := StrReplace(A_Clipboard, "https://www.youtube.com/watch?v=", "https://www.y2mate.com/youtube/")
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

^!s:: {
	CopyTextToTgSaved
}

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
>^>Left::Send "{Media_Prev}"
>^>Right::Send "{Media_Next}"
; >^>Up::Send "{Volume_Up}"
; >^>Down::Send "{Volume_Down}"
>^>M::Send "{Volume_Mute}"

; Remap copypasting keys
F1::Send "^c"
F2::Send "^v"

; Enclose in quotes
^':: {
	Send "^c"
	Send Chr(34)
	Send "^v"
	Send Chr(34)
}

; Start Terminal
^!t::Run "wt.exe"