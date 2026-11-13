extends Node2D

const ROOM := Rect2(32.0, 32.0, 896.0, 476.0)

func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, Vector2(960.0, 540.0)), Color("#263238"))
	draw_rect(ROOM, Color("#d8e0d6"))

	for x in range(48, 913, 48):
		draw_line(Vector2(x, 48), Vector2(x, 492), Color("#c7d1c8"), 1.0)
	for y in range(48, 493, 48):
		draw_line(Vector2(48, y), Vector2(912, y), Color("#c7d1c8"), 1.0)

	draw_rect(ROOM, Color("#74857a"), false, 8.0)
	draw_string(ThemeDB.fallback_font, Vector2(52, 72), "WASD / ARROWS TO MOVE", HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color("#34433b"))