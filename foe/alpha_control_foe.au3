#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=forge.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs
	Interface complete de controle pour age of empire
	Doc2rue
	Le 28/04/2016
#ce
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ComboConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include "GUI_foe_alpha.au3"

main()

Func main()
	$i = 0

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				MsgBox(0, "nb_boucle", "Nombre de boucle dans le while principal : " & $i, 2)
				Exit
			Case $buton_ramasse_piece
				ramasse_piece(7, GUICtrlRead($pos_x_depart_piece), GUICtrlRead($pos_y_depart_piece))
			Case $buton_aide_perso
				aide_joueur()
			Case $buton_les_deux
				ramasse_piece(7, GUICtrlRead($pos_x_depart_piece), GUICtrlRead($pos_y_depart_piece))
				aide_joueur()
		EndSwitch
		Sleep(20)
		$i = $i + 1
	WEnd
EndFunc   ;==>main

Func ramasse_piece($nb_tour, $pos_depart_x, $pos_depart_y)
	$x = GUICtrlRead($pos_x_top_right_piece)
	$y = GUICtrlRead($pos_y_top_right_piece)
	$coeficient_x = GUICtrlRead($coeficient_x_piece)
	$coeficient_y = GUICtrlRead($coeficient_y_piece)

	MouseMove($pos_depart_x, $pos_depart_y)
	MouseDown($MOUSE_CLICK_LEFT) ;Apui sur le bouton gauche de la souris
	For $nb_ligne = 0 To $nb_tour Step 1

		MouseMove($x, $y, 40)
		$y += $coeficient_y
		MouseMove($x, $y, 40)
		$x -= $coeficient_x
		MouseMove($x, $y, 40)
		$y += $coeficient_y
		MouseMove($x, $y, 40)
		$x += $coeficient_x
	Next

	MouseUp($MOUSE_CLICK_LEFT)
EndFunc   ;==>ramasse_piece

Func aide_joueur()
	Const $nb_perso_page = 5
	$coeficient_perso_x = 105
	$nb_onglet = 1
	$button_double_fleche_x = GUICtrlRead($pos_x_fleche)
	$button_double_fleche_y = GUICtrlRead($pos_y_fleche)
	$button_perso_y = GUICtrlRead($pos_y_depart_aide)
	$pos_x = GUICtrlRead($pos_x_depart_aide)


	Switch GUICtrlRead($choose_onglet)
	  Case "Choisir"
		 $nb_perso = GUICtrlRead($input_nb_perso)
		 $onglet_x = GUICtrlRead($pos_x_onglet)
		 $onglet_y = GUICtrlRead($pos_y_onglet)
		 $nb_onglet = GUICtrlRead($input_nb_onglet)
	  Case "VOISIN"
		 $nb_perso = 79; ##########ICI Metre une Deuxieme page pour les options au lieu de devoir écrire à la main les valeurs#########
		 $onglet_x = 737
		 $onglet_y = 896
	  Case "GUILDE"
		 $nb_perso = 22
		 $onglet_x = 804
		 $onglet_y = 896
	  Case "AMI"
		 $nb_perso = 5
		 $onglet_x = 867
		 $onglet_y = 896
	  Case "LES TROIS"
		 $nb_onglet = 3
		 $onglet_x = 737
		 $onglet_y = 896
   EndSwitch

	For $i =  $nb_onglet To 1 Step -1
		MouseClick("left", $onglet_x, $onglet_y)
		For $click_fleche = 5 To $nb_perso Step $nb_perso_page
			For $button_perso_x = $pos_x To $pos_x + $coeficient_perso_x * 4 Step 105
				MouseClick("left", $button_perso_x, $button_perso_y, 1, 0)
				Sleep(1100)
			Next
			MouseClick("left", $button_double_fleche_x, $button_double_fleche_y)
			Sleep(1000)
		Next
		$onglet_x += 70
	Next

EndFunc   ;==>aide_joueur
