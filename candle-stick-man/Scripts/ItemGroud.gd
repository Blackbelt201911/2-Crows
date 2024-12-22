extends RigidBody2D

func _ready():
	# Apply impulse to simulate a push
	var force_direction = Vector2(100, -300)  # Example force: move right and up
	apply_impulse(Vector2.ZERO, force_direction)
