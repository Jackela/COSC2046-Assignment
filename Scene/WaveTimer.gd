extends Label


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var seconds = 30
export var elapsed = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_text(str(seconds-elapsed))


func _on_WaveTimer_timeout() -> void:
	if ! elapsed >= seconds:
		elapsed += 1
	else:
		get_tree().get_root().get_node("Level_One").run_next_wave()
		elapsed = 0
		seconds += 5
