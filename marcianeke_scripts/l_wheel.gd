extends RigidBody2D

onready var on_air_timer : Timer = get_node("./onAirTimer")
onready var _transitions: = {
	PARKED: [MOVING, AIR],
	MOVING: [PARKED, AIR],
	AIR: [MOVING],
}
const FLOOR_NORMAL := Vector2.UP

enum {
	PARKED,
	MOVING,
	AIR,
}

export var move_speed := 400.0
export var air_speed := 10.0
export var jump_force := 500.0

var _state: int = PARKED

var states_strings := {
	PARKED: "parked",
	MOVING: "moving",
	AIR: "air",
}

func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	var is_on_ground := state.get_contact_count() > 0 and int(state.get_contact_collider_position(0).y) >= int(global_position.y)
	
	var move_direction := get_move_direction()
	
	match _state:
		PARKED:
			if move_direction.x:
				print("MOVING")
				change_state(MOVING)
			elif is_on_ground and Input.is_action_just_pressed("jump"):
				print("JUMPING -> AIR")
				apply_central_impulse(Vector2.UP * jump_force)
				change_state(AIR)
				
		MOVING:
			if not move_direction.x:
				print("PARKED")
				change_state(PARKED)
			elif state.get_contact_count() == 0:
				print("AIR")
				change_state(AIR)
			elif is_on_ground and Input.is_action_just_pressed("jump"):
				print("JUMPING -> AIR")
				apply_central_impulse(Vector2.UP * jump_force)
				change_state(AIR)
			else:
				print("Hay un movimiento -> MOVING")
				state.linear_velocity.x = move_direction.x * move_speed
			
		AIR:
			if move_direction.x:
				print("Hay un movimiento en el AIRE WEBONG")
				state.linear_velocity.x += move_direction.x * air_speed
			if is_on_ground and on_air_timer.is_stopped():
				print("Yo no sabia que ibamos a caer aquí, tuve fé (QUEE!)")
				change_state(PARKED)
				
	
func change_state(target_state: int) -> void:
	if not target_state in _transitions[_state]:
		return
	_state = target_state
	enter_state()
	
func enter_state() -> void:
	match _state:
		PARKED:
			linear_velocity.x = 0
		AIR:
			# Prevents the state to change back to PARKED as ground is strill
			# detected one to two frames after getting air
			on_air_timer.start()
			return

func get_move_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
