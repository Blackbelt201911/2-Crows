extends CollisionShape2D

@onready var playerScript = get_node("") 
@onready var lights = get_tree().get_nodes_in_group("Lights")
@onready var lightRanges = get_tree().get_nodes_in_group("LightRange")
#var warm1 = 51
#var warm2 = 45
#var warm3 = 35

func _ready() -> void:
	_CandleStick()
	
func _process(delta: float) -> void:
	pass

func _Oil():
	for light in lights:
		light.energy = light.energy + 1.6
		light.apply_scale(Vector2(1.4,1.4))
	for lightRange in lightRanges:
		lightRange.apply_scale(Vector2(1.4,1.4))
	Globals.warm1 = Globals.warm1 * 1.4
	Globals.warm2 = Globals.warm2 * 1.4
	Globals.warm3 = Globals.warm3 * 1.4
	
func _Icey():
	Globals.speed = Globals.speed + 25
	Globals.friction = Globals.friction - .24
	Globals.camera_speed = Globals.camera_speed * 1.75
	
func _CandleStick():
	Globals.PlayerHelth = Globals.PlayerHelth + 1
	if Globals.PlayerHelth != 1:
		Globals.speed = Globals.speed - 25 
		for light in lights:
			light.energy = light.energy - 0.75
			light.apply_scale(Vector2(0.75,0.75))
		for lightRange in lightRanges:
			lightRange.apply_scale(Vector2(0.75,0.75))
		Globals.warm1 = Globals.warm1 * 0.9
		Globals.warm2 = Globals.warm2 * 0.9
		Globals.warm3 = Globals.warm3 * 0.9
