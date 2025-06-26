extends CharacterBody2D

const SPEED = 300.0
var prefab

func _ready():
	prefab = preload("res://Prefabs/p_bullet.tscn")
	
func _physics_process(_delta):
	if Input.is_key_pressed(KEY_UP) and $Timer.is_stopped():
		var bullet = prefab.instantiate()
		get_tree().get_root().add_child(bullet)
		bullet.position = position+Vector2(0, -25)
		$Timer.start()
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
