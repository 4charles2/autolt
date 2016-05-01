#CS
Fichier Principale NOM : CHifrement Dechifrement
Accompagner de : Chiffrement_Dechiffrement_Fichier
Plateforme Windows 32 bit par default

Doc2rue
Le 28/04/2016
#CE
#Region ### START Koda GUI section ### Form=d:\programmation\autoit3\scite\koda\forms\tp_chiffrement.kxf
$chifrement = GUICreate("Chiffrement", 589, 367, 196, 166); Creation de la fenetre

$GRP_what_chiffrement = GUICtrlCreateGroup("Que Voulez vous chiffrer ?", 8, 8, 193, 81);1er groupe Choix du type de contenu à chiffrer
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$chkBox_fichier = GUICtrlCreateRadio("Un fichier", 40, 32, 65, 17)
$chkBox_texte = GUICtrlCreateRadio("Un Texte", 40, 56, 113, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$GRP_options = GUICtrlCreateGroup("Options : ", 216, 8, 361, 81); 2em groupe Lancer le chifrement ou defrichement et choix de l'algorithme
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$label_password = GUICtrlCreateLabel("Mot de Passe : ", 224, 24, 93, 17)
$INPUT_password = GUICtrlCreateInput("********", 312, 24, 89, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD))
$label_algorithme = GUICtrlCreateLabel("Algorithme : ", 408, 24, 75, 17)
$INPUT_algorithme = GUICtrlCreateCombo("", 496, 24, 65, 25)
GUICtrlSetData(-1, "RC4|3DES|AES 128|AES 192|AES 256|DES|RC2|RC5|SHA_256", "SHA_256")
$BUTON_chiffrer = GUICtrlCreateButton("Chiffrer", 224, 48, 163, 25)
$BUTON_dechifrer = GUICtrlCreateButton("Dechifrer", 392, 48, 179, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$GRP_chiffre_text = GUICtrlCreateGroup("Chiffrer un Texte : ", 8, 96, 569, 185);3em groupe Chiffer un text
$INPUT_text = GUICtrlCreateEdit("", 56, 120, 473, 129)
GUICtrlSetData(-1, "INPUT_text")
GUICtrlCreateGroup("", -99, -99, 1, 1)

$GRP_chiffrer_fichier = GUICtrlCreateGroup("Chiffrer un Fichier : ", 8, 288, 569, 65);4em groupe Chiffrer un fichier
$BUTON_parcourir = GUICtrlCreateButton("Parcourir", 24, 312, 123, 33)
$label_fichier_dir = GUICtrlCreateLabel("Chemin du Fichier :", 168, 312, 94, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###