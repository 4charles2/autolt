#cs
FOE_GUI
Controle de foe avec fenetre et bouton pour decider les manipulations à effectuer
#ce
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <AutoItConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=D:\Programmation\AutoIt3\SciTE\Koda\Forms\control_FOE.kxf
Global $screen = GUICreate("Control FOE", 161, 155, 713, 378)
GUISetFont(8, 800, 0, "MS Sans Serif")
GUISetBkColor(0x000000)
Global $Ramasser_piece = GUICtrlCreateButton("Ramasser les Pièces", 16, 24, 129, 25)
GUICtrlSetFont(-1, 8, 800, 0, "Segoe Script")
GUICtrlSetColor(-1, 0x008080)
GUICtrlSetBkColor(-1, 0xC8C8C8)
Global $buton_quiter = GUICtrlCreateButton("Quitter", 8, 120, 145, 25)
GUICtrlSetFont(-1, 12, 800, 0, "Impact")
GUICtrlSetColor(-1, 0x800000)
GUICtrlSetBkColor(-1, 0x99B4D1)
GUICtrlSetCursor (-1, 0)
Global $aide_joueur = GUICtrlCreateButton("aide joueur", 24, 56, 105, 25)
GUICtrlSetFont(-1, 8, 800, 0, "Small Fonts")
GUICtrlSetColor(-1, 0x808000)
GUICtrlSetBkColor(-1, 0xC8C8C8)
Global $buton_Les_deux = GUICtrlCreateButton("Les deux", 24, 88, 105, 25)
GUICtrlSetFont(-1, 8, 800, 0, "Small Fonts")
GUICtrlSetColor(-1, 0x808000)
GUICtrlSetBkColor(-1, 0xC8C8C8)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

;Créer le code pour ouvrir le navigateur lancer foe
MsgBox(0,"info", "Assurez vous d'avoir bien ouvert le navigateur avec foe", 1)
While 1
 $nMsg = GUIGetMsg()
 Switch $nMsg
  Case $GUI_EVENT_CLOSE, $buton_quiter
   Exit
  Case $Ramasser_piece
	 ramasse_piece(7, 2992, 589); Completer avec les coordonnéés par default
  Case $aide_joueur
	  aide_joueur(79);Completer avec le choix par bouton du nombre d'onglet a faire
   Case $buton_Les_deux
	  ramasse_piece(7, 2992, 589); Completer avec les coordonnéés par default
	  aide_joueur(79);Completer avec le choix par bouton du nombre d'onglet a faire
 EndSwitch
WEnd

Func ramasse_piece($nb_tour, $pos_depart_x, $pos_depart_y)
   $x = 3747
   $y = 152
   $coeficient_x = 1736
   $coeficient_y = 45
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

Func aide_joueur($nb_perso)
   const $button_perso_y = 1026, $nb_perso_page = 5
   ;$nb_joueur = [79, 22, 4]

   $coeficient_perso_x = 430
   $button_double_fleche_x = 2833
   $button_double_fleche_y = 975
   $onglet_x = 2659
   $onglet_y = 896

  For $i = 0 To 2 Step 1
	  MouseClick("left", $onglet_x, $onglet_y)
	  For $click_fleche = 0 To $nb_perso+1 step $nb_perso_page
		 For $button_perso_x = 2228 To 2658 Step 105
			MouseClick("left", $button_perso_x, $button_perso_y, 1, 0)
			Sleep(1500)
		 Next
		 MouseClick("left", $button_double_fleche_x, $button_double_fleche_y)
	  Next
	  $onglet_x += 70
  Next

EndFunc