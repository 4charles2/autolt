#cs
Script Creation d'une GUI
Doc2rue
#ce
;J'ai mit -1 pour que la fenetre soit centrer sur l'ecran au demarrage
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

$GUI = GUICreate("Open Windows", 200, 200, -1, -1)
$Bouton1 = GUICtrlCreateButton("OK", 60, 130, 75, 25)
;Il s'agit la de l'instruction qui affiche la GUI à l'écran
GUISetState(@SW_SHOW)

While 1
   $nMsg = GUIGetMsg()
   Switch $nMsg
	  Case $GUI_EVENT_CLOSE
		 Exit
	  Case $Bouton1
		MsgBox(64 + 8192, 'Message', 'Vous avez cliqué sur le bouton OK')
   EndSwitch
WEnd