extends CharacterBody2D

const FRICTION = 25
const ACCELRATION = 20
const MAX_SPEED = 80

var vel = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		vel += input_vector * ACCELRATION * delta
		vel = vel.limit_length(MAX_SPEED * delta)
	else:
		vel = vel.move_toward(Vector2.ZERO, FRICTION * delta)
		
	
	move_and_collide(vel)
