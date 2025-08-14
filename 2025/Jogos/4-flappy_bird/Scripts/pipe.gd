extends CharacterBody2D

const SPEED = 300.0

func flipV():
	rotation_degrees=180

func _physics_process(_delta):
	
	if get_slide_collision_count()>0:
		var colision = get_slide_collision(0)
		if colision.get_collider().name == "Back":
			queue_free()
	
	velocity.x = -SPEED
	move_and_slide()
