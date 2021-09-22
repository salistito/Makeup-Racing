extends StaticBody2D

var color_parte setget colorear #colorear es el "setter" de esta variable

func colorear(col):
	$Polygon2D.color = col
	color_parte = col
