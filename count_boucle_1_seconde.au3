#cs
Script pour voir combien de fois le programme fait le tour d'une boucle en 1 seconde
Doc2rue
#ce
Local $t = TimerInit(),$i = 0 ;Declaration des variables
While TimerDiff($t)<=1000 ;Boucle principale. Tant que le temps est inferieur � une seconde
   $i = $i + 1
WEnd
MsgBox(65, "boucle en 1 seconde", $i); affiche la valeur de i qui est �gal au nombre de boucle en 1 seconde
;Sur mon ordinateur c'est �gal � 335 987 mais diff�rent � chaque lancement