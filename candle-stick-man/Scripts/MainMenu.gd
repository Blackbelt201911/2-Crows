extends Control

func _on_start_pressed() -> void:
	# Ensure the animation stops and force an immediate frame update
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.frame = 1  # Set directly to the "clicked" frame
	$AnimatedSprite2D.visible = true  # Ensure visibility is immediate
	
	# Update the sprite immediately (force frame redraw)
	$AnimatedSprite2D.queue_redraw()
	
	# Play the rest of the animation
	$AnimatedSprite2D.play("Start")
	
	# Wait 1 second
	await get_tree().create_timer(0.3).timeout

	# Change to the next scene
	get_tree().change_scene_to_file("res://Scene/main.tscn")
