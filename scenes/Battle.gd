extends Control

signal dialog_closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_health($FightPanel/PlayerData/ProgressBar, State.current_health, State.max_health)
	
	$dialog.hide()
	$ActualFightPanel.hide()
	displaytext("A wild FOUR appears!")
	await self.dialog_closed
	$ActualFightPanel.show()

func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $dialog.visible:
		$dialog.hide()
		emit_signal("dialog_closed")

func displaytext(text):
	$dialog.show()
	$dialog/Label.text = text

func set_health(progressbar, health, max_health):
	progressbar.value = health
	progressbar.max_value = max_health
	# oh boy i love godot 3 tutorials on godot 4
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_run__pressed() -> void:
	$ActualFightPanel.hide()
	displaytext("Pencil booked it outta there.")
	await self.dialog_closed
	get_tree().change_scene_to_file("res://scenes/World.tscn")
