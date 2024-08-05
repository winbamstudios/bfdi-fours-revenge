extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimationPlayer.speed_scale = 1.2
	$AnimationPlayer.play("logobounce")


func _on_cutscene_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/VideoPlayIII.tscn")


func _on_cutscene_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/VideoPlayII2.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
