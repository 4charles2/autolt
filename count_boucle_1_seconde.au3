#cs
Script pour voir combien de fois le programme fait le tour d'une boucle en 1 seconde
Doc2rue
#ce
Local $t = TimerInit(),$i = 0 ;Declaration des variables
While TimerDiff($t)<=1000 ;Boucle principale. Tant que le temps est inferieur à une seconde
   $i = $i + 1
WEnd
MsgBox(65, "boucle en 1 seconde", $i); affiche la valeur de i qui est égal au nombre de boucle en 1 seconde
;Sur mon ordinateur c'est égal à 335 987 mais diffèrent à chaque lancement