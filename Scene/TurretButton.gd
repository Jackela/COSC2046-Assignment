extends Button


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var turret = preload("res://Scene/Turret.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_TurretButton_pressed() -> void:
	var level = self.get_tree().get_root().get_node("Level_One")
	var tile_map = level.get_node("TileMap")
	var newTurret = turret.instance()
	var price = newTurret.get_price()
	if level.get_cash() >= price:
		level.add_child(newTurret)
		newTurret.set_global_position(get_global_mouse_position())
		level.subtract_cash(price)
		tile_map.set_visibility(true)
