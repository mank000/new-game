extends Area2D

var coin = 0
@onready var g_m = %gm

func _on_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		g_m.call("add_point")
		queue_free()
		
