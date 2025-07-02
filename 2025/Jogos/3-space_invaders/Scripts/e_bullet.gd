extends CharacterBody2D
var hit=0
func _physics_process(_delta):
	if hit>=1:
		queue_free()
	if get_slide_collision_count()>0:
		var colision=get_slide_collision(0)
		if colision.get_collider().name == "Player":
			colision.get_collider().hp+=1
			queue_free()
		if colision.get_collider().name == "Walls":
			queue_free()
	velocity.y = 300
	move_and_slide()
