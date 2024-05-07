#SingleInstance Force
SendMode "Input"
SetWorkingDir A_ScriptDir

Search(engine) {
	urls := Map()
	urls["Google"]:= "https://www.google.ru/search?q=`%22@@@`%22"
	urls["GoogleBooks"] := "https://www.google.com/search?tbm=bks&q=`%22@@@`%22"
	urls["GoogleTr"] := "https://translate.google.ru/?sl=auto&tl=en&text=@@@&op=translate&hl=en"
	urls["Bing"] := "https://www.bing.com/search?q=%22@@@%22"
	urls["LingueeDeEn"] := "https://www.linguee.de/deutsch-englisch/search?source=auto&query=`%22@@@`%22"
	urls["LingueeRuEn"] := "https://www.linguee.ru/russian-english/search?source=auto&query=@@@"
	urls["LingueeEsEn"] := "https://www.linguee.com/english-spanish/search?source=spanish&query=@@@"
	urls["LingueeFrEn"] := "https://www.linguee.fr/francais-anglais/search?source=auto&query=@@@"
	urls["Proz"] := "https://www.google.ru/search?q=`%22@@@`%22+english+proz"
	urls["Insur"] := "https://www.insur-info.ru/dictionary/search/?q=@@@&btnFind=`%C8`%F1`%EA`%E0`%F2`%FC`%21&q_far"
	urls["MultitranWeb"] := "https://www.multitran.com/c/m.exe?CL=1&s=@@@&l1=1&l2=2"
	urls["Abkuerzungen"] := "http://abkuerzungen.de/result.php?searchterm=@@@&language=de"
	urls["Acronymfinder"] := "https://www.acronymfinder.com/@@@.html"
	urls["Webster"] := "https://www.merriam-webster.com/dictionary/@@@"
	urls["Wox"] := "https://abkuerzungen.woxikon.de/abkuerzung/@@@.php"
	urls["Sokr"] := "http://sokr.ru/@@@/"
	urls["Yandex"] := "https://yandex.ru/search/?text=`%22@@@`%22"
	urls["CollinsDe"] := "https://www.collinsdictionary.com/dictionary/german-english/@@@"
	urls["CollinsEs"] := "https://www.collinsdictionary.com/dictionary/spanish-english/@@@"
	urls["CollinsFr"] := "https://www.collinsdictionary.com/dictionary/french-english/@@@"
	urls["CollinsIt"] := "https://www.collinsdictionary.com/dictionary/italian-english/@@@"
	urls["CollinsPt"] := "https://www.collinsdictionary.com/dictionary/portuguese-english/@@@"
	urls["Bilexis"] := "https://bilexis.com/collocation/@@@"
	urls["DeepL"] := "https://www.deepl.com/en/translator#ru/en/@@@"
	url := urls[engine]
	ClipSaved := A_Clipboard
	A_Clipboard := ""
	Send "^c"
	ClipWait
	url := StrReplace(url, "@@@", A_Clipboard)
	A_Clipboard := ClipSaved
	Run url
}

!g:: {
	provider := "Google"
	Search(provider)
	return
}

^!b:: {
	provider := "GoogleBooks"
	Search(provider)
	return
}

!t:: {
	provider := "GoogleTr"
	Search(provider)
	return
}

!b:: {
	provider := "Bing"
	Search(provider)
	return
}

!d:: {
	provider := "LingueeDeEn"
	Search(provider)
	return
}

!r:: {
	provider := "LingueeRuEn"
	Search(provider)
	return
}

!s:: {
	provider := "LingueeEsEn"
	Search(provider)
	return
}

!f:: {
	provider := "LingueeFrEn"
	Search(provider)
	return
}

!p:: {
	provider := "Proz"
	Search(provider)
	return
}

!i:: {
	provider := "Insur"
	Search(provider)
	return
}

!m:: {
	provider := "MultitranWeb"
	Search(provider)
	return
}

!a:: {
	provider := "Acronymfinder"
	Search(provider)
	return
}

!k:: {
	provider := "Sokr"
	Search(provider)
	return
}

!u:: {
	provider := "Abkuerzungen"
	Search(provider)
	return
}

!w:: {
	provider := "Webster"
	Search(provider)
	return
}

!x:: {
	provider := "Wox"
	Search(provider)
	return
}

!y:: {
	provider := "Yandex"
	Search(provider)
	return
}

!z:: {
	A_Clipboard := ""
	Send "^c"
	ClipWait
	SetTitleMatchMode 2
	If WinExist("MultiTran")
		WinActivate
	else
		Run "d:\mt\network\multitran.exe"
		Sleep(2000)
		WinActivate("MultiTran")
	return
}

^!d:: {
	provider := "CollinsDe"
	Search(provider)
	return
}

^!e:: {
	provider := "CollinsEs"
	Search(provider)
	return
}

^!f:: {
	provider := "CollinsFr"
	Search(provider)
	return
}

^!i:: {
	provider := "CollinsIt"
	Search(provider)
	return
}

^!p:: {
	provider := "CollinsPt"
	Search(provider)
	return
}

!l:: {
	provider := "Bilexis"
	Search(provider)
	return
}

^!l:: {
	provider := "DeepL"
	Search(provider)
	return
}