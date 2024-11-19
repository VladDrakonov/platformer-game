extends Node2D

func _ready():
	if GlobalSuccess.Level10Success == true:
		$Level10Success/EarnedLevel10Success.text = "OBTAINED"
	if GlobalSuccess.SecretDoorSuccessLvl7 == true:
		$SecretDoorSuccess/EarnedSecretDoorSuccess.text = "OBTAINED"
	if GlobalSuccess.SecretDoorSuccessLvl10 == true:
		$IncomingSuccess/EarnedSecretDoorSuccess.text = "OBTAINED"
		
func _input(_event):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
		
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
