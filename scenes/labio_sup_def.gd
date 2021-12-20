extends StaticBody2D

var color_parte setget colorear #colorear es el "setter" de esta variable

func colorear(col):
	$labio_superior.modulate = col
	color_parte = col
