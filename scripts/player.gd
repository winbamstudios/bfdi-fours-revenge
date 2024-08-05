extends CharacterBody2D

signal dialog_closed

var speed = 150
var current_dir = "none"
var able_to_move = true

func _ready() -> void:
	$dialog.hide()
	$PauseMenu/Panel.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $dialog.visible:
		$dialog.hide()
		able_to_move = true
		emit_signal("dialog_closed")

func displaytext(text):
	$dialog.show()
	$dialog/Label.text = text
	able_to_move = false

func _physics_process(delta: float) -> void:
	if able_to_move == true:
		player_movement(delta)
		sprint(delta)
	else:
		velocity.x = 0
		velocity.y = 0
	dialog_test(delta)

func dialog_test(delta):
	if Input.is_key_pressed(KEY_P):
		displaytext("This is a test of the in-game dialog box and \nto see if it is multiline.")

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walkright")
		elif movement == 0:
			anim.play("idleright")
	elif dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("walkleft")
		elif movement == 0:
			anim.play("idleleft")
	elif dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("walkbackward")
		elif movement == 0:
			anim.play("idleback")
	elif dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("walkforward")
		elif movement == 0:
			anim.play("idlefront")

func sprint(delta):
	if Input.is_key_pressed(KEY_SHIFT):
		speed = 225
	else:
		speed = 150

func player_movement(delta):
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()


func _on_pause_pressed() -> void:
	able_to_move = false
	$PauseMenu/Panel.show()
