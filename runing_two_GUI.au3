#cs
Script qui gere l'ouverture de deux fenetre
La premiere avec une boite à cocher (checkBox) ainsi qu'un bouton pour afficher la GUI2
La deuxieme comportera un bouton radio (RadioBox) ainsi qu'un bouton pour afficher la GUI1
Gestion de la fermeture des fenetres doit être prise en compte
#ce
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>


   $hGUI1 = GUICreate("1GUI", 300, 300, -1, -1)
   $Lb1 = GUICtrlCreateLabel("Fenetre 1", 85, 10, 120, 24)
   $idCheckBox = GUICtrlCreateCheckbox("Boite a cocher", 10, 200)
   $idBouton = GUICtrlCreateButton("Deuxieme Fenetre", 100, 200)

   $hGUI2 = GUICreate("2GUI", 400, 400, -1, -1)
   $Lb1 = GUICtrlCreateLabel("Fenetre 2", 85, 10, 120, 24)
   $idRAdioBox = GUICtrlCreateRadio("La radio Box", 10, 200)
   $idBouton2 = GUICtrlCreateButton("1er Fenetre", 100, 200)

   GUISetState(@SW_SHOW, $hGUI1)

	while 1
Switch GUIGetMsg()
	Case $GUI_EVENT_CLOSE
	Exit
	Case $idBouton
	GUISetState(@SW_HIDE, $hGUI1)
GUISetState(@SW_SHOW, $hGUI2)
	Case $idBouton2
	GUISetState(@SW_HIDE, $hGUI2)
GUISetState(@SW_Show, $hGUI1)
	Case $idCheckBox
	MsgBox(8192, "Check Box", "vous avez cliquer sur la check box")
	Case $idRadioBox
	MsgBox(131072, "Radio Box", "vous avez cliquer sur la radio box")
	EndSwitch
	WEnd
