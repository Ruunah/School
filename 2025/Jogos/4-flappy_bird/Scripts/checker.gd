extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta):
	if not $"../main".dead:
		velocity.x = -SPEED
		move_and_slide()
		if get_slide_collision_count()>0:
			var collider = get_slide_collision(0)
			if collider.get_collider().name == "Back":
				queue_free()
			elif collider.get_collider().name == "Player":
				collider.get_collider().Score+=1
				queue_free()
