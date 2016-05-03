#cs
	Demarre le bloc-note et �crit les r�gles dedans

	Objectif : Quand l'utilisateur s'aproche de la croix la fenetre recul
	Le Titre change a chaque deplacement de fenetre du � la tentative de fermeture de la fenetre
	Le Titre sera alors le nombre de tentative

	Pour quitter l'application le joueur devra faire le racourci Ctrl + q.
	Une message de fermeture appara�t et on ferme l'appli
#ce

$idPID = Run("Notepad.exe")
$hWnd = WinWait("[CLASS:Notepad]", "", 10)
$posWnd = WinGetPos($hWnd)
$interval = 105
$posLimiteX = $posWnd[2] + $posWnd[0] - $interval
$posLimiteY = $posWnd[1] + $interval

Send("Bonjour ! " & @CRLF & "Esseyez de fermer le note pad !" & @CRLF & "Si Vous n'y arriver pas appuiyez sur les touches Ctrl + Q" & @CRLF & "Nous vous aiderons")

;Fonction HotKeySet fait un callBack si l'USER appuie sur une touche et apel ensuite la fonction designer atend quel s'execute et reprend le processus la ou il s'�tait arreter
HotKeySet("^q", quitter)

While 1
	$aPos = MouseGetPos()

	;Si la souris s'approche de la croix (des positions x et y d�termin� � l'avance)
	If $aPos[0] > $posLimiteX And $aPos[1] < $posLimiteY Then
		WinMove($hWnd, "", $posWnd[0] + $interval, $posWnd[1] - $interval)
	 EndIf
	Sleep(10)
WEnd

Func quitter()
   MsgBox(64, "Fermeture", "Bravo Vous avez reussi � fermer la fenetre", 2)
   Exit
   EndFunc