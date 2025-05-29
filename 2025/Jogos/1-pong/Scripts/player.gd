extends CharacterBody2D


const SPEED = 300.0
var points = 0


func _physics_process(_delta):
	if self.name=="p1":
		var direction := Input.get_axis("w", "s")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	if self.name=="p2":
		var direction := Input.get_axis("ui_up", "ui_down")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
