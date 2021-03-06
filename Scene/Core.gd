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

#when another obj enter the area
func _on_Core_area_entered(area: Area2D) -> void:
	if area.get_type() == "enemy":
		#if entered is a enemy, the core will be damaged
		var level = self.get_tree().get_root().get_node("Level_One")
		level.damaged(10)
		area.queue_free()

func get_type() -> String:
	return self.type
