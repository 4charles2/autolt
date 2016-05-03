#cs
	Demarre le bloc-note et écrit les règles dedans

	Objectif : Quand l'utilisateur s'aproche de la croix la fenetre recul
	Le Titre change a chaque deplacement de fenetre du à la tentative de fermeture de la fenetre
	Le Titre sera alors le nombre de tentative

	Pour quitter l'application le joueur devra faire le racourci Ctrl + q.
	Une message de fermeture apparaît et on ferme l'appli
#ce

$idPID = Run("Notepad.exe")
$hWnd = WinWait("[CLASS:Notepad]", "", 10)
WinMove($hWnd, "", @DesktopHeight / 2, @DesktopWidth / 4)
$interval = 50
$i = 0


Send("Bonjour ! " & @CRLF & "Esseyez de fermer le note pad !" & @CRLF & "Si Vous n'y arriver pas appuiyez sur les touches Ctrl + Q" & @CRLF & "Nous vous aiderons")

;Fonction HotKeySet fait un callBack si l'USER appuie sur une touche et apel ensuite la fonction designer atend quel s'execute et reprend le processus la ou il s'était arreter
HotKeySet("^q", quitter)

While 1
	$posWnd = WinGetPos($hWnd)
	$posLimiteX = $posWnd[2] + $posWnd[0] - $interval
	$posLimiteY = $posWnd[1] + $interval
	$aPos = MouseGetPos()
	;Si la souris s'approche de la croix (des positions x et y déterminé à l'avance)
	If $aPos[0] > $posLimiteX And $aPos[1] < $posLimiteY Then
		WinMove($hWnd, "", $posWnd[0] + $interval, $posWnd[1] - $interval)
		WinSetTitle($hWnd, "", "C'est la " & $i & " Nb de fois Que vous esseyez de fermer la fenetre")
		$i += 1
	EndIf
	If $posWnd[1] < 0 Then
		WinMove($hWnd, "", 10, @DesktopHeight - $posWnd[3] + 10)
	EndIf
	Sleep(10)
WEnd ;==>Boucle Principale

Func quitter()"Fermeture", "Bravo Vous avez reussi à fermer la fenetre", 2)
	ProcessClose($idPID)
	Exit
EndFunc   ;==>quitter
