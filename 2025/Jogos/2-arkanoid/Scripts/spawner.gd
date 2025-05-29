extends Control

var prefab
var posx=96
var posy=104
var elapsed_time

func _ready():
	elapsed_time = 0
	prefab = preload("res://Prefab/platform.tscn")
	for i in range(5):
		for o in range(7):
			var platform = prefab.instantiate()
			get_tree().get_root().add_child.call_deferred(platform)
			platform.position=Vector2(posx, posy)
			posx+=160
		posx=96
		posy+=56

func _physics_process(delta):
	elapsed_time+=delta
	$Timer.text=str(float(int(elapsed_time*10))/10)
