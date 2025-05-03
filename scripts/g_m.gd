extends Node

var score = 0
@onready var sl = $Label
func add_point():
	score += 1
	sl.text = str(score)
