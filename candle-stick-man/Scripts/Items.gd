extends CollisionShape2D

@onready var playerScript = get_node("") 
@onready var PlayerLight = $PointLight2D2
@onready var PlayerLightRange = $LightRange

#var warm1 = 51
#var warm2 = 45
#var warm3 = 35

func _ready() -> void:
	_Oil()


func _process(delta: float) -> void:
	pass


func _Oil():
	PlayerLight.energy = PlayerLight.energy + 1.6
	PlayerLight.apply_scale(Vector2(1.4,1.4))
	PlayerLightRange.apply_scale(Vector2(1.4,1.4))
	Globals.warm1 = Globals.warm1 * 1.4
	Globals.warm2 = Globals.warm2 * 1.4
	Globals.warm3 = Globals.warm3 * 1.4
