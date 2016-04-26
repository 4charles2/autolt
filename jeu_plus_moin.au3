#cs
Debut du jeu plus ou moins
Doc2ure
#ce
$nb_random = Random(0, 100, 1)
;Valeur min et max le flag 1 qui suit indique que je vuex un nombre entier

$msg= MsgBox(4, "Jeu du plus ou du moin", "Bonjour et bienvenue dans mon petit" & @CRLF &"Vous devrez devinez le nombre mystere" & @CRLF &"Vous voulez faire une partie :")
If $msg = 7 Then _fermer()
Do
   $input = InputBox("answer", "Entrer un nombre entre 1 et 100")
   If $input < $nb_random Then
	  MsgBox(64, "Jeu plus ou moins", "C'est plus")
   ElseIf $input > $nb_random Then
	  MsgBox(64, "Jeu plus ou moins", "C'est moins")
   Else
	  MsgBox(64, "Winner", "Vous avez gagnger Bravo")
   EndIf
Until($nb_random = $input)

Func _fermer()
   MsgBox(0, "Au revoir", "Bonne journée à vous")
   Exit
EndFunc