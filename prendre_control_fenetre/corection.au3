;/////////////////////////////////////
;Libell�  : Tutoriel Site Du Z�ro
;Auteur   : Malossane Timoth�e
;Fonction : Jouons avec le Bloc-Notes
;Date     : 18/09/2011
;//////////////////////////////////////

HotKeySet("^q","quitter") ; Si on appuie sur Ctrl+Q , on ferme le jeu
Global $quitter = false,$nbEssai = 0 ; D�claration des variables globales

If @OSBuild >= 5513 Then ;Si Windows Vista ou sup�rieur, on agrandit le champ de recherche pour s'adapter au style AERO.
        $interval = 70
Else
        $interval = 30
EndIF

$Pid = Run("notepad.exe") ; On lance le bloc-notes
$Handle = WinWaitActive("[CLASS:Notepad]");On attend qu'il soit bien lanc�.
Send("Ceci est un jeu cr�� pour le tutoriel du SiteDuZero par timmalos."&@CRLF)
Send("Le but est simple : fermer cette fen�tre !"&@CRLF)
Send("Si tu n'y arrive pas, appuie sur Ctrl+Q, nous t'aiderons"&@CRLF)


While Not $quitter ; Tant que l'utilisateur n'a pas appuy� sur Ctrl+q

        ;On r�cup�re les coordonn�es de notre fen�tre.
        $Fenetre = WInGetPos("[CLASS:Notepad]") ;WinGetPos renvoie un tableau [X, Y, Largeur, Hauteur]

        ;On calcule les coordonn�es de la croix rouge.
        $FenetreX1 = $Fenetre[0]+ $Fenetre[2]-$interval
        $FenetreX2 = $Fenetre[0]+ $Fenetre[2]
        $FenetreY1 = $Fenetre[1]
        $FenetreY2 = $Fenetre[1]+ 30

        ;On r�cup�re les coordonn�es de la souris.
        $Souris = MouseGetPos()

        If ($Souris[0] >= $FenetreX1 AND $Souris[0] <= $FenetreX2) AND ($Souris[1] >= $FenetreY1 AND $Souris[1] <= $FenetreY2)Then
                $NbEssai +=1
                WinMove("[CLASS:Notepad]","",Random(1,@DesktopWidth-$Fenetre[2],1),Random(1,@DesktopHeight-$Fenetre[3],1),$Fenetre[2],$Fenetre[3]) ; On bouge la fen�tre al�atoirement
                WinSetTitle("[CLASS:Notepad]", "", "C'etait ton essai n� "&$NbEssai&". Essaye encore ! (Ctrl+q pour abandonner et quitter.)") ; On change le titre.
        EndIf

        Sleep(200)
WEnd

;Si on arrive l�, c'est que l'utilisateur a appuy� sur Ctrl+q
Send("Tu t'avoues vaincu ?, je vais la fermer pour toi !"&@CRLF)
Sleep(2000)
ProcessClose($pid)


Func quitter()
        $quitter = True
EndFunc