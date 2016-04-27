#cs
Script d'explication du site openclassroom
Pour comprendre le mode evenementiel
#ce
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Opt("GUIOnEventMode", 1) ; Activation du mode événementiel

; ########## Début de la création de la GUI 1 ##########
$GUI1 = GUICreate("GUI1", 250, 150, -1, -1) ; Création de la GUI1
GUISetOnEvent($GUI_EVENT_CLOSE, "FermeGUI") ; Attribution de la fonction FermeGUI pour l'événement $GUI_EVENT_CLOSE
$Lb1 = GUICtrlCreateLabel("Fenêtre 1", 85, 10, 120, 24) ; Création du label1
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif") ; Mise en gras du texte du contrôle précédent (Label1)
$Chb1 = GUICtrlCreateCheckbox("Checkbox1", 90, 60, 100, 20) ; Création d'une CheckBox
GUICtrlSetOnEvent($Chb1, "CheckBox1") ; Attribution de la fonction CheckBox1 pour un clic sur $Chb1
$Btn1 = GUICtrlCreateButton("Masque la GUI1 et Affiche la GUI2", 35, 110, 180, 25) ; Création d'un bouton simple
GUICtrlSetOnEvent($Btn1, "Bouton1") ; Attribution de la fonction Bouton1 pour un clic sur $Btn1
; ########## Fin de la création de la GUI 1 ##########

; ########## Début de la création de la GUI 2 ##########
$GUI2 = GUICreate("GUI2", 250, 150, -1, -1) ; Création de la GUI2
GUISetOnEvent($GUI_EVENT_CLOSE, "FermeGUI") ; Attribution de la fonction FermeGUI pour l'événement $GUI_EVENT_CLOSE
$Lbl2 = GUICtrlCreateLabel("Fenêtre 2", 85, 10, 120, 24) ; Création du label2
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif") ; Mise en gras du texte du contrôle précédent (Label2)
$Rd1 = GUICtrlCreateRadio("Radio1", 100, 60, 100, 20) ; Création d'un bouton radio
GUICtrlSetOnEvent($Rd1, "Radio1") ; Attribution de la fonction Radio1 pour un clic sur $Rd1
$Btn2 = GUICtrlCreateButton("Masque GUI 1 et Affiche GUI 2", 35, 110, 180, 25) ; Création d'un bouton simple
GUICtrlSetOnEvent($Btn2, "Bouton2") ; Attribution de la fonction Bouton2 pour un clic sur $Btn2
; ########## Fin de la création de la GUI 2 ##########

GUISetState(@SW_SHOW, $GUI1) ; On affiche la GUI1 (la GUI2 reste masquée)

While 1 ; Début de la boucle infinie
        Sleep(1000) ; Pause du script
WEnd ; Fin de la boucle infinie

Func FermeGUI() ; Début de la fonction
        If @GUI_WINHANDLE = $GUI1 Then ; Contrôle de la valeur de @GUI_WINHANDLE
                MsgBox(64, 'Info', 'Vous avez choisi de fermer la fenêtre 1 ayant pour handle : ' & @GUI_WINHANDLE) ; Message
        Else ; Sinon
                MsgBox(64, 'Info', 'Vous avez choisi de fermer la fenêtre 2 ayant pour handle : ' & @GUI_WINHANDLE) ; Message
        EndIf ; Fin de la condition If
        Exit ; Sortie du script
EndFunc ; Fin de la fonction

Func CheckBox1() ; Début de la fonction
        MsgBox(64, 'Info', 'Vous avez cliqué sur la CheckBox') ; Message
EndFunc ; Fin de la fonction

Func Bouton1() ; Début de la fonction
        GUISetState(@SW_HIDE, $GUI1) ; On masque la GUI 1
        GUISetState(@SW_SHOW, $GUI2) ; On affiche la GUI 2
EndFunc ; Fin de la fonction

Func Radio1() ; Début de la fonction
        MsgBox(64, 'Info', 'Vous avez cliqué sur la RadioBox') ; Message
EndFunc ; Fin de la fonction

Func Bouton2() ; Début de la fonction
        GUISetState(@SW_HIDE, $GUI2) ; On masque la GUI 2
        GUISetState(@SW_SHOW, $GUI1) ; On affiche la GUI 1
EndFunc ; Fin de la fonction