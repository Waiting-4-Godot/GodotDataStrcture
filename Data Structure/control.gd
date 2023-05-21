extends Control

#@onready var LinkedList = $"LinkedList"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var test = $"LinkedList".isEmpty()
	$"LinkedList".insert(0, 10)
	print(test)
	print("listSize: " + str($"LinkedList".listSize))
	var element = $"LinkedList".get_element(0)
	print(element)
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	print("listSize: " + str($"LinkedList".listSize))
	pass
