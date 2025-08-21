extends Control

var pipe1
var pipe2
var checky
var check0
var posy
var dist

var prefab
var prefeb

func newpipe():
	var ret
	while true:
		posy = randf_range(128, 520)
		dist = randf_range(96, 256)
		pipe1=posy+dist/2
		pipe2=posy-dist/2
		checky = posy
		check0 = dist/64
		if pipe1<=568 and pipe2>=88:
			break
	ret=[pipe1, pipe2, checky, check0]
	return ret 

func _ready():
	prefab = preload("res://Prefabs/pipe.tscn")
	prefeb = preload("res://Prefabs/Checker.tscn")

func _process(_delta):
	if $"../Timer".is_stopped():
		var ret = newpipe()
		pipe1 = ret[0]
		pipe2 = ret[1]
		checky = ret[2]
		check0 = ret[3]
		
		var top = prefab.instantiate()
		get_tree().get_root().add_child(top)
		top.position = Vector2(1216, pipe1)
		
		var bottom = prefab.instantiate()
		get_tree().get_root().add_child(bottom)
		bottom.position = Vector2(1216, pipe2)
		bottom.flipV()
		
		var check = prefeb.instantiate()
		get_tree().get_root().add_child(check)
		check.scale = Vector2(1, check0)
		check.position = Vector2(1216, checky)
		
		$"../Timer".start()
