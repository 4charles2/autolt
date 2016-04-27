#cs
Essai automatisation

########Enlever les commentaires pour appeler une fonction##########
#ce
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>




;1er argument nb tour à *3 pour avoir le total
;2e argument position x de depart Le 3en position y
;ramasse_piece(7, 3460, 298)

;Argument 1 nb de joueur { VOISIN = 79, GUILDE = 22, AMI = 4}
;Pour 2 onglet 79 + 22 Pour 3 onglet 79 + 22 + 4
;Argument 2 nb_onglet_parthern {1 2 3}


aide_joueur(79)


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