extends Node2D

var text

var PlayedNow:bool

var Played:bool
var High_Score:int
var Last_Score:int

@onready var saveIO = $menu/SaveIO

func update():
	if PlayedNow == true:
		text[0] = "You Died"
		text[2] = "Play Again"
	if Last_Score >= High_Score:
		High_Score = Last_Score
	text = ["Flappy Bird", (("High_Score:"+(str(High_Score) if High_Score else "0")+"\nLast_Score:"+(str(Last_Score) if Last_Score else "0"))), "Play", "Exit"]
	$menu/Main_Text.text = text[0]
	$menu/Secondary_Text.text = text[1]
	$menu/Button1.text = text[2]
	$menu/Button2.text = text[3]

func _ready():
	PlayedNow = 0
	var result = saveIO.load("res://save.json")
	Played = result[0]
	High_Score = result[1]
	Last_Score = result[2]
	text = ["Flappy Bird", (("High_Score:"+(str(High_Score) if High_Score else "0")+"\nLast_Score:"+(str(Last_Score) if Last_Score else "0"))), "Play", "Exit"]

func play():
	if not has_node("main"):
		Played = true
		var scene = preload("res://Scenes/main.tscn").instantiate()
		scene.name = "main"
		add_child(scene)
		for child in get_children():
			if child.name != "main":
				child.hide()

func quit():
	var save_list = [Played, High_Score, Last_Score]
	saveIO.save(save_list, "res://save.json")
	get_tree().quit()
