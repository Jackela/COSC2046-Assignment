extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var fire_rate = 1
export var price = 50

onready var ShootTimer = $ShootTimer


var mouse_over = false
var Laser = preload("res://Scene/Laser.tscn")
var enemy_arr = []
var type = "turret"
var if_follow = true #turret follow the mouse

var built = false #if built, then track the nearest enemy and cannot more with mouse any more

var target = null #curret track target

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if if_follow:
		self.set_global_position(get_global_mouse_position())#follow the mouse
			
		
	if built:
		_track_enemy()#track "enemy" type
		

func _build():
	built = true
	
func _track_enemy() -> void:
	if ! enemy_arr.empty():# if current array is not empty
		self.target = enemy_arr[0] #track the first In obj
		
	else:
		self.target = null #no curretnt obj
	
	if self.target:
		#self.target.get_parent() is the Follow2D obj
		#rotate the Gun Sprite
		$Sprite/Gun.set_rotation((self.target.get_parent().position - position).angle())
		if ShootTimer.is_stopped():
			ShootTimer.start(fire_rate)
			_shoot()

func _on_Turret_area_entered(area: Area2D) -> void:
	# "enemy" type obj entered
	if area.get_type() == "enemy":
		enemy_arr.append(area)# add to target array
	
func _input(event: InputEvent) -> void:
	#track mouse input if click, drop the turrent and set its "built" to true
	if event is InputEventMouseButton:
		var level = self.get_tree().get_root().get_node("Level_One")
		var tile_map = level.get_node("TileMap")
		if event.is_pressed():
			var tile = tile_map.world_to_map(event.position)
			#if the turret on the white blocks
			if tile in level.valid_tiles:		
				_stop_follow()
				_build()
				level.valid_tiles.erase(tile)
				var pos = (tile * Vector2(64, 64)) + Vector2(32, 32)
				self.set_global_position(pos)
				#make the turret built and invisible the blocks
				tile_map.set_visibility(false)
			
	
func _on_Turret_area_exited(area: Area2D) -> void:
	# when "enenmy" target leave the area, remove it from the array
	if area.get_type() == "enemy":
		enemy_arr.erase(area)
	if area.get_type() == "bullet":
		#bullet obj queue_free() when it hitted
		area.queue_free()
		
func _shoot() -> void:
	#generate new laser and make it follow the "Gun"
	var laser = Laser.instance()
	laser.transform = $Sprite/Gun.transform
	
	$Sprite/Base.add_child(laser)
	
func _stop_follow() -> void:
	# stop follow the mouse
	if_follow = false

func get_type() -> String:
	#return type
	return self.type
func get_price() -> int:
	return self.price
