extends CharacterBody2D


const SPEED = 300
var direction

func _ready():
	direction = Vector2(1,1)

func _physics_process(_delta):
	if get_slide_collision_count()>0:
		var colision = get_slide_collision(0)
		direction = direction.bounce(colision.get_normal())
		if colision.get_collider().name=="bad":
				position=$"../Player".position+Vector2(0,-10)
		if colision.get_collider().is_in_group("Platform"):
			colision.get_collider().hp-=2
	velocity = SPEED*direction

	move_and_slide()
