extends Node2D

var savePath = "res://Save/savePlatformerGame.save"

func _ready():
		$TitleAnimation.play("AnimatedTitle")
		$TransitionAnimation.play("CharacterAnimation")
		$AnimatedCharacter2/AnimatedSprite2D.play("Walk")
		$AnimatedCharacter/AnimatedSprite2D.play("Walk")

func _on_genre_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/player_change.tscn")

func _on_quit_button_pressed():
	$ConfirmationDialog.show()
	
func _on_play_button_pressed():
	$TransitionAnimation.play("LevelTransition")

func _on_option_button_pressed():
	$TransitionAnimation.play("ParameterTransition")

func _on_Succes_button_pressed():
	$SuccesLoad.hide()

func _on_Failed_button_pressed():
	$FailedLoad.hide()

func _on_sucessResetButton_pressed():
	$ResetSuccess.hide()

func _on_save_button_pressed():
	save()

func _on_load_button_pressed():
	load_Data()

func _on_reset_button_pressed():
	$ResetWarningLayer.show()

func _on_no_button_2_pressed():
	$ResetWarningLayer.hide()

func _on_yes_button_pressed():
	$ResetWarningLayer.hide()
	$ResetSuccess.show()
	SystemLevel.Level = 1
	SystemLevel.Level_Max = 1

func save():
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	file.store_var(SystemLevel.Level)
	file.store_var(SystemLevel.Level_Max)
	file.store_string(GlobalSystem.PlayerName)
	file.store_var(GlobalSystem.Orc)
	file.store_var(GlobalSystem.Solder)

func load_Data():
	if FileAccess.file_exists(savePath):
		var file = FileAccess.open(savePath, FileAccess.READ)
		SystemLevel.Level = file.get_var(SystemLevel.Level)
		SystemLevel.Level_Max = file.get_var(SystemLevel.Level_Max)
		GlobalSystem.PlayerName = file.get_file_as_string(GlobalSystem.PlayerName)
		GlobalSystem.Orc =  file.get_var(GlobalSystem.Orc)
		GlobalSystem.Solder = file.get_var(GlobalSystem.Solder)
		$SuccesLoad.show()
	else: 
		$FailedLoad.show()
		SystemLevel.Level = 1
		SystemLevel.Level_Max = 1
		GlobalSystem.PlayerName = ""
		GlobalSystem.Orc = false
		GlobalSystem.Solder = false

func _on_transition_animation_animation_finished(anim_name):
	if anim_name == "LevelTransition":
		get_tree().change_scene_to_file("res://scenes/Menu/menu Level.tscn")
	if anim_name == "ParameterTransition":
		get_tree().change_scene_to_file("res://scenes/Menu/parameter.tscn")
	if anim_name =="CharacterAnimation":
		$TransitionAnimation.play("CharacterAnimation")

func _on_title_animation_animation_finished(anim_name):
	if anim_name == "AnimatedTitle":
		$TitleAnimation.play("AnimatedTitle")
func _on_confirmation_dialog_confirmed():
	get_tree().quit()

func _on_confirmation_dialog_canceled():
	$ConfirmationDialog.hide()

func _on_success_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/success.tscn")

func _on_button_pressed():
	if $LineEdit.get_text().length() > 8:
		$ErrorLabel.show()
		$ErrorLabel.text = "name can't have more than 8 character"
	elif $LineEdit.get_text().length() == 0:
		$ErrorLabel.show()
		$ErrorLabel.text = "name can't be empty"
	
	if $LineEdit.get_text().length() > 0 and $LineEdit.get_text().length() <= 8:
		GlobalSystem.PlayerName = $LineEdit.get_text()
		$EnterNameButton.hide()
		$LineEdit.hide()
		$ErrorLabel.hide()
		$NameEnterLabel.hide()
		$AnimatedCharacter2.show()
		$AnimatedCharacter.show()
		$Title.show()
		$Backend.show()
		$TransitionLevel.show()
		$Note_Version.show()
		$Note_Prototype.show()
		$Quit_Button.show()
		$Play_Button.show()
		$SaveButton.show()
		$LoadButton.show()
		$ResetButton.show()
		$OptionButton.show()
		$SuccessButton.show()
		$GenreButton.show()
		$NameButton.show()

func _on_name_button_pressed():
		$EnterNameButton.show()
		$LineEdit.show()
		$ErrorLabel.show()
		$NameEnterLabel.show()
		$AnimatedCharacter2.hide()
		$AnimatedCharacter.hide()
		$Title.hide()
		$Backend.hide()
		$TransitionLevel.hide()
		$Note_Version.hide()
		$Note_Prototype.hide()
		$Quit_Button.hide()
		$Play_Button.hide()
		$SaveButton.hide()
		$LoadButton.hide()
		$ResetButton.hide()
		$OptionButton.hide()
		$SuccessButton.hide()
		$GenreButton.hide()
		$NameButton.hide()
