extends PathFollow2D


export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	#set offset
	set_offset(get_offset() + delta * speed)
	


