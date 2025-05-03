extends CharacterBody2D


const SPEED = 175.0
const JUMP_VELOCITY = -300.0


@onready var animated = $AnimatedSprite2D
@onready var sprite = $CollisionShape2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated.flip_h = false
	elif direction < 0:
		animated.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if is_on_floor():
		if direction == 0:
			animated.play("idle")
		else:
			animated.play("run")
	else:
		animated.play("jump")

	move_and_slide()
