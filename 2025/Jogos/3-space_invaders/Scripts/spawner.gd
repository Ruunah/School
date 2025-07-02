extends Control
var prefab
var poshh = 80
var posv = 144
var posh = 80
func _ready():
	prefab = preload("res://Prefabs/enemy.tscn")
	for i in range(2):
		for v in range(2):
			for h in range(8):
				var enemy = prefab.instantiate()
				get_tree().get_root().add_child.call_deferred(enemy)
				enemy.position = Vector2(posh, posv)
				posh+=64
			posv+=32
			poshh+=32
			posh=poshh
		posv+=32
