extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var Score = 0
var dead = false

func Death():
	$AnimationPlayer.play("Death")
	$"..".dead = true

func scene_change():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	

func _physics_process(delta: float):
	if not $"..".dead:
		move_and_slide()
		if "flap"==$AnimationPlayer.current_animation: 
			if not is_on_floor():
				velocity += get_gravity() * delta
				rotation_degrees=-10

			# Handle flap.
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
				Death()
