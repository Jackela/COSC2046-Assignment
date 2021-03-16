extends Area2D

var velocity = Vector2()
var speed = 500
var type = "bullet"
var dmg = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	self.position += transform.x * speed * delta



func _on_Area2D_area_entered(area: Area2D) -> void:
	pass
	
func _on_Area2D_area_exited(area: Area2D) -> void:
	pass
func get_type() -> String:
	return self.type


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
