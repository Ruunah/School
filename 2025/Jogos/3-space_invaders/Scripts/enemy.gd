extends CharacterBody2D

var direction
var prefab
var SPEED = 200
var hit=0

func death():
	SPEED=0
	$AnimationPlayer.play("Explosion")

func _ready():
	direction = Vector2(1,0)
	prefab = preload("res://Prefabs/e_bullet.tscn")
	$Timer.wait_time=randf_range(2, 5)
	$Timer.start()

func _physics_process(_delta):
	if $Timer.is_stopped():
		var bullet = prefab.instantiate()
		get_tree().get_root().add_child(bullet)
		bullet.position = position+Vector2(0, 25)
		$Timer.start()
	if get_slide_collision_count()>0:
		var colision = get_slide_collision(0)
		direction = direction.bounce(colision.get_normal())
	if hit>=1:
		death()
	velocity = SPEED*direction

	move_and_slide()
