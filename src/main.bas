#include "fbgfx.bi"
Using FB

ScreenRes 780,600,32
WindowTitle "Basic Snake"

Const CellSize = 30

Const Rows = 26
Const Cols = 26

Dim Shared As Single player_x,player_y,player_speed

player_x = 0
player_y = 0
player_speed = 30
Const player_size = CellSize

Sub HandleUserInput(ByRef player_x As Single, ByRef player_y As Single,ByRef player_speed As Single)
If MultiKey(SC_LEFT) Then
    player_x -= player_speed
ElseIf MultiKey(SC_RIGHT) Then
    player_x += player_speed
ElseIf MultiKey(SC_UP) Then
    player_y -= player_speed
ElseIf MultiKey(SC_DOWN) Then
    player_y += player_speed
End If


End Sub

Sub DrawPlayer(player_x as Integer,player_y as Integer,size as Integer)

'' von player standort aus linie zeichnen
Line(player_x ,player_y)-(player_x + player_size, player_y + player_size), RGB(0,255,0), BF

End Sub

Sub DrawGrid(row as Integer,col as Integer,size as Integer)
Dim xpos as Integer
Dim ypos as Integer

For y As Integer = 0 To row
    For x As Integer = 0 To col
        xpos = x * size '' Pixelposition berechnen
        ypos = y * size '' Pixelposition berechnen
        Line (xpos ,ypos  )-(size,size), RGB(255,255,255), B
    Next
Next

End Sub

Do
Screenlock
Cls RGB(0,0,0)
DrawPlayer(player_x,player_y,player_size)
HandleUserInput(player_x,player_y,player_speed)
DrawGrid(Rows,Cols,CellSize)
Screenunlock



Sleep 16

Loop Until MultiKey(SC_ESCAPE)
