extends Node2D

@onready var name_edit = $name_change/LineEdit.text
@onready var change_name_label = $name_change/name_change_error

var savePath = "res://Save/savePlatformerGame.save"

func _ready() -> void:
	$menu/title_animation.play("AnimatedTitle")
	$menu/AnimationPlayer.play("character_animation")
	$menu/animated_character_2/AnimatedSprite2D.play("Walk")
	$menu/animated_character/AnimatedSprite2D.play("Walk")

#region buttons system
func _on_genre_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/player_change.tscn")

func _on_quit_button_pressed():
	$menu/confirmation_dialog.show()
	
func _on_play_button_pressed():
	$menu/transition_animation.play("LevelTransition")

func _on_option_button_pressed():
	$menu/transition_animation.play("ParameterTransition")

func _on_Succes_button_pressed():
	$menu/layers/succes_load.hide()

func _on_Failed_button_pressed():
	$menu/layers/failed_load.hide()

func _on_sucessResetButton_pressed():
	$menu/layers/reset_success.hide()

func _on_save_button_pressed():
	save()

func _on_load_button_pressed():
	load_Data()

func _on_success_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/success.tscn")
#endregion

#region reset button
func _on_reset_button_pressed():
	$menu/layers/reset_warning_layer.show()

func _on_no_button_2_pressed():
	$menu/layers/reset_warning_layer.hide()

func _on_yes_button_pressed():
	$menu/layers/reset_warning_layer.hide()
	$menu/layers/reset_success.show()
	SystemLevel.Level = 1
	SystemLevel.Level_Max = 1
#endregion

#region save system
func save() -> void:
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	file.store_var(SystemLevel.Level)
	file.store_var(SystemLevel.Level_Max)
	file.store_string(GlobalSystem.PlayerName)
	file.store_var(GlobalSystem.Orc)
	file.store_var(GlobalSystem.Solder)

func load_Data() -> void:
	if FileAccess.file_exists(savePath):
		var file = FileAccess.open(savePath, FileAccess.READ)
		SystemLevel.Level = file.get_var(SystemLevel.Level)
		SystemLevel.Level_Max = file.get_var(SystemLevel.Level_Max)
		GlobalSystem.PlayerName = FileAccess.get_file_as_string(GlobalSystem.PlayerName)
		GlobalSystem.Orc =  file.get_var(GlobalSystem.Orc)
		GlobalSystem.Solder = file.get_var(GlobalSystem.Solder)
		$menu/layers/succes_load.show()
	else: 
		$menu/layers/failed_load.show()
		SystemLevel.Level = 1
		SystemLevel.Level_Max = 1
		GlobalSystem.PlayerName = ""
		GlobalSystem.Orc = false
		GlobalSystem.Solder = false
#endregion

#region animation
func _on_transition_animation_animation_finished(anim_name) -> void:
	if anim_name == "LevelTransition":
		get_tree().change_scene_to_file("res://scenes/Menu/menu Level.tscn")
	if anim_name == "ParameterTransition":
		get_tree().change_scene_to_file("res://scenes/Menu/parameter.tscn")

func _on_title_animation_animation_finished(anim_name) -> void:
	if anim_name == "AnimatedTitle":
		$menu/title_animation.play("AnimatedTitle")
		
func _on_animation_player_animation_finished() -> void:
	$menu/AnimationPlayer.play("character_animation")
#endregion

#region quit dialog confirmation
func _on_confirmation_dialog_canceled() -> void:
	$menu/confirmation_dialog.hide()
	
func _on_confirmation_dialog_confirmed() -> void:
	get_tree().quit()
#endregion

#region change name
func _on_change_name_button_pressed() -> void:
	$name_change.show()
	$menu.hide()

func _on_name_change_button_pressed() -> void:
	if name_edit > 8:
		name_edit.label.show()
		name_edit.label = "name can't have more than 8 character"
	elif name_edit.edit_line.length() == 0:
		name_edit.label.show()
		name_edit.label = "name can't be empty"
	
	if name_edit.edit_line.length() > 0 and name_edit.edit_line.length() <= 8:
		GlobalSystem.PlayerName = name_edit.edit_line.get_selected_text()
		$name_change.hide()
		$menu.show()
#endregion
