#cs
Script qui demande un numero à l'utilisateur
L'affiche dans msgbox lorsque que l'user clik dessus le numero en dessous s'affiche
author: Doc2rue
#ce
$input = InputBox("saisie", "Ecrivez un nombre")

For $i = $input To 1 Step -1
   MsgBox(0, "reponse", "votre numero auquel j'ai soustrait la valeur 1 : " &$i)
Next
MsgBox(0, "dernier", "ZERO!")