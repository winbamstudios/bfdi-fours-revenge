extends CharacterBody2D

var speed = 150
var current_dir = "none"

func _physics_process(delta: float) -> void:
	player_movement(delta)
	sprint(delta)

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
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
