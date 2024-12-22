extends CollisionShape2D

@onready var playerScript = get_node("/root/Player")  # Adjust the path as necessary
@onready var lights = get_tree().get_nodes_in_group("Lights")
@onready var lightRanges = get_tree().get_nodes_in_group("LightRange")

var oilApplied = false
var icyApplied = false
var candleApplied = false

func _ready() -> void:
	# Initialize if needed, or just wait for changes to global variables
	pass

func _process(delta: float) -> void:
	# Check if global variables are true and apply corresponding upgrades
	if Globals.HasOil and not oilApplied:
		_Oil()
		oilApplied = true  # Ensure it doesn't keep applying the upgrade
	elif Globals.HasShoe and not icyApplied:
		_Icey()
		icyApplied = true
	elif Globals.HasCover and not candleApplied:
		_CandleStick()
		candleApplied = true

# The existing upgrade functions

func _Oil():
	for light in lights:
		light.energy = light.energy + 1.6
		light.apply_scale(Vector2(1.4, 1.4))
	for lightRange in lightRanges:
		lightRange.apply_scale(Vector2(1.4, 1.4))
	Globals.warm1 = Globals.warm1 * 1.4
	Globals.warm2 = Globals.warm2 * 1.4
	Globals.warm3 = Globals.warm3 * 1.4

func _Icey():
	Globals.speed = Globals.speed + 50
	Globals.friction = Globals.friction - .225
	Globals.camera_speed = Globals.camera_speed * 1.75
	print(Globals.friction)

func _CandleStick():
	Globals.PlayerHelth = Globals.PlayerHelth + 1
	if Globals.PlayerHelth != 1:
		Globals.speed = Globals.speed - 25 
		for light in lights:
			light.energy = light.energy - 0.75
			light.apply_scale(Vector2(0.75, 0.75))
		for lightRange in lightRanges:
			lightRange.apply_scale(Vector2(0.75, 0.75))
		Globals.warm1 = Globals.warm1 * 0.9
		Globals.warm2 = Globals.warm2 * 0.9
		Globals.warm3 = Globals.warm3 * 0.9
