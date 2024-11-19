extends Node2D

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
