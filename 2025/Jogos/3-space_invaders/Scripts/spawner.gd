extends Control
var prefab
var anchor_x = 80
var x = 80
var y = 144
func _ready():
	prefab = preload("res://Prefabs/enemy.tscn")
	for v in range(4):
		for h in range(8):
			var enemy = prefab.instantiate()
			get_tree().get_root().add_child.call_deferred(enemy)
			enemy.position = Vector2(x, y)
			x+=64
		match v%2:
			0:
				anchor_x+=32
				x=anchor_x
				y+=64
			1:
				anchor_x-=32
				x=anchor_x
				y+=64
