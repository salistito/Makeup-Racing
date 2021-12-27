extends RigidBody2D

signal color_selected
signal click_boton

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "on_input_event")
	
	
	Manager.boton = self
	
	connect("click_boton", Manager.nivel , "remove_task")



func on_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		emit_signal("click_boton")
		print("mandamos señal")
		print("mandamos señal")
		print("mandamos señal")
		print("mandamos señal")
		print("mandamos señal")
		print("mandamos señal")
		Manager.auto.locura()
		
		
