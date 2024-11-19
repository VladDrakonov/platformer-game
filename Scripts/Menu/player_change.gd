extends Node2D

func _on_solder_button_pressed():
	GlobalSystem.Orc = false
	GlobalSystem.Solder = true

func _on_orc_button_pressed():
	GlobalSystem.Orc = true
	GlobalSystem.Solder = false
	
func _on_orc_button_mouse_entered():
	$AnimationPlayer.play("Orc_Start")
	$OrcSprite.scale = Vector2(7,7)

func _on_orc_button_mouse_exited():
	$AnimationPlayer.play("Orc_Exit")
	$OrcSprite.scale = Vector2(5,5)

func _on_solder_button_mouse_entered():
	$AnimationPlayer.play("Solder_Start")
	$SolderSprite.scale = Vector2(7,7)

func _on_solder_button_mouse_exited():
	$AnimationPlayer.play("Solder_Exit")
	$SolderSprite.scale = Vector2(5,5)

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
