extends CharacterBody2D

const SPEED = 200
var direction

func _ready():
	direction = Vector2(1,0)
	$AnimationPlayer.play("Idle")

func _physics_process(_delta):
	if get_slide_collision_count()>0:
		var colision = get_slide_collision(0)
		direction = direction.bounce(colision.get_normal())
		
	velocity = SPEED*direction

	move_and_slide()
