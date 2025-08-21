extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var Score = 0

func Death():
	$AnimationPlayer.play("Death")

func _physics_process(delta: float):
	if "flap"==$AnimationPlayer.current_animation: 
		if not is_on_floor():
			velocity += get_gravity() * delta
			rotation_degrees=-10

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			$AnimationPlayer.play("flap")
	else: 
		if not is_on_floor():
			velocity += get_gravity() * delta
			if rotation_degrees<=45:
				rotation+=0.1
					
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			$AnimationPlayer.play("flap")
	
	if get_slide_collision_count()>0:
		var collider = get_slide_collision(0)
		if collider.get_collider().name == "Death_Barrier":
			$AnimationPlayer.play("Death")
		elif collider.get_collider().name == "Checker":
			Score+=1
			collider.get_collider().queue_free()
	move_and_slide()
