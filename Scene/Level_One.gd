extends Node2D

export var spawnTime = 5
export var HP = 10
export var cash = 50
export var waves = 10

var points = 0
var timer = 5
var number = 5
var mobsRemain = 0
var valid_tiles
var enemy = preload("res://Scene/Follow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mobsRemain = number
	valid_tiles = $TileMap.get_used_cells()

func _process(delta: float) -> void:
	
	if ! HP >= 0:
		pass
	timer += delta
	if self.waves >= 0:
		if timer >= spawnTime and mobsRemain > 0:
			var newEnemy = enemy.instance()
			get_node("Route").add_child(newEnemy)
			timer = 0
			mobsRemain -= 1

func run_next_wave():
	if self.spawnTime >= 0:
		self.spawnTime -= 1
	self.number += 1
	self.mobsRemain = number
	self.waves -= 1
	
func damaged(value: int) -> void:
	HP -= value
	
	
	
	
func get_HP() -> int:
	return self.HP

func get_point() -> int:
	return self.points

func add_point(value: int) -> void:
	if value >= 0:
		self.points += value
func subtract_point(value: int) -> void:
	if value >= 0:
		self.points -= value
		
func get_cash() -> int:
	return self.cash

func add_cash(value: int) -> void:
	if value >= 0:
		self.cash += value

func subtract_cash(value: int) -> void:
	if value >= 0:
		self.cash -= value
		
