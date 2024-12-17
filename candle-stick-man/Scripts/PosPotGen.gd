extends Node2D

var PosPot = [1, 2, 3, 4, 5, 6]  # All possible positions
var UsedPositions = []           # Positions already used
var HomelessScenes = []          # To store the homeless scene instances

var HomeScenes = [
	preload("res://Scene/HomeLessMan1.tscn"),
	preload("res://Scene/HomeLessMan2.tscn"),
	preload("res://Scene/HomeLessMan3.tscn"),
	preload("res://Scene/HomeLessMan4.tscn"),
	preload("res://Scene/HomeLessMan5.tscn"),
	preload("res://Scene/HomeLessMan6.tscn")
]

# Position nodes
var position_nodes = []

func _ready() -> void:
	# Add the nodes "Pos 1", "Pos 2", ..., "Pos 6" dynamically into the list
	for i in range(1, 7):
		var node = get_node("Pos %s" % i)
		position_nodes.append(node)

	var NumOfHL = randi_range(3, 6)  # Number of homeless to spawn

	while NumOfHL > 0 and PosPot.size() > 0:
		# Pick a random position
		var rand_index = randi_range(0, PosPot.size() - 1)
		var selected_pos = PosPot.pop_at(rand_index)
		UsedPositions.append(selected_pos)

		# Spawn a homeless instance at the selected position
		_MakeHomeLess(position_nodes[selected_pos - 1])
		NumOfHL -= 1

func _MakeHomeLess(target_position):
	# Randomly choose one of the homeless scenes
	var rand_scene_index = randi_range(0, HomeScenes.size() - 1)
	var homeless_instance = HomeScenes[rand_scene_index].instantiate()
	
	# Add the instance to the target position node
	target_position.add_child(homeless_instance)
