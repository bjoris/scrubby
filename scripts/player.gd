extends CharacterBody2D

const MOVE_SPEED := 190.0
const ROOM_MIN := Vector2(50.0, 50.0)
const ROOM_MAX := Vector2(910.0, 490.0)

func _physics_process(_delta: float) -> void:
	var direction := Vector2(
		float(Input.is_physical_key_pressed(KEY_PHYSICAL_D) or Input.is_key_pressed(KEY_RIGHT)) - float(Input.is_physical_key_pressed(KEY_PHYSICAL_A) or Input.is_key_pressed(KEY_LEFT)),
		float(Input.is_physical_key_pressed(KEY_PHYSICAL_S) or Input.is_key_pressed(KEY_DOWN)) - float(Input.is_physical_key_pressed(KEY_PHYSICAL_W) or Input.is_key_pressed(KEY_UP))
	).normalized()

	velocity = direction * MOVE_SPEED
	move_and_slide()
	global_position = global_position.clamp(ROOM_MIN, ROOM_MAX)

func _draw() -> void:
	draw_circle(Vector2(0, 15), 12.0, Color("#aeb9af"))
	draw_circle(Vector2(0, 5), 13.0, Color("#17494b"))
	draw_circle(Vector2(0, 4), 10.0, Color("#40a99f"))
	draw_circle(Vector2(0, -9), 8.0, Color("#f0c49b"))
	draw_circle(Vector2(-3, -10), 1.2, Color("#263238"))
	draw_circle(Vector2(3, -10), 1.2, Color("#263238"))