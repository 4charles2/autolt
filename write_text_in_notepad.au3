#cs
Ecrire du texte dans l'application note pad
#ce
Run("notepad.exe")
WinWaitActive("Sans titre�- Bloc-notes")
Send("Salut Baby j'ai pris le control de ton ordinateur")
WinClose("Sans titre�- Bloc-notes")
;La ligne ci dessou active le fentre ouverte si focus � �t� changer apr�s la demande de fermeture
WinActivate("Bloc-notes", "Ne pas enregistrer")
;La touche ! pour simuler la touche alt et r signifie dans bloc note quitter sans enregistrer
Send("!r")