extends CanvasLayer

func _on_menu_button_pressed() :
	get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")

func _on_leave_button_pressed() :
	get_tree().quit()

func _on_next_button_pressed():
	if SystemLevel.Level == 2:
		get_tree().change_scene_to_file("res://scenes/Levels/level_2.tscn")
	elif SystemLevel.Level == 3:
		get_tree().change_scene_to_file("res://scenes/Levels/level_3.tscn")
	elif SystemLevel.Level == 4:
		get_tree().change_scene_to_file("res://scenes/Levels/level_4.tscn")
	elif SystemLevel.Level == 5:
		get_tree().change_scene_to_file("res://scenes/Levels/level_5.tscn")
	elif SystemLevel.Level == 6:
		get_tree().change_scene_to_file("res://scenes/Levels/level_6.tscn")
	elif SystemLevel.Level == 7:
		get_tree().change_scene_to_file("res://scenes/Levels/level_7.tscn")
	elif SystemLevel.Level == 8:
		get_tree().change_scene_to_file("res://scenes/Levels/level_8.tscn")
	elif SystemLevel.Level == 9:
		get_tree().change_scene_to_file("res://scenes/Levels/level_9.tscn")
	elif SystemLevel.Level == 10:
		get_tree().change_scene_to_file("res://scenes/Levels/level_10.tscn")
	elif SystemLevel.Level == 11:
		get_tree().change_scene_to_file("res://scenes/Menu/credit.tscn")
