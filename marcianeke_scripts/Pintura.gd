extends RigidBody2D

export(Color) var pintura
export(String) var color

signal color_selected

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "on_input_event")
	$botella_liquido.modulate = pintura



func on_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("color_selected", pintura, color)
#		get_parent().selected_color = pintura
#		#$cuerpo.color = Color(get_parent().color)
#		print("aaaa")
#		print(get_parent().selected_color)
