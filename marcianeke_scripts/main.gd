extends Node2D

#onready var viewport_maquillaje = $Control/HBoxContainer/ViewportContainer2/parte_maquillaje
#
func _ready():
	Manager.principal = self
	$CanvasLayer2/Sprite.visible = false
#
func show_distraction():
	$CanvasLayer2/Sprite.visible = true
	
func hide_distraction():
	$CanvasLayer2/Sprite.visible = false


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Niveles.tscn")
