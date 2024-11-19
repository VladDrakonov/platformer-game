extends Node2D

func _ready():
	pass
		
func _input(_event):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
		
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
