extends RigidBody2D

onready var on_air_timer : Timer = $onAirTimer
onready var _transitions: = {
	ON_FLOOR: [ON_AIR],
	ON_AIR: [ON_FLOOR],
}
const FLOOR_NORMAL := Vector2.UP

enum {
	ON_FLOOR,
	ON_AIR,
}

export var MOVE_SPEED = 50
export var JUMP_FORCE := 5000
var air_time = 12331230
var block = 0
var wheels_on_floor = true

var _state: int = ON_FLOOR

var states_strings := {
	ON_FLOOR: "on_floor",
	ON_AIR: "on_air",
}

func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	var chasis_contact := state.get_contact_count() > 0 and int(state.get_contact_collider_position(0).y) >= int(global_position.y)
	match _state:
		ON_FLOOR:
			if (chasis_contact or wheels_on_floor) and Input.is_action_just_pressed("jump"):
				print("JUMPING -> ON_AIR")
				print("EN EL AIRE WEBONG")
				apply_central_impulse(-transform.y * JUMP_FORCE)
				change_state(ON_AIR)

		ON_AIR:
			if (chasis_contact or wheels_on_floor) and on_air_timer.is_stopped():
				print("ON_FLOOR")
				print("Yo no sabia que ibamos a caer aquí, tuve fé (QUEE!)")
				change_state(ON_FLOOR)

func change_state(target_state: int) -> void:
	if not target_state in _transitions[_state]:
		return
	_state = target_state
	enter_state()

func enter_state() -> void:
	match _state:
		ON_AIR:
			# Prevents the state to change back to PARKED as ground is strill
			# detected one to two frames after getting air
			on_air_timer.start()
			return
			
			
#################################################################################			
			
			
func _ready():
	$car_Area2D.connect("body_entered", self, "on_body_entered")
	#$Area2D.connect("body_entered",self, "on_body_entered")
	$tocar_suelo.connect("body_entered",self, "llegar_suelo")
	$tocar_suelo.connect("body_exited",self, "salir_suelo")

	Manager.auto = self

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up") and block == 0:
		$r_wheel.angular_velocity = MOVE_SPEED
		$l_wheel.angular_velocity = MOVE_SPEED

	if Input.is_action_pressed("ui_down") and block == 0:
		$r_wheel.angular_velocity = -MOVE_SPEED
		$l_wheel.angular_velocity = -MOVE_SPEED

	if Input.is_action_pressed("ui_right") and block == 0:
		angular_velocity = 3

	if Input.is_action_pressed("ui_left") and block == 0:
		angular_velocity = -3


func on_body_entered(body: Node):
	if Manager.maquillaje and Manager.maquillaje.has_method("randomizer"):
		Manager.maquillaje.randomizer()


func llegar_suelo(body: Node):
	print("entramos al suelo")
	wheels_on_floor = true
	var llegada = OS.get_ticks_msec() 
	if (llegada - air_time) >1500:
		print(llegada-air_time)
		#if Manager.maquillaje and Manager.maquillaje.has_method("randomizer"):
			#Manager.maquillaje.randomizer()
	air_time = 0



func salir_suelo(body: Node):
	print("saliendo del suelo")
	wheels_on_floor = false
	air_time = OS.get_ticks_msec() 

func locura():
	print("aplicando locura")
	Manager.principal.show_distraction()
	block = 1
	$r_wheel.angular_velocity = MOVE_SPEED*7
	$l_wheel.angular_velocity = MOVE_SPEED*7
	var t = Timer.new()
	t.set_wait_time(4)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	print("locura aplicada")
	block = 0
	Manager.principal.hide_distraction()
	
	
