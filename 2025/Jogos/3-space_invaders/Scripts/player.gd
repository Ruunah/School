extends CharacterBody2D

const SPEED = 300.0
var prefab
var hp

func _ready():
	prefab = preload("res://Prefabs/p_bullet.tscn")
	hp=0

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
	
	if hp<5 and hp>=0:
		$"../Control/Heart".frame=hp
	else:
		$"../Control/Heart".frame=5
		$AnimationPlayer.play("Death")
