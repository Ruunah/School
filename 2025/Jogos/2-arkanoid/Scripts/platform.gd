extends CharacterBody2D
var hp=5
func _physics_process(_delta):
	match hp:
		5:
			$Color.color=Color(255, 255, 255)
		4:
			$Color.color=Color(255, 255, 127)
		3:
			$Color.color=Color(255, 255, 0)
		2:
			$Color.color=Color(255, 127, 0)
		1:
			$Color.color=Color(255, 0, 0)
		_:
			queue_free()
