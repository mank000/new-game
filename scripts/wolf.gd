extends CharacterBody2D

const SPEED := 100.0
const JUMP_VELOCITY := -200.0
const GRAVITY := 900.0  # гравитация, подбирай по размеру игры

@onready var target := get_node("/root/Game/PLAYER")

func _physics_process(delta: float) -> void:
	# Применяем гравитацию
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0  # сбрасываем вертикальную скорость, когда на земле

	if target:
		var direction = target.global_position - global_position

		# Горизонтальное движение
		if abs(direction.x) > 10:  # чтобы не дёргался на месте
			velocity.x = sign(direction.x) * SPEED
		else:
			velocity.x = 0

		# Прыжок, если цель выше на 20 пикселей
		if direction.y < -15 and is_on_floor():
			velocity.y = JUMP_VELOCITY

	move_and_slide()
