extends Node2D

onready var Montana1 = $Sprite
onready var Montana2 = $Sprite2
onready var Montana3 = $Sprite3
onready var Montana4 = $Sprite4
onready var Arbustos1 = $Sprite7
onready var Arbustos2 = $Sprite8

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Montana1.position.x += -1
	Montana3.position.x += -0.7
	Arbustos1.position.x += -0.4
	if Montana1.position.x < -2048:
		Montana1.position.x = 2048
	if Montana3.position.x < -2048:
		Montana3.position.x = 2048
	if Arbustos1.position.x< -2048:
		Arbustos1.position.x = 2048
	Montana2.position.x += -1
	Montana4.position.x += -0.7
	Arbustos2.position.x += -0.4
	if Montana2.position.x < -2048:
		Montana2.position.x = 2048
	if Montana4.position.x < -2048:
		Montana4.position.x = 2048
	if Arbustos2.position.x < -2048:
		Arbustos2.position.x = 2048
