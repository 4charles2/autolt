#cs
Manappulation de deux fenetre avec le fonction GUIGetMsg(1) en Mode avancée
Doc2rue
#ce
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

;######Creation de la premiere fenetre#######
$GUI1 = GUICreate("Fenetre 1", 400, 280)
$Lbl1 = GUICtrlCreateEdit("Va fermer cette fenetre et en ouvrir une autre", 200, 20)
$idButton1 = GUICtrlCreateButton("OK", 30, 20, 120, 40)
$idRadio = GUICtrlCreateRadio("Radio", 50, 120, 70, 20)
;#####Creation de la deuxieme fentre######
$GUI2 = GUICreate("Fentre 2", 400, 280)
$IdButton2 = GUICtrlCreateButton("OK", 30, 20, 120, 40)
$idCheckBox = GUICtrlCreateRadio("CheckBox", 50, 120, 70, 20)

GUISetState(@SW_SHOW, $GUI1)

While 1
   $nMsg = GUIGetMsg(1)
		 Switch $nMsg[0]
			Case $GUI_EVENT_CLOSE
                If $nMsg[1] = $GUI1 Then
				   MsgBox(64 + 1, "Fermeture", "Va se fermer automatiquement demande effecuter depuis la GUI1", 2)
				ElseIf $nMsg[1] = $GUI2 Then
				   MsgBox($MB_SYSTEMMODAL, "Fermeture", "Va se fermer automatiquement demande effectuer depuis la GUI2", 2)
			   EndIf
               ExitLoop
            Case $idButton1
                MsgBox(64, "Info", "Ouverture de la deuxieme fenetre", 2)
				GUISetState(@SW_HIDE, $GUI1)
				GUISetState(@SW_SHOW, $GUI2)
			 Case $idButton2
				MsgBox(64, "Info", "Ouverture de la premiere fenetre", 2)
				GUISetState(@SW_HIDE, $GUI2)
				GUISetState(@SW_SHOW, $GUI1)
            Case $idRadio
                MsgBox($MB_SYSTEMMODAL, "info click", "Vous avez cliquer a la position x :" & $nMsg[3] & " et y :" & $nMsg[4], 2)
            Case $idRadio
                MsgBox($MB_SYSTEMMODAL, "info click", "Vous avez cliquer a la position x :" & $nMsg[3] & " et y :" & $nMsg[4], 2)
        EndSwitch
    WEnd