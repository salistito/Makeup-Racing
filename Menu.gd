extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$MenuLayer/VBoxContainer/VBoxContainer2/Start_Button.grab_focus()
	$MenuLayer/VBoxContainer2/Start_Button.grab_focus()
	if not MenuMusic.playing:
		MenuMusic.play()

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Niveles.tscn")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://scenes/Instrucciones.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
