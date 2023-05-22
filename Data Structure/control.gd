extends Control

@onready var linked_list_node_tscn = preload("res://linked_list_node.tscn")

@onready var linkedList = $"LinkedList"
@onready var InsertButton = $"InsertButton"
@onready var IndexLineEdit = $"IndexLineEdit"
@onready var ElementLineEdit = $"ElementLineEdit"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var test = linkedList.isEmpty()
	print(test)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var linked_list_nodes = $"LinkedList".get_children()
	var i: int = 0
	for child in linked_list_nodes:
		child.get_node("Element").text = str(linkedList.get_element(i))
		child.get_node("Next").text = str(linkedList.get_next(i))
		i = i + 1

# 创建一个节点，添加到目标节点的子节点
# newNode: 要创建的节点的类型
# name: 节点的名称
# targetNode: 该新建节点的父节点(也就是要成为哪个节点的子节点)
func create_node(newNode: Object, name: String, targetNode: Object) -> void:
	var node = newNode.new()
	node.name = name
	targetNode.add_child(node)


func _on_insert_button_pressed() -> void:
	var theIndex: int = int(IndexLineEdit.text)
	var theElement = int(ElementLineEdit.text)
	print("theIndex:")
	print(theIndex)
	print("theElement: ")
	print(theElement)
	if (theIndex != null and theElement != null):
		linkedList.insert(theIndex, theElement)
		var test = linked_list_node_tscn.instantiate()
		linkedList.add_child(test)
	else:
		print("index或element为空")
