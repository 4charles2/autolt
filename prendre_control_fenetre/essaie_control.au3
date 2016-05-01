#include <MsgBoxconstants.au3>

$idPID = Run("Notepad")
Sleep(100)
$handle_active = WinGetHandle("[Class:Notepad]")
MsgBox(64, "Handle", $handle_active & "et le PID" & $idPID)
$hWnd = WinWait("[CLASS:Notepad]", "" ,10)
$posWnd = ControlGetPos($hWnd, "", $hWnd)
MsgBox(64, "", "pos du control : " & $posWnd[0] & "et " & $posWnd[1])
