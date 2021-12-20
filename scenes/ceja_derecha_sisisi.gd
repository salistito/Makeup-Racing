extends StaticBody2D

var color_parte setget colorear #colorear es el "setter" de esta variable
var color = 0
func colorear(col):
	$ceja.modulate = col
	color_parte = col
