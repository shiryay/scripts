TODO: Convert vba code below into ahk

```
Sub KillHiddenText()
'
'   Removes hidden text from active document
'

    Selection.HomeKey Unit:=wdStory
    Selection.Find.ClearFormatting
    Selection.Find.Font.Hidden = True
    Selection.Find.replacement.ClearFormatting
    With Selection.Find
        .Text = "^?"
        .replacement.Text = ""
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
End Sub

Public Function convert_date(ByVal dt As String) As String
'
'   Converts a single date from EU to US and vice versa
'   Now the separator in the converted date is "/"
'
    
    Dim split_date() As String
    Dim sep, newSep As String
    
    newSep = "/" ' As per new requirements
    
    If InStr(dt, ".") Then sep = "."
    If InStr(dt, "/") Then sep = "/"
    If InStr(dt, "-") Then sep = "-"
    
    
    split_date = Split(dt, sep)
    convert_date = split_date(1) + newSep + split_date(0) + newSep + split_date(2)

End Function

Sub ConvertDates()
'
'   Converts all dates in active document from EU to US and vice versa
'   Now the separator in the converted date is "/"
'

    Dim dates() As String
    Dim replacement As String
    Dim RegExp As Object
    Dim regExp_Matches, Match As Object
    Dim S As String
    
    
    ReportString = ""
    Set RegExp = CreateObject("vbscript.regexp")
    
    With RegExp
        .Pattern = "\b(\d|\d\d)([\./-])(\d|\d\d)[\./-](\d\d\d\d|\d\d)\b"
        .Global = True
        If .Test(ActiveDocument.Content) Then
            Set regExp_Matches = .Execute(ActiveDocument.Content)
            Log ("Changes made:")
        End If
    End With
    
    For Each Match In regExp_Matches
        Selection.Find.ClearFormatting
        Selection.Find.replacement.ClearFormatting
        S = Match & " -> " & convert_date(Match) & Chr(13) & Chr(10)
        Log (S)
        With Selection.Find
            .Text = Match
            .replacement.Text = convert_date(Match)
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = False
            .MatchWildcards = False
            .MatchSoundsLike = False
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
    Next
    SaveReport ("ChangeReport.docx")

End Sub
```