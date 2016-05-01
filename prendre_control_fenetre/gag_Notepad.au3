#cs
Demarre le bloc-note et écrit les règles dedans

Objectif : Quand l'utilisateur s'aproche de la croix la fenetre recul
Le Titre change a chaque deplacement de fenetre du à la tentative de fermeture de la fenetre
Le Titre sera alors le nombre de tentative

Pour quitter l'application le joueur devra faire le racourci Ctrl + q.
Une message de fermeture apparaît et on ferme l'appli
#ce

$idPID = Run("Notepad.exe")
$hWnd = WinWait("[CLASS:Notepad]", "" 10)
$posWnd = ControlGetPos($hWnd, "", "Notepad")
$posCroix =
$posLimite =

While 1
   $aPos = MouseGetPos()
   ;Si la souris s'approche de la croix (des positions x et y déterminé à l'avance
	  If $aPos[0] > $posLimiteX And $aPos[1] < $posLimiteY Then
		 deplacer_la_fenetre()
	  EndIf
	  Sleep(1000)
WEnd
