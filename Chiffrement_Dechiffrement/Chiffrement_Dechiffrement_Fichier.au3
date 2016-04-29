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
#include "GUI_Chiffrement_Dechiffrement.au3"


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $chkBox_fichier
		Case $chkBox_texte
		Case $INPUT_algorithme
		Case $BUTON_chiffrer
		Case $BUTON_dechifrer
		Case $INPUT_text
		Case $BUTON_parcourir
			$SourceFile = FileOpenDialog("Parcourir", @DesktopDir, "Tous (*.*)")
			$sFileOpenDialog = StringReplace($SourceFile, "|", @CRLF)
			MsgBox($MB_SYSTEMMODAL, "", "You chose the following files:" & @CRLF & $sFileOpenDialog)

	EndSwitch
	Sleep(10)
WEnd
