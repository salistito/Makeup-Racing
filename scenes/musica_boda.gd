extends Area2D

signal play_wedding

func _ready():
	Manager.nodo_nivel3 = self

func _on_Area2D_area_entered(area):
	print("nnnn")
	emit_signal("play_wedding")
