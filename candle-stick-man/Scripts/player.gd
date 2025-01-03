extends CharacterBody2D

# Persist the last move direction
var lastMove = "Right"

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('Right'):
		input.x += 1
	if Input.is_action_pressed('Left'):
		input.x -= 1
	if Input.is_action_pressed('Down'):
		input.y += 1
	if Input.is_action_pressed('Up'):
		input.y -= 1
	return input

func _DoArtStuff():
	var direction = get_input()
	if Globals.PlayerHelth <= 0:
		get_tree().change_scene_to_file("res://Scene/Death.tscn")

	# Handle movement animations
	if direction.x == 1:
		$AnimatedSprite2D.play("RR")
		lastMove = "Right"
	elif direction.x == -1:
		$AnimatedSprite2D.play("LR")
		lastMove = "Left"
	elif direction.y == 1:
		$AnimatedSprite2D.play("BR")
		lastMove = "Back"
	elif direction.y == -1:
		$AnimatedSprite2D.play("FR")
		lastMove = "Forward"
	else:
		# Play idle animation based on the last movement direction
		if lastMove == "Right":
			$AnimatedSprite2D.play("IR")
		elif lastMove == "Left":
			$AnimatedSprite2D.play("IL")
		elif lastMove == "Back":
			$AnimatedSprite2D.play("IB")
		elif lastMove == "Forward":
			$AnimatedSprite2D.play("IF")

func _physics_process(delta):	
	var speed = Globals.speed
	var friction = Globals.friction
	var acceleration = Globals.acceleration
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	_DoArtStuff()
	move_and_slide()
