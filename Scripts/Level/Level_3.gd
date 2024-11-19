extends Node2D

func _ready():
	SystemLevel.Level = 3
	$Musique.play()
	if CheckpointSys.Lvl3Checkpoint1 == true:
		$Player.position = Vector2(1871, -17)
	if CheckpointSys.Lvl3Checkpoint2 == true:
		$Player.position = Vector2(3265, 1000)

func _on_checkpoint_body_entered(body):
	if body is CharacterBody2D :
		print("chekcpoint activate")
		CheckpointSys.Lvl3Checkpoint1 = true

func _on_checkpoint_2_body_entered(body):
	if body is CharacterBody2D :
		CheckpointSys.Lvl3Checkpoint2 = true
		
func _on_mur_letal_body_entered(body) :
	if body is CharacterBody2D :
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")
			
func _on_pancarte_body_entered(body) :
	if body is CharacterBody2D :
		$Player/ColorRect.show()
		$Player/Text.show()

func _on_pancarte_body_exited(body) :
	if body is CharacterBody2D :
		$Player/ColorRect.hide()
		$Player/Text.hide()

func _on_piege_body_entered(body) :
	if body is CharacterBody2D :
		$"Level 3/Piege/Sprite2D".hide()
		$"Level 3/Piege/AudioStreamPlayer2D".play()

func _on_piege_2_body_entered(body):
	if body is CharacterBody2D :
		$"Level 3/Piege2/Sprite2D".hide()
		$"Level 3/Piege2/AudioStreamPlayer2D".play()
		$"Level 3/Piege2/CollisionShape2D".disabled = true

func _on_piege_3_body_entered(body):
	if body is CharacterBody2D:
		$"Level 3/Piege3/AudioStreamPlayer2D".play()
		$/DeadLayer.show()
	
func _on_ladder_body_entered(body):
	if body is CharacterBody2D :
		$"Level 3/Ladder/ButtonUp".show()
		$"Level 3/Ladder/ButtonDown".show()
		$"Level 3/Ladder/ButtonDown".disabled = false
		$"Level 3/Ladder/ButtonUp".disabled = false

func _on_ladder_body_exited(body):
	if body is CharacterBody2D :
		$"Level 3/Ladder/ButtonUp".hide()
		$"Level 3/Ladder/ButtonDown".hide()
		$"Level 3/Ladder/ButtonUp".disabled = true
		$"Level 3/Ladder/ButtonDown".disabled = true

func _on_button_up_pressed():
	$Player.position = Vector2(2164, -297)

func _on_button_down_pressed():
	$Player.position = Vector2(2404, 407)
	
func _on_button_up_2_pressed():
	$Player.position = Vector2(2164, -17)
	
func _on_button_down_2_pressed():
	$Player.position = Vector2(2164, -17)

func _on_ladder_up_body_entered(body):
	if body is CharacterBody2D :
		$"Level 3/Ladder/LadderDown/ButtonUp2".show()
		$"Level 3/Ladder/LadderDown/ButtonUp2".disabled = false

func _on_ladder_up_body_exited(body):
	if body is CharacterBody2D :
		$"Level 3/Ladder/LadderDown/ButtonUp2".hide()
		$"Level 3/Ladder/LadderDown/ButtonUp2".disabled = true

func _on_ladder_down_body_entered(body):
	if body is CharacterBody2D :
		$"Level 3/Ladder/LadderDown/ButtonUp2".show()
		$"Level 3/Ladder/LadderDown/ButtonUp2".disabled = false

func _on_ladder_down_body_exited(body):
	if body is CharacterBody2D :
		$"Level 3/Ladder/LadderDown/ButtonUp2".hide()
		$"Level 3/Ladder/LadderDown/ButtonUp2".disabled = true

func _on_win_body_entered(body):
	if body is CharacterBody2D:
		$WinLayer.show()
		$"Level 3/Player/MobileControle".hide()
		SystemLevel.Level = 4
		CheckpointSys.Lvl3Checkpoint1 = false
		CheckpointSys.Lvl3Checkpoint2 = false

func _on_gros_piege_body_entered(body):
	if body is CharacterBody2D:
		print("le joueur est entré")
		$"Level 3/RigidBody2D".set_deferred("freeze", false)
		$"Level 3/RigidBody2D".set_deferred("sleeping", false)

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
