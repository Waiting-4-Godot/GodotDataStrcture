extends Control

@onready var label: Label = $"Label"
@onready var label2: Label = $"Label2"
@onready var position_label: Vector2 = label.global_position
@onready var positon_label2: Vector2 = label2.global_position

var line_begin: Vector2 = Vector2(0, 0)
var line_end: Vector2 = Vector2(0, 0)
var arrow_up: Vector2 = Vector2(0, 0)
var arrow_down: Vector2 = Vector2(0, 0)
var line_color: Color = Color(255, 0, 0)
var line_width: float = 2.0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_label_draw() -> void:
	pass


func _on_button_pressed() -> void:
	line_begin = Vector2(100, 100)
	line_end = Vector2(200, 100)
	arrow_up = Vector2(line_end.x - 30, line_end.y - 20)
	arrow_down = Vector2(line_end.x - 30, line_end.y + 20)
	queue_redraw()

func _draw() -> void:
	draw_arrow()

func draw_arrow() -> void:
	draw_line(line_begin, line_end, line_color, line_width)
	draw_line(line_end, arrow_up, line_color, line_width)
	draw_line(line_end, arrow_down, line_color, line_width)
