extends Area2D

@onready var RootNode = $".."
var player : Node2D = null
var rotation_speed = 150
var move_speed = 67
var distance


func _ready() -> void:
	move_speed = randi_range(57,77)
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]  # Assuming the first player found is the one to track
	else:
		print("No player found in 'Player' group")


func _process(delta: float) -> void:
	if player:  # Check if player is not null
		distance = global_position.distance_to(player.global_position)
		Move(delta)
	else:
		print("Player node not found!")

func Move(delta: float):
	rotation_degrees += rotation_speed * delta
	position.x -= move_speed * delta  # Move left (decreasing x)
	position.y += move_speed * delta  # Move down (increasing y)
	if distance >= 200:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("SnowFlackDel"):
		Globals.PlayerHelth = Globals.PlayerHelth - 1
