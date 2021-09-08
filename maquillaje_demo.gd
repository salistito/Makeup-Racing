extends Node2D

onready var pinturas = $pinturas
onready var pintables = $pintables

func _ready():
	$CanvasLayer/HBoxContainer.hide()
	for pintura in pinturas.get_children():
		pintura.connect("color_selected", self, "set_selected_color")
	
func set_selected_color(col):
	for pintable in pintables.get_children():
		pintable.selected_color = col
