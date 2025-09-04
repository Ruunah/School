extends Node2D

var Played:bool
var High_Score:int
var Last_Score:int
const saverIO = preload("res://Scripts/saveIO.gd")


func quit():
	var save_list = [Played, High_Score, Last_Score]
	saverIO.save(save_list)
	get_tree().quit()

func _ready():
	var result = saverIO.load("res://save.txt")
	Played = result[0]
	High_Score = result[1]
	Last_Score = result[2]

func _process(_delta):
	$ScoreLabel.text = ("High_Score:"+str(High_Score)+"\nLast_Score:"+str(Last_Score))
	
