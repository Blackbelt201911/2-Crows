extends Area2D

var Colid = false
var player : Node2D = null
var heat = 0
var distance = 0.0

var warm1 = Globals.warm1
var warm2 = Globals.warm2
var warm3 = Globals.warm3
var stopUi = false

@onready var animation_player = $AnimatedSprite2D
@onready var control = $Camera2D/CanvasLayer/Control
@onready var Oils = get_tree().get_nodes_in_group("Oil")
@onready var Pwaxs = get_tree().get_nodes_in_group("Pwax")
@onready var Swaxs = get_tree().get_nodes_in_group("Swax")
@onready var Covers = get_tree().get_nodes_in_group("Cover")
@onready var Shoes = get_tree().get_nodes_in_group("Shoe")



func _ready():
	match self.name:
		"H1":
			animation_player.play("Breathing1")  # Play "intro_anim" in Scene1
		"H2":
			animation_player.play("Breathing2")  # Play "level_start" in Scene2
		"H3":
			animation_player.play("Breathing3")  # Play "boss_intro" in Scene3
		"H4":
			animation_player.play("Breathing4")  # Default animation if the scene doesn't match

	# Connect to the signal when a body enters or exits the area
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

	# Initialize the player node from the "Player" group
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]  # Assuming the first player found is the one to track
	else:
		print("No player found in 'Player' group")

func _process(delta):
	if Colid and heat < 125 and player:
		distance = global_position.distance_to(player.global_position)

		if distance < 16:
			queue_free()

		if distance < warm1:
			heat += 0.12
			print(heat)

		if distance < warm2:
			heat += 0.3

		if distance < warm3:
			heat += 0.75


	if heat > 125:
		var ranvalue = randi_range(1,5)
		match ranvalue:
			1:
				if stopUi == false and not Globals.HasOil:
					for oil in Oils:
						stopUi = true
						oil.visible = true
						await get_tree().create_timer(3.5).timeout
						Globals.Oil = true
						Globals.HasOil = true
						oil.visible = false
			2:
				if stopUi == false and not Globals.HasPwax:
					for Pwax in Pwaxs:
						stopUi = true
						Pwax.visible = true
						await get_tree().create_timer(3.5).timeout
						Globals.Pwax = true
						Globals.HasPwax = true
						Pwax.visible = false
			3:
				if stopUi == false and not Globals.HasSwax:
					for Swax in Swaxs:
						stopUi = true
						Swax.visible = true
						await get_tree().create_timer(3.5).timeout
						Globals.Swax = true
						Globals.HasSwax = true
						Swax.visible = false
			4:
				if stopUi == false and not Globals.HasShoe:
					for Shoe in Shoes:
						stopUi = true
						print("shoe")
						Shoe.visible = true
						await get_tree().create_timer(3.5).timeout
						Globals.Shoe = true
						Globals.HasShoe = true
						print("shoe 2")
						Shoe.visible = false
			
			5:
				if stopUi == false and not Globals.HasCover:
					for Cover in Covers:
						stopUi = true
						Cover.visible = true
						await get_tree().create_timer(3.5).timeout
						Globals.Cover = true
						Globals.HasCover = true
						Cover.visible = false

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Collision with Player detected!")
		Colid = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		print("Player left the area.")
		Colid = false
