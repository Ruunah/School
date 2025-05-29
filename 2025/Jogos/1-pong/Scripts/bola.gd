extends CharacterBody2D


const SPEED = 300
var direction

func _ready():
	direction = Vector2(1,1)

func _physics_process(_delta):
	if get_slide_collision_count()>0:
		var colision = get_slide_collision(0)
		direction = direction.bounce(colision.get_normal())
		if colision.get_collider().name=="g1":
				$"../p1".points+=1
				$"../Control/points1".text=str($"../p1".points)
				position = Vector2(576,324)
		elif colision.get_collider().name=="g2":
				$"../p2".points+=1
				$"../Control/points2".text=str($"../p2".points)
				position = Vector2(576,324)
		
	velocity = SPEED*direction

	move_and_slide()
