extends Area2D

var Colid = false
var player
var heat = 0
var distance
var warm1 = 51
var warm2 = 45
var warm3 = 35

func _ready():
	# Connect to the signal when a body enters the area.
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)  # To handle when the body exits
	
	# Get the player node from the Player group
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]  # Assuming there's only one player
	else:
		print("No player found in the 'Player' group!")

func _process(delta):
	if Colid and heat < 125 and player:
		
		distance = global_position.distance_to(player.position)
		print(distance)
		if distance < warm1:
			heat += 0.12
			print(heat)
		
		if distance < warm2:
			heat += 0.3
			print(heat)
		
		if distance < warm3:
			heat += 0.75
			print(heat)
	if heat > 125:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Collision with Player light detected!")
		Colid = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		print("Player light left the area.")
		Colid = false
