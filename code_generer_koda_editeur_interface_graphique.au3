#cs
Application test de l'editeur graphique koda
#ce

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=D:\Programmation\AutoIt3\SciTE\Koda\Forms\essaiCharles.kxf
Global $Form1 = GUICreate("My_apli", 331, 244, 713, 378)
Global $Button1 = GUICtrlCreateButton("OK", 24, 192, 105, 25)
Global $Button2 = GUICtrlCreateButton("Quitter", 168, 192, 145, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
 $nMsg = GUIGetMsg()
 Switch $nMsg
  Case $GUI_EVENT_CLOSE
   Exit

  Case $Button1
	 MsgBox(0,"info", "Vous avez apuyez sur ok",1);
  Case $Button2
	 MsgBox(0, "info", "Bonne journée", 1)
	 Exit
 EndSwitch
WEnd