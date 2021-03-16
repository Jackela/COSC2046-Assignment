extends Area2D

var type = "core"
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Core_area_entered(area: Area2D) -> void:
	if area.get_type() == "enemy":
		var level = self.get_tree().get_root().get_node("Level_One")
		level.damaged(1)
		area.queue_free()

func get_type() -> String:
	return self.type
