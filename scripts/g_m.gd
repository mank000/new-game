extends Node

var score = 0

@onready var sl = get_node("/root/Game/CanvasLayer/Label")

func add_point():
	score += 1
	sl.text = str(score)
