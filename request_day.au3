#cs
Demande du jour a l'utilisateur et vérification si correspond au jour courant
#ce
$input = InputBox("verif day", "Le combien somme nous aujourd'hui?")
If $input = @MDAY Then
   MsgBox(0, "reponse", "bravo vous avez trouvez le bon jour")
Else
   MsgBox(0, "reponse", "Vous n'avez pas trouvez le bon jour dsl recommencer")
EndIf