extends Marker2D

@onready var Flack = preload("res://Scene/SnowFlack2.tscn")  # Preload the snowflake scene

# Define positions as node references
@onready var Pos1 = $"."
@onready var Pos2 = $"../Pos2"
@onready var Pos3 = $"../Pos3"
@onready var Pos4 = $"../Pos4"
@onready var Pos5 = $"../Pos5"
@onready var Pos6 = $"../Pos6"

var SnowFlackInstantiate
var target_position
var yea = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while yea:
		_SpawnFlack()
		await get_tree().create_timer(1.3).timeout
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Empty for now, can be used for continuous checks
	pass

# Make _SpawnFlack an async function to use await
func _SpawnFlack() -> void:
	target_position = randi_range(1, 6)
	SnowFlackInstantiate = Flack.instantiate()
	
	var target_node = null
	
	# Use match-case or if-else to assign the correct position node
	match target_position:
		1:
			target_node = Pos1
		2:
			target_node = Pos2
		3:
			target_node = Pos3
		4:
			target_node = Pos4
		5:
			target_node = Pos5
		6:
			target_node = Pos6

	if target_node != null:
		target_node.add_child(SnowFlackInstantiate)
	else:
		print("Error: Target position node not found")

	# Set up the timer and wait for 3 seconds
