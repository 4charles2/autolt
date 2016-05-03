#cs
	Corection réecrite du gag Note pad
#ce
HotKeySet("^q", "quitter")
Global $quitter = False, $nbEssai = 0 ;

If @OSBuild >= 5513 Then
   $interval = 70
Else
	$interval = 30
EndIf

$Pid = Run("Notepad.exe")
$Handle = WinWaitActive("[CLASS:Notepad]")
Send("Ceci est un jeu créé pour le tutoriel de openclassroom par timmalos." & @CRLF)
Send("Le but est simple fermer cette fenetre !" & @CRLF)
Send("Si tu n'y arrive pas, appuie sur Ctrl+q, Nous t'aiderons" & @CRLF)

While Not $quitter
	$Fenetre = WinGetPos("[CLASS:Notepad]")

	;Calcul les coordonnées de la croix rouge
	$FenetreX1 = $Fenetre[0] + $Fenetre[2] - $interval
	$FenetreX2 = $Fenetre[0] + $Fenetre[2]
	$FenetreY1 = $Fenetre[1]
	$FenetreY2 = $Fenetre[1] + 30

	$Souris = MouseGetPos()

	If ($Souris[0] >= $FentreX1 And $Souris[0] <= $FenetreX2) And ($Souris[1] >= $FenetreY1 And $Souris[1] <= $FenetreY2) Then
		$nbEssai += 1
		WinMove("[CLASS:Notepad]", "", Random(1, @DesktopHeight - $Fenetre[3], 1), $Fenetre[2], $Fenetre[3])
		WinSetTitle("[CLASS:Notepad]", "", "C'etait ton essai n° " & $nbEssai & ". Essaye encore ! (Ctrl+q pour abandonner et quitter.)")
	EndIf
	Sleep(200)
WEnd

Send("Tu t'avoue vaincu ?, je vais la fermer pour toi ! " & @CRLF)
Sleep(2000)
ProcessClose($Pid)

Func quitter()
	$quitter = True
EndFunc   ;==>quitter
