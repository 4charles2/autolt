#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

#cs ----------------------------------------------------------------------------

        AutoIt Version : 3.3.6.0
        Auteur:         Malossane Timothée

        Fonction du Script :
        Tutoriel 'La Programmation avec Autoit'
        TP sur les GUIs, Logiciel de cryptage.

#ce ----------------------------------------------------------------------------
Global $SourceFile = ''; Initialisation, si la personne clique sur le bouton d'encryption avant d'avoir choisi un fichier
Global $algo

#Region ### START Koda GUI section ### Form=
Global $Form1_1 = GUICreate("TP_Cryptage Par Malossane timothée", 629, 388, 204, 116)
Global $Group1 = GUICtrlCreateGroup("Que voulez vous crypter?", 32, 16, 177, 89)
Global $Radio1 = GUICtrlCreateRadio("Un fichier", 64, 40, 113, 17)
Global $Radio2 = GUICtrlCreateRadio("Un Texte", 64, 64, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Group2 = GUICtrlCreateGroup("Cryptage d'un Texte", 32, 112, 569, 193)
Global $Edit1 = GUICtrlCreateEdit("", 72, 136, 473, 161)
GUICtrlSetData(-1, "Texte")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Group3 = GUICtrlCreateGroup("Cryptage d'un fichier", 32, 312, 569, 65)
Global $Button1 = GUICtrlCreateButton("Parcourir", 56, 336, 113, 25, $WS_GROUP)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Label1 = GUICtrlCreateLabel("Chemin du fichier :", 176, 328, 418, 36)
Global $Group4 = GUICtrlCreateGroup("Options", 224, 16, 377, 89)
Global $Input1 = GUICtrlCreateInput("", 312, 32, 121, 21, BitOR($ES_CENTER,$ES_PASSWORD,$ES_AUTOHSCROLL))
Global $Label2 = GUICtrlCreateLabel("Mot de passe :", 240, 32, 77, 17)
Global $Button2 = GUICtrlCreateButton("Encrypter", 240, 64, 177, 33, $WS_GROUP)
Global $Button3 = GUICtrlCreateButton("Decrypter", 424, 64, 169, 33, $WS_GROUP)
Global $Label3 = GUICtrlCreateLabel("Algorithme :", 440, 32, 59, 17)
Global $Combo1 = GUICtrlCreateCombo("RC4", 504, 32, 89, 25)
GUICtrlSetData(-1, "3DES|AES 128|AES 192|AES 256|DES|RC2")

GUICtrlCreateGroup("", -99, -99, 1, 1)

GUISetState(@SW_SHOW)
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Radio1 ; Si on crypte un fichier
                        GUICtrlSetState($Group2,$GUI_DISABLE)
                        GUICtrlSetState($edit1,$GUI_DISABLE)
                        GUICtrlSetState($Group3,$GUI_ENABLE)
                        GUICtrlSetState($Button1,$GUI_ENABLE)
                        GUICtrlSetState($Label1,$GUI_ENABLE)
                Case $Radio2 ; Si on crypte un texte
                        GUICtrlSetState($Group2,$GUI_ENABLE)
                        GUICtrlSetState($edit1,$GUI_ENABLE)
                        GUICtrlSetState($Group3,$GUI_DISABLE)
                        GUICtrlSetState($Button1,$GUI_DISABLE)
                        GUICtrlSetState($Label1,$GUI_DISABLE)
                Case $Button1 ; On choisit un fichier pour le crypter.
                        $SourceFile = FileOpenDialog("TP_cryptage",@ScriptDir&'\',"Tous (*.*)",9)
                        GUICtrlSetData($Label1,"Chemin du fichier : "& $SourceFile)
                Case $Button2 ; Si on clique sur le boutton Encrypter
                        _algo()
                        If _IsChecked($Radio1) Then ; On crypte un fichier
                                If $SourceFile = '' Then
                                        MsgBox(0,"TP_Cryptage",'Veuillez selectionner un fichier')
                                ElseIf _Crypt_EncryptFile($SourceFile,$SourceFile&".crypt",GuiCtrlRead($Input1),$algo) Then
                                        MsgBox(0,"TP_Cryptage",'OK ! , Votre fichier a été crypté')
                                EndIf
                        Else ; On crypte le texte
                                $CryptData = _Crypt_EncryptData(GuiCtrlRead($edit1),GuiCtrlRead($Input1),$algo)
                                GUICtrlSetData($edit1,BinaryToString($CryptData))
                        EndIf
                Case $Button3 ; Si on clique sur le boutton Encrypter
                        _algo()
                        If _IsChecked($Radio1) Then ; On crypte un fichier
                                If $SourceFile = '' Then
                                        MsgBox(0,"TP_Cryptage",'Veuillez selectionner un fichier')
                                ElseIf StringRight($SourceFile,6) <> '.crypt' Then
                                        MsgBox(0,"TP_Cryptage",'Veuillez selectionner un fichier crypté.')
                                ElseIf _Crypt_DecryptFile($SourceFile,StringLeft($SourceFile,StringLen($SourceFile)-6),GuiCtrlRead($Input1),$algo) Then
                                        ;StringLeft($SourceFile,StringLen($SourceFile)-6) Va supprimer le .crypt a la fin de notre nom de fichier. On supprime les 6 derniers caractères.
                                        MsgBox(0,"TP_Cryptage",'OK ! , Votre fichier a été décrypté')
                                Else
                                        MsgBox(0,"TP_Cryptage","OK ! , Votre fichier n'a pas pu être decrypté.")
                                EndIf
                        Else ; On crypte le texte
                                $CryptData = _Crypt_DecryptData(GuiCtrlRead($edit1),GuiCtrlRead($Input1),$algo)
                                GUICtrlSetData($edit1,BinaryToString($CryptData))
                        EndIf
        EndSwitch
WEnd


Func _algo();Definit la variable selon l'algorithme choisi.
                Switch GUICtrlRead($Combo1)
                Case "3DES"
                    $algo = $CALG_3DES
                Case "DES"
                    $algo = $CALG_DES
                Case "RC2"
                    $algo = $CALG_RC2
                Case "RC4"
                    $algo = $CALG_RC4
                Case "AES 128"
                    If @OSVersion = "WIN_2000" Then
                        MsgBox(16, "Error", "Sorry, this algorithm is not available on this system!")
                        $algo = $CALG_3DES
                    EndIf
                    $algo = $CALG_AES_128
                Case "AES 192"
                    If @OSVersion = "WIN_2000" Then
                        MsgBox(16, "Error", "Sorry, this algorithm is not available on this system!")
                        $algo = $CALG_3DES
                    EndIf
                    $algo = $CALG_AES_192
                Case "AES 256"
                    If @OSVersion = "WIN_2000" Then
                        MsgBox(16, "Error", "Sorry, this algorithm is not available on this system!")
                                                $algo = $CALG_3DES
                                        EndIf
                    $algo = $CALG_AES_256
            EndSwitch
EndFunc

;Func _IsChecked($control) --> Retourne 1 si le controle est checké, sinon 0
; On fait une comparaison de Bits entre la variable $GUI_CHECKED Et notre valeur de controle. Si le Bit correspondant à l'état checké vaut 1, alors notre BitAnd va renvoyé 1.
Func _IsChecked($control)
    Return BitAnd(GUICtrlRead($control),$GUI_CHECKED) = $GUI_CHECKED
EndFunc