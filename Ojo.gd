extends StaticBody2D


export(Color) var pintura
export(String) var herramienta_seleccionada

var selected_color = Color("#fff8dc")
var selected_tool = "lentes de contacto"
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "on_input_event")
	$Polygon2D.color = pintura



func on_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT and herramienta_seleccionada == selected_tool:
		$Polygon2D.color = selected_color
		print("aaaa")
