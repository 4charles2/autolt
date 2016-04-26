#cs
Script pour récuperer la cle windows de son systeme
recuperer sur le forum www.autoitscript.fr topic en français
#ce
MsgBox(0, "", _WindowsGetProductKey())

Func _WindowsGetProductKey()
    Local $key = StringTrimLeft(RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\", "DigitalProductId"), 2)
    Local $keyOutput = ""
    Local $keyOffset = 52
    Local $i = 28
    Local $chars = "BCDFGHJKMPQRTVWXY2346789"
    Do
        Local $cur = 0
        Local $x = 14
        Do
            $cur = $cur * 256
            $cur = _WGPK_GetKey($key, $x + $keyOffset) + $cur
            _WGPK_SetKey($key, $x + $keyOffset, BitAND(Floor($cur / 24), 255))
            $cur = Mod($cur, 24)
            $x -= 1
        Until(Not($x >= 0))
        $i -= 1
        $keyOutput = StringMid($chars, $cur + 1, 1) & $keyOutput
        If (Mod(29-$i, 6) = 0) And ($i <> -1) Then
            $i -= 1
            $keyOutput = "-" & $keyOutput
        EndIf
    Until(Not($i >= 0))
    Return $keyOutput
EndFunc

Func _WGPK_GetKey($key, $offset)
    Return Dec(StringMid($key, $offset*2+1, 2))
EndFunc

Func _WGPK_SetKey(ByRef $key, $offset, $value)
    $key = StringLeft($key, $offset*2) & String(Hex($value, 2)) & StringTrimLeft($key, ($offset+1)*2)
EndFunc