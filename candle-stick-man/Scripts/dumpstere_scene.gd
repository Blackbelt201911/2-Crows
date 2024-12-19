extends AnimatedSprite2D

@onready var Light = $"../PointLight2D2"
@onready var Player = $"../Player"
var First = Vector2(10.871, -45.28868)
var Second = Vector2(11, 4.027164)
@onready var Camra = $"../Camera2D"
var Third = Vector2(6.946144, 94.41428)
var range
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".play("Dumpster")
	doScene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Light != null:
		Camra.global_position = Light.global_position
	else:
		Camra.global_position = Vector2(-7.4524, 47.78145)
	if Input.is_action_pressed('Load1'):
		get_tree().change_scene_to_file("res://Scene/Level_1.tscn")

func doScene():
	Light.global_position = First
	await get_tree().create_timer(2).timeout
	Light.global_position = Second
	await get_tree().create_timer(.3).timeout
	Light.global_position = Third
	await get_tree().create_timer(1).timeout
	Player.global_position = Light.global_position +Vector2(0,25)
	Light.queue_free()
	$".".stop()
