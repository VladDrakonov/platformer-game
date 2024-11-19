extends Node2D

func _ready():
		
	if SystemLevel.Level_Max  >=  2 :
		$Page1/Level_2_Button.disabled = false
		$Page1/Level_2_Button/lockedText.hide()
		#$Level_2_Button/scoreLabel.show()
		#$Level_2_Button/scoreLvl2.show()
	if SystemLevel.Level_Max >= 3 :
		$Page1/Level_3_Button.disabled = false
		$Page1/Level_3_Button/lockedText.hide()
		#$Level_3_Button/scoreLabel.show()
		#$Level_3_Button/scoreLvl3.show()
	if SystemLevel.Level_Max >= 4 :
		$Page1/Level_4_Button.disabled = false
		$Page1/Level_4_Button/lockedText.hide()
		#$Level_4_Button/scoreLabel.show()
		#$Level_4_Button/scoreLVL4.show()
	if SystemLevel.Level_Max >= 5 :
		$Page1/Level_5_Button.disabled = false
		$Page1/Level_5_Button/lockedText.hide()
		#$Level_5_Button/scoreLabel.show()
		#$Level_5_Button/scoreLvl5.show()
	if SystemLevel.Level_Max >= 6 :
		$Page1/Level_6_Button.disabled = false
		$Page1/Level_6_Button/lockedText.hide()
		#$Level_6_Button/scoreLabel.show()
		#$Level_6_Button/scoreLvl6.show()
	if SystemLevel.Level_Max >= 7:
		$Page1/Level_7_Button.disabled = false
		$Page1/Level_7_Button/lockedText.hide()

func _process(_delta):
	if Input.is_action_pressed("escape"):
		$Transition.play("AnimationMenuGame")

#système d'appuie level
func _on_level_1_button_pressed() :
	get_tree().change_scene_to_file("res://scenes/Levels/Level_1.tscn")
	
func _on_level_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_2.tscn")

func _on_level_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_3.tscn")

func _on_level_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_4.tscn")

func _on_level_5_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_5.tscn")

func _on_level_6_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_6.tscn")

func _on_level_7_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_7.tscn")

func _on_level_8_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_8.tscn")

func _on_level_9_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_9.tscn")

func _on_level_10_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level_10.tscn")

#système souris entrée
func _on_level_1_button_mouse_entered():
	if $Page1/Level_1_Button.disabled == false:
		$animationManager/AnimationImgEnter.play("AnimationLvl1enter")

func _on_level_2_button_mouse_entered():
	if $Page1/Level_2_Button.disabled == false:
		$animationManager/AnimationImgEnter.play("AnimationLvl2enter")

func _on_level_3_button_mouse_entered():
	if $Page1/Level_3_Button.disabled == false:
		$animationManager/AnimationImgEnter.play("AnimationLvl3enter")

func _on_level_4_button_mouse_entered():
	if $Page1/Level_4_Button.disabled == false:
		$animationManager/AnimationImgEnter.play("AnimationLvl4enter")

func _on_level_5_button_mouse_entered():
	if $Page1/Level_5_Button.disabled == false:
		$animationManager/AnimationImgEnter.play("AnimationLvl5enter")

func _on_level_6_button_mouse_entered():
	if $Page1/Level_6_Button.disabled == false:
		$animationManager/AnimationImgEnter.play("AnimationLvl6enter")

func _on_level_1_button_mouse_exited():
	if $Page1/Level_1_Button.disabled == false:
		$animationManager/AnimationImgExit.play("AnimationLvl1exit")

func _on_level_2_button_mouse_exited():
	if $Page1/Level_2_Button.disabled == false:
		$animationManager/AnimationImgExit.play("AnimationLvl2exit")

func _on_level_3_button_mouse_exited():
	if $Page1/Level_3_Button.disabled == false:
		$animationManager/AnimationImgExit.play("AnimationLvl3exit")

func _on_level_4_button_mouse_exited():
	if $Page1/Level_4_Button.disabled == false:
		$animationManager/AnimationImgExit.play("AnimationLvl4exit")

func _on_level_5_button_mouse_exited():
	if $Page1/Level_5_Button.disabled == false:
		$animationManager/AnimationImgExit.play("AnimationLvl5exit")

func _on_level_6_button_mouse_exited():
	if $Page1/Level_6_Button.disabled == false:
		$animationManager/AnimationImgExit.play("AnimationLvl6exit")

func _on_transition_animation_finished(anim_name):
	if anim_name == "AnimationMenuGame":
		get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
#next page 1
func _on_next_button_pressed():
	$Camera.position = Vector2(1736,324)
#previous page 2
func _on_previous_button_pressed():
	$Camera.position = Vector2(576,324)
