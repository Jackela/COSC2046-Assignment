extends Area2D

var enemy_arr = []
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass



func _on_Turret_area_entered(area: Area2D) -> void:
	enemy_arr.append(area.get_parent())



func _on_Turret_area_exited(area: Area2D) -> void:
	enemy_arr.erase(area.get_parent())
