extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float):
	if "flap"==$AnimationPlayer.current_animation: 
		if not is_on_floor():
			velocity += get_gravity() * delta
 			if rotation_degrees<=30:
				rotation-=0.1

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			$AnimationPlayer.play("flap")
	else: 
		if not is_on_floor():
			velocity += get_gravity() * delta
			if rotation_degrees<=90:
				rotation+=0.1
					
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			$AnimationPlayer.play("flap")
		
	move_and_slide()
