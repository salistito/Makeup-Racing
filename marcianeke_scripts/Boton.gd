extends RigidBody2D

signal color_selected

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "on_input_event")



func on_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		Manager.auto.locura()
