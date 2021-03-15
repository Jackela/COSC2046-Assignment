extends Node2D


var HP = 0
export var spawnTime = 1

var timer = 5
var number = 5
var mobsRemain = 0

var enemy = preload("res://Follow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mobsRemain = number
	


func _process(delta: float) -> void:
	timer += delta
	
	if timer >= spawnTime and mobsRemain > 0:
		var newEnemy = enemy.instance()
		get_node("Route").add_child(newEnemy)
		timer = 0
		mobsRemain -= 1

func run_next_wave():
	number += 1
	mobsRemain = number
