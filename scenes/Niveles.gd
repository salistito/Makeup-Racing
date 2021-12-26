extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Nivel1_pressed():
	get_tree().change_scene("res://scenes/main1.tscn")
	
func _on_Nivel2_pressed():
	if not Manager.block2:
		get_tree().change_scene("res://scenes/main2.tscn")
	
func _on_Nivel3_pressed():
	get_tree().change_scene("res://scenes/main3.tscn")

func _on_Nivel4_pressed():
	get_tree().change_scene("res://scenes/main4.tscn")


func _on_Button_pressed():
	Manager.block2 = false
	Manager.block3 = false
	Manager.block4 = false
