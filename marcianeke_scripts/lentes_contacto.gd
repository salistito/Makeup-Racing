extends StaticBody2D


export(Color) var pintura
signal tool_selected

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "on_input_event")
	$Polygon2D.color = pintura



func on_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("tool_selected", pintura)
#		get_parent().selected_color = pintura
#		#$cuerpo.color = Color(get_parent().color)
#		print("aaaa")
#		print(get_parent().selected_color)
