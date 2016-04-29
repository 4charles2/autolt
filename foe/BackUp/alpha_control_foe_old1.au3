#cs
Interface complete de controle pour age of empire
Doc2rue
Le 28/04/2016
#ce
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
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
	   MsgBox(0,"nb_boucle", "Nombre de boucle dans le while principal : " & $i, 2)
	  Exit
	 Case $buton_ramasse_piece
		 ramasse_piece(7, GUICtrlRead($pos_x_depart_piece), GUICtrlRead($pos_y_depart_piece))
	 Case $buton_aide_perso
		aide_joueur()
	 Case $buton_les_deux
	 EndSwitch
	 Sleep(10)
	 $i = $i + 1
   WEnd
EndFunc

Func ramasse_piece($nb_tour, $pos_depart_x, $pos_depart_y)
   $x = GUICtrlRead($pos_x_top_right_piece)
   $y = GUICtrlRead($pos_y_top_right_piece)
   $coeficient_x = GUICtrlRead($coeficient_x_piece)
   $coeficient_y = GUICtrlRead($coeficient_y_piece)

   MouseMove($pos_depart_x, $pos_depart_y)
   MouseDown($MOUSE_CLICK_LEFT);Apui sur le bouton gauche de la souris
   For $nb_ligne = 0 To $nb_tour Step 1

		MouseMove($x, $y, 50)
		 $y += $coeficient_y
		MouseMove($x, $y, 50)
		 $x -= $coeficient_x
		MouseMove($x, $y, 50)
		 $y += $coeficient_y
		MouseMove($x, $y, 50)
		 $x += $coeficient_x
   Next

   MouseUp($MOUSE_CLICK_LEFT)
EndFunc

Func aide_joueur()
   const $nb_perso_page = 5
   $nb_perso = GUICtrlRead($input_nb_perso)
   $button_perso_y = GUICtrlRead($pos_y_depart_aide)
   $pos_x = GUICtrlRead($pos_x_depart_aide)
   ;$nb_joueur = [79, 22, 4]

   $coeficient_perso_x = 105
   $button_double_fleche_x = GUICtrlRead($pos_x_fleche)
   $button_double_fleche_y = GUICtrlRead($pos_y_fleche)
   $onglet_x = GUICtrlRead($pos_x_onglet)
   $onglet_y = GUICtrlRead($pos_y_onglet)

  For $i = GUICtrlRead($input_nb_onglet) To 1 Step -1
	  MouseClick("left", $onglet_x, $onglet_y)
	  For $click_fleche = 5 To $nb_perso step $nb_perso_page
		 For $button_perso_x = $pos_x To $pos_x+$coeficient_perso_x*4 Step 105
			MouseClick("left", $button_perso_x, $button_perso_y, 1, 0)
			Sleep(1500)
		 Next
		 MouseClick("left", $button_double_fleche_x, $button_double_fleche_y)
	  Next
	  $onglet_x += 70
  Next

EndFunc