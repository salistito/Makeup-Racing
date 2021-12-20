extends StaticBody2D

export(Color) var pintura setget set_pintura
func set_pintura(value):
	pintura = value
	$labio_superior.modulate = pintura
	
export(String) var herramienta_seleccionada

var selected_color = Color("#fff8dc")
var selected_tool = "lentes de contacto"
export(String) var color
export(String) var TrueColor

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "on_input_event")
	$labio_superior.modulate = pintura



func on_input_event(viewport, event: InputEvent, shape_idx):
	print("intentamos")
	print(herramienta_seleccionada)
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT and herramienta_seleccionada == selected_tool:
		$labio_superior.modulate = selected_color
		TrueColor = color
		print("aaaa")
