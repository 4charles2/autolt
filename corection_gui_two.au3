#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

; ########## D�but de la cr�ation de la GUI 1 ##########
$GUI1 = GUICreate("GUI1", 250, 150, -1, -1) ; Cr�ation de la GUI1
$Lb1 = GUICtrlCreateLabel("Fen�tre 1", 85, 10, 120, 24) ; Cr�ation du label1
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif") ; Mise en gras du texte du contr�le pr�c�dent (Label1)
$Chb1 = GUICtrlCreateCheckbox("Checkbox1", 90, 60, 100, 20) ; Cr�ation d'une CheckBox
$Btn1 = GUICtrlCreateButton("Masque la GUI1 et Affiche la GUI2", 35, 110, 180, 25) ; Cr�ation d'un bouton simple
; ########## Fin de la cr�ation de la GUI 1 ##########

; ########## D�but de la cr�ation de la GUI 2 ##########
$GUI2 = GUICreate("GUI2", 250, 150, -1, -1) ; Cr�ation de la GUI2
$Lbl2 = GUICtrlCreateLabel("Fen�tre 2", 85, 10, 120, 24) ; Cr�ation du label2
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif") ; Mise en gras du texte du contr�le pr�c�dent (Label2)
$Rd1 = GUICtrlCreateRadio("Radio1", 100, 60, 100, 20) ; Cr�ation d'un bouton radio
$Btn2 = GUICtrlCreateButton("Masque GUI 1 et Affiche GUI 2", 35, 110, 180, 25) ; Cr�ation d'un bouton simple
; ########## Fin de la cr�ation de la GUI 2 ##########

GUISetState(@SW_SHOW, $GUI1) ; On affiche la GUI1 (la GUI2 reste masqu�e)

While 1 ; D�but de la boucle infinie

    $nMsg = GUIGetMsg() ; R�cup�ration des messages GUI
    Switch $nMsg ; D�but du s�lecteur de cas

        Case $GUI_EVENT_CLOSE ; Si clic fermeture fen�tre GUI1 ou GUI2 on sort
            MsgBox(64, 'Info', 'Vous avez choisi de fermer la fen�tre en cours') ; Message
            Exit ; Fin du script

        Case $Btn1 ; Si clic sur le bouton $Btn1
            GUISetState(@SW_HIDE, $GUI1) ; On masque la GUI 1
            GUISetState(@SW_SHOW, $GUI2) ; On affiche la GUI 2

        Case $Chb1 ; Si clic sur le contr�le $Chb1 (CheckBox)
            MsgBox(64, 'Info', 'Vous avez cliqu� sur la CheckBox') ; Message

        Case $Btn2 ; Si clic sur le bouton $Btn2
            GUISetState(@SW_HIDE, $GUI2) ; On masque la GUI 2
            GUISetState(@SW_SHOW, $GUI1) ; On affiche la GUI 1

        Case $Rd1 ; Si clic sur le contr�le $Rd1 (RadioBox)
            MsgBox(64, 'Info', 'Vous avez cliqu� sur la RadioBox') ; Message

    EndSwitch ; Fin du s�lecteur de cas
WEnd ; Fin de la boucle infinie