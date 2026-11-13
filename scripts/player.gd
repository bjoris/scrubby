extends CharacterBody2D

const MOVE_SPEED := 190.0
const ROOM_MIN := Vector2(50.0, 50.0)
const ROOM_MAX := Vector2(910.0, 490.0)

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var show_placeholder := true

func _ready() -> void:
	show_placeholder = not _has_walk_animation()
	if _has_walk_animation():
		animated_sprite.animation = &"walk_left"
		animated_sprite.frame = 0

func _physics_process(_delta: float) -> void:
	var direction := Vector2(
		float(Input.is_physical_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT)) - float(Input.is_physical_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT)),
		float(Input.is_physical_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN)) - float(Input.is_physical_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP))
	).normalized()

	if direction.x < 0.0:
		animated_sprite.flip_h = false
	elif direction.x > 0.0:
		animated_sprite.flip_h = true

	if _has_walk_animation():
		if direction.length_squared() > 0.0:
			if not animated_sprite.is_playing():
				animated_sprite.play(&"walk_left")
		elif animated_sprite.is_playing():
			animated_sprite.stop()
			animated_sprite.frame = 0

	velocity = direction * MOVE_SPEED
	move_and_slide()
	global_position = global_position.clamp(ROOM_MIN, ROOM_MAX)

func _has_walk_animation() -> bool:
	return animated_sprite.sprite_frames != null \
		and animated_sprite.sprite_frames.has_animation(&"walk_left") \
		and animated_sprite.sprite_frames.get_frame_count(&"walk_left") > 0

func _draw() -> void:
	if not show_placeholder:
		return

	draw_circle(Vector2(0, 15), 12.0, Color("#aeb9af"))
	draw_circle(Vector2(0, 5), 13.0, Color("#17494b"))
	draw_circle(Vector2(0, 4), 10.0, Color("#40a99f"))
	draw_circle(Vector2(0, -9), 8.0, Color("#f0c49b"))
	draw_circle(Vector2(-3, -10), 1.2, Color("#263238"))
	draw_circle(Vector2(3, -10), 1.2, Color("#263238"))