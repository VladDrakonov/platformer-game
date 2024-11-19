extends Node2D

func _process(delta):
	if Input.is_action_pressed("escape") :
		get_tree().change_scene_to_file("res://scenes/Menu_Game.tscn")

func _on_level_1_button_pressed() :
	get_tree().change_scene_to_file("res://scenes/Level 1.tscn")
