extends StaticBody2D




# Called when the node enters the scene tree for the first time.



func on_input_event(viewport, event: InputEvent, shape_idx):
	print("asdasd")
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		print("asdasd")
		for elemento in $pintables.get_children():
			
			elemento.get_node("Polygon2d").color = Color("#130d5f")
