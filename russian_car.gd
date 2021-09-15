extends RigidBody2D

export var SPEED = 60

var air_time = 12331230
var block = 0

func _ready():
	$Area2D.connect("body_entered",self, "on_body_entered")
	$tocar_suelo.connect("body_entered",self, "llegar_suelo")
	$tocar_suelo.connect("body_exited",self, "salir_suelo")
	
	Manager.auto = self

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up") and block == 0:
		$r_wheel.angular_velocity = SPEED
		$l_wheel.angular_velocity = SPEED
		
	if Input.is_action_pressed("ui_down") and block == 0:
		$r_wheel.angular_velocity = -SPEED
		$l_wheel.angular_velocity = -SPEED
		
	if Input.is_action_pressed("ui_right") and block == 0:
		angular_velocity = 3
		
	if Input.is_action_pressed("ui_left") and block == 0:
		angular_velocity = -3
		
func on_body_entered(body: Node):
	if Manager.maquillaje and Manager.maquillaje.has_method("randomizer"):
		Manager.maquillaje.randomizer()
		
		
func llegar_suelo(body: Node):
	print("entramos al suelo")
	var llegada = OS.get_ticks_msec() 
	if (llegada - air_time) >1500:
		print(llegada-air_time)
		if Manager.maquillaje and Manager.maquillaje.has_method("randomizer"):
			Manager.maquillaje.randomizer()
	air_time = 0
		
	
	
func salir_suelo(body: Node):
	print("saliendo del suelo")
	air_time = OS.get_ticks_msec() 
	
func locura():
	print("aplicando locura")
	Manager.principal.show_distraction()
	block = 1
	$r_wheel.angular_velocity = SPEED*7
	$l_wheel.angular_velocity = SPEED*7
	var t = Timer.new()
	t.set_wait_time(4)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	print("locura aplicada")
	block = 0
	Manager.principal.hide_distraction()
	
	

