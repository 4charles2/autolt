#cs
Demande du jour a l'utilisateur et v�rification si correspond au jour courant
Boucle tant que l'user n'a pas rentre le bon jour en numerique la date du jour
script cr�er le 26/04/2016
La bonne r�ponse aurai �t� 26
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