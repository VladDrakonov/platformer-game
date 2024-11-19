extends Node2D

func _ready():
	$CanvasLayer/Music.play()
func _on_button_pressed():
	$CanvasLayer/AnimationPlayer.play("Transition")

func _process(_delta):
	if Input.is_action_pressed("escape"):
		$CanvasLayer/AnimationPlayer.play("Transition")
		
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Transition":
		get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
