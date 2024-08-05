extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pause_pressed() -> void:
	if $VideoStreamPlayer.paused == true:
		$VideoStreamPlayer.paused = false
	else:
		$VideoStreamPlayer.paused = true


func _on_quit_video_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
