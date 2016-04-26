#cs
Demande du jour a l'utilisateur et vérification si correspond au jour courant
Boucle tant que l'user n'a pas rentre le bon jour en numerique la date du jour
script créer le 26/04/2016
La bonne réponse aurai été 26
#ce
$input = 0
While ($input <> @MDAY)
   $input = InputBox("verif day", "Le combien somme nous aujourd'hui?")
   If $input = @MDAY Then
	  MsgBox(0, "reponse", "bravo vous avez trouvez le bon jour")
   Else
	  MsgBox(0, "reponse", "Vous n'avez pas trouvez le bon jour dsl recommencer")
   EndIf
WEnd