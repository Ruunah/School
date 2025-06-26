extends CharacterBody2D

func _physics_process(_delta):
	if get_slide_collision_count()>0:
		var colision=get_slide_collision(0)
		if colision.get_collider().name == "Walls":
			queue_free()
		elif colision.get_collider().name == "Enemy":
			colision.$AnimationPlayer.play(Explosion)
			queue_free()
	velocity.y = -300
	move_and_slide()
