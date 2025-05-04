extends Area2D

@onready var timer = $Timer  # если хочешь задержку перед завершением
var level_end_started := false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER" and not level_end_started:
		level_end_started = true
		print("LEVEL COMPLETE!")
		# Если нужна задержка — запускаем таймер
		if timer:
			timer.start()
		else:
			end_level()

func _on_timer_timeout() -> void:
	end_level()

func end_level() -> void:
	get_tree().change_scene_to_file("res://scenes/thanks_level.tscn")
