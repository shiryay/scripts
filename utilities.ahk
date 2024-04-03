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

; Downloading selected youtube link with savefrom web interface
; TODO: think about automating further with pressing download and saving file
^!y:: {
	A_Clipboard := ""
	Send "^l"
	Send "^c"
	ClipWait
	url := StrReplace(A_Clipboard, "youtube", "ssyoutube")
	Run url
	return
}

; Bookmark a web page to obsidian from the page
^!l:: {
	Send "^l"
	Send "^c"
	Sleep 150
	SetTitleMatchMode 2
	If WinExist("- Vault -")
		WinActivate
	else
		Run "C:\Users\anon\AppData\Local\Programs\obsidian\Obsidian.exe"
		WinActivate("- Vault -")
	Sleep 150
	Send "^+d"
	Sleep 150
	Send "^{End}"
	Send "{Enter}"
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
	A_Clipboard := ""
	Send "^c"
	ClipWait
	OpenObsidian
	Send "^v"
	return
}

#o:: {
	OpenObsidian
}