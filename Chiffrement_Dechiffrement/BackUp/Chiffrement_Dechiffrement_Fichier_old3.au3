#CS
	Fichier Principale NOM : CHifrement Dechifrement
	Accompagner de : GUI_Chiffrement_Dechiffrement
	Plateforme Windows 32 bit par default

	Doc2rue
	Le 28/04/2016
#CE
#include <ButtonConstants.au3>
#include <MsgBoxConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Cryp.au3>
#include "GUI_Chiffrement_Dechiffrement.au3"

Global $SourceFile = "" ; Si la personne clique sur Chiffer sans avoir choisi un fichier avant


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

			;Case $chkBox_fichier
			;Case $chkBox_texte
			;Case $INPUT_password
			;Case $INPUT_algorithme
		Case $BUTON_chiffrer
			If ($chkBox_fichier & & $SourceFile)
				chiffrer(GUICtrlRead($INPUT_algorithme), GUICtrlRead($INPUT_password), 1)
			ElseIf ($chkBox_texte & & $INPUT_text)
				chiffrer(GUICtrlRead($INPUT_algorithme, GUICtrlRead($INPUT_password), 2)
			Else
				MsgBox(64, "Erreur Info", "Vous n'avez pas remplie tous les champs necessaire", 2)
			EndIf
			Case $BUTON_dechifrer
				If ($chkBox_fichier & & $SourceFile)
					dechiffrer(GUICtrlRead($INPUT_algorithme), GUICtrlRead($INPUT_password), 1)
				ElseIf ($chkBox_texte & & $INPUT_text)
					dechiffrer(GUICtrlRead($INPUT_algorithme, GUICtrlRead($INPUT_password), 2)
				Else
					MsgBox(64, "Erreur Info", "Vous n'avez pas remplie tous les champs necessaire", 2)
					;Case $INPUT_text
				Case $BUTON_parcourir
					$SourceFile = FileOpenDialog("Parcourir", @DesktopDir, "Tous (*.*)")
					$sFileOpenDialog = StringReplace($SourceFile, "|", @CRLF)
					MsgBox($MB_SYSTEMMODAL, "", "You chose the following files:" & @CRLF & $sFileOpenDialog)
			EndSwitch
		WEnd

		chiffrer($algo, $password, $type)
		If ($type == 2)
			_Crypt_EncryptData($GUICtrlRead($INPUT_text), $password, $algo)
		Else
			_Crypt_EncryptFile(GUICtrlRead($SourceFile), $password, $algo)
		EndIf

	EndFunc   ;==>

	dechiffrer($algo, $password, $type)
	If ($type == 2)
		_Crypt_DecryptData(GUICtrlRead($INPUT_text), $password, $algo)
	Else
		Switch _Crypt_DecryptFile(GUICtrlRead($SourceFile), $password, $algo)
			Case True
				MsgBox(64, "Reussite", "Votre fichier à bien été décrypté", 2)
			Case False, @error
				MsgBox(64, "Erreur", @error, 2)
			Case >= 500
				MsgBox(64, "Erreur", "Failled to decrypt piece", 2)
			Case >= 400
				MsgBox(64, "Erreur", "Failled to decrypt final piece", 2)
			Case >= 10
				MsgBox(64, "Erreur", "Failed to create key", 2)
			Case 2
				MsgBox(64, "Erreur", "Failed to open source file", 2)
			Case 3
				MsgBox(64, "Erreur", "Failed to open destination file", 2)
		EndSwitch
	EndIf
EndFunc   ;==>
