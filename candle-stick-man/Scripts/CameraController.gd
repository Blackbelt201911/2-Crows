extends Camera2D

# The player node
@onready var player = $"../Player"

# Minimum distance before the camera starts moving
var follow_threshold = 55

# Camera speed (for smooth following)
var camera_speed = 5
var damping_factor = 0.09 # The lower the value, the smoother the movement

# Velocity for smoothing the camera movement
var velocity = Vector2()

func _ready():
	pass 

func _process(delta):
	var distance_to_player = position.distance_to(player.position)

	# Apply movement only if the player is further than the follow threshold
	if distance_to_player > follow_threshold:
		# Apply damping and move the camera smoothly
		var direction = (player.position - position).normalized()
		
		# Smoothly move towards the player with velocity and damping
		velocity = velocity * (1 - damping_factor) + direction * camera_speed * delta
		position += velocity
