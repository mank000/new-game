extends CharacterBody2D

const SPEED := 100.0
const JUMP_VELOCITY := -200.0
const GRAVITY := 900.0

@onready var target := get_node("/root/Game/PLAYER")
@onready var obstacle_ray := $RayCast2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	if target:
		var direction = target.global_position - global_position

		if abs(direction.x) > 10:
			velocity.x = sign(direction.x) * SPEED
			obstacle_ray.scale.x = sign(direction.x)  # зеркалируем луч
		else:
			velocity.x = 0

		# Прыгаем, если впереди стена
		if obstacle_ray.is_colliding() and is_on_floor():
			velocity.y = JUMP_VELOCITY

	move_and_slide()
