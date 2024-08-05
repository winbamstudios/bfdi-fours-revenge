extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_health($ProgressBar, State.current_health, State.max_health)

func set_health(progressbar, health, max_health):
		progressbar.value = health
		progressbar.max_value = max_health
		# oh boy i love godot 3 tutorials on godot 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_health($ProgressBar, State.current_health, State.max_health)
