extends PointLight2D

var warm1 = 51
var warm2 = 45
var warm3 = 35
var speed = 75
var friction = 0.25
var acceleration = 0.1
# Camera speed (for smooth following)
var camera_speed = 5
var damping_factor = 0.09 # The lower the value, the smoother the movement
var PlayerHelth = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
