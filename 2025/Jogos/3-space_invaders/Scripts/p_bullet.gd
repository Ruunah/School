extends CharacterBody2D

func _physics_process(_delta):
	if get_slide_collision_count()>0:
		var colision=get_slide_collision(0).get_collider()
		if colision.name == "Walls":
			queue_free()
		if colision.is_in_group("Enemy"):
			colision.hit=1
			queue_free()
	velocity.y = -300
	move_and_slide()
