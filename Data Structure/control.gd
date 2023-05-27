extends Control

@onready var linked_list_node_tscn = preload("res://linked_list_node.tscn")

@onready var linked_list = $"ScrollContainer/LinkedList"
@onready var InsertButton = $"InsertButton"
@onready var IndexLineEdit = $"IndexLineEdit"
@onready var ElementLineEdit = $"ElementLineEdit"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var test = linked_list.isEmpty()
	print(test)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	create_node()

func _on_insert_button_pressed() -> void:
	var theIndex: int = int(IndexLineEdit.text)
	var theElement = ElementLineEdit.text
	
	if (theIndex != null and theElement != null):
		linked_list.insert(theIndex, theElement)
		var new_node = linked_list_node_tscn.instantiate()
		linked_list.add_child(new_node)
	else:
		print("index或element为空")

func create_node() -> void:
	var linked_list_nodes_children = linked_list.get_children()
	var i: int = 0
	
	for child in linked_list_nodes_children:
		child.get_node("LinkedListNode/Element").text = str(linked_list.get_element(i))
		child.get_node("LinkedListNode/Next").text = str(linked_list.get_next(i))
		i = i + 1
		
		queue_redraw()

func my_get_global_position(node: Control, point: Vector2) -> Vector2:
	var g_position = node.global_position
	return Vector2(g_position.x + point.x, g_position.y + point.y)

func draw_arrow() -> void:
	var linked_list_node_width: int = linked_list.size.y
	var linked_list_node_length: int = 150
	var linked_list_node_count: int = linked_list.get_child_count()
	var arrow_color: Color = Color(255, 0, 0)
	var arrow_width: float = 2.0
	
	for i in (linked_list_node_count - 1):
		var arrow_begin_node: = linked_list.get_child(i)
		var arrow_end_node: = linked_list.get_child(i + 1)
		print("arrow_begin_node: " + str(arrow_begin_node.global_position))
		print("arrow_end_node: " + str(arrow_end_node.global_position))
		
		var arrow_begin_point: Vector2 = (
			my_get_global_position(
				arrow_begin_node, 
				Vector2(linked_list_node_length - 20, 40))
		)
		var arrow_end_point: Vector2 = (
			my_get_global_position(
				arrow_end_node, 
				Vector2(10, 40))
		)
#		print("arrow_begin_point: " + str(arrow_begin_point))
#		print("arrow_end_point: " + str(arrow_end_point))
		
		if i % linked_list.columns != linked_list.columns - 1:
			draw_line(arrow_begin_point, arrow_end_point, arrow_color, arrow_width)
			draw_line(arrow_end_point, Vector2(arrow_end_point.x - 10, arrow_end_point.y - 10), arrow_color, arrow_width)
			draw_line(arrow_end_point, Vector2(arrow_end_point.x - 10, arrow_end_point.y + 10), arrow_color, arrow_width)
		else :
			draw_line(arrow_begin_point, arrow_begin_point + Vector2(0, 43), arrow_color, arrow_width)
			draw_line(arrow_begin_point + Vector2(0, 43), arrow_end_point + Vector2(40, -40), arrow_color, arrow_width)			
			draw_line(arrow_end_point + Vector2(40, -40), arrow_end_point + Vector2(40, -23), arrow_color, arrow_width)
			draw_line(arrow_end_point + Vector2(40, -23), Vector2(arrow_end_point.x + 40 - 5, arrow_end_point.y - 20 - 15), arrow_color, arrow_width)
			draw_line(arrow_end_point + Vector2(40, -23), Vector2(arrow_end_point.x + 40 + 5, arrow_end_point.y - 20 - 15), arrow_color, arrow_width)

func _draw() -> void:
	draw_arrow()
