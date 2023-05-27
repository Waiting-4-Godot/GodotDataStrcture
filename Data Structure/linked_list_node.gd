extends Control

@onready var element = $"Element"
@onready var next = $"Next"

@export var arrow_begin: Vector2 = my_get_global_position(Vector2(0, size.y / 2))
@export var arrow_end: Vector2= my_get_global_position(Vector2(size.x, size.y / 2))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func my_get_global_position(point: Vector2) -> Vector2:
	var g_position = global_position
	return Vector2(g_position.x + point.x, g_position.y + point.y)


signal draw_arrow(arrow_begin: Vector2, arrow_end: Vector2)


func _on_draw() -> void:
	emit_signal("draw_arrow", arrow_begin, arrow_end)
