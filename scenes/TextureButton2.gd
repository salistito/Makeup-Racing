extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Manager.block4:
		self.disabled = true
	
	#if Manager.block2:
		#self.set_normal_texture(load("res://sprites/Niveles Inicio/Level3.png"))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
