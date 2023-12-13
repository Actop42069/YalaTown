extends CharacterBody2D

const FRICTION = 300
const ACCELRATION = 350
const MAX_SPEED = 100

func _ready():
	motion_mode = MOTION_MODE_FLOATING

var vel = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		vel = vel.move_toward(input_vector * MAX_SPEED, ACCELRATION * delta)
	else:
		vel = vel.move_toward(Vector2.ZERO, FRICTION * delta)
		move_and_slide()
	move_and_collide(vel * delta)
	
	
	
