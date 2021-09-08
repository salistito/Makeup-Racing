extends RigidBody2D

export var SPEED = 60

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		$r_wheel.angular_velocity = SPEED
		$l_wheel.angular_velocity = SPEED
		
	elif Input.is_action_pressed("ui_down"):
		$r_wheel.angular_velocity = -SPEED
		$l_wheel.angular_velocity = -SPEED
		
	elif Input.is_action_pressed("ui_right"):
		angular_velocity = 3
		
	elif Input.is_action_pressed("ui_left"):
		angular_velocity = -3
		
		
