extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:    # set the points of the line
	points = [Vector2(100, 100), Vector2(300, 200), Vector2(400, 300)]
	# set the width of the line
	width = 10
	# set the color of the line



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
