extends Area2D

export var value = 25
export var point = 10
var HP = 30
var type = "enemy"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _destroyed():
		var level = self.get_tree().get_root().get_node("Level_One")
		level.add_point(point)
		level.add_cash(value)
		queue_free()


func _on_UFO_area_entered(area: Area2D) -> void:
	
	if area.get_type() == "bullet":
		self.damaged(area.dmg)
		area.queue_free()


func _on_UFO_area_exited(area: Area2D) -> void:
	pass # Replace with function body.

func damaged(dmg: int) -> void:
	self.HP -= dmg


func _destroyed() -> bool:
	if self.HP <= 0:
		return true
	else:
		return false

func get_type() -> String :
	return type

func set_HP(HP: int) -> void:
	self.HP = HP
	
func get_HP() -> int:
	return self.HP
