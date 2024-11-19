extends Node2D

func _ready():
	$Musique.play()
	if CheckpointSys.Lvl10Checkpoint == true:
		$Player.position = Vector2(-3194,2079)
		
	if GlobalSystem.DoorLockedLvl10 == true:
		$"Level 10/Door/CollisionShape2D".set_deferred("disabled",true)
		$"Level 10/DoorLockedHide".show()
	if GlobalSystem.SecretZoneLvl10 == true:
		$"Level 10/SecretZone".set_deferred("freeze",false)

func _on_mur_letal_body_entered(body):
	if body is CharacterBody2D:
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")

func _on_platform_collapse_body_entered(body):
	if body is CharacterBody2D:
		$"Level 10/Platform".set_deferred("freeze",false)
		$"Level 10/Platform/Break".play()
		$"Level 10/Platform/Timer".start()

func _on_timer_timeout():
	$"Level 10/Platform/Earthquake".play()
	$"Level 10/Mur/CollisionShape2D13".set_deferred("disabled",true)
	
func _on_piller_body_entered(body):
	if body is CharacterBody2D:
		$"Level 10/Piller/CollisionShape2D".set_deferred("disabled",true)
		$"Level 10/PillerCollapse".set_deferred("freeze",false)

func _on_win_body_entered(body):
	if body is CharacterBody2D:
		$WinLayer.show()
		SystemLevel.Level = 11
		CheckpointSys.Lvl10Checkpoint = false

func _on_door_body_entered(body):
	if body is CharacterBody2D:
		$"Level 10/Door/Label".show()

func _on_door_body_exited(body):
	if body is CharacterBody2D:
		$"Level 10/Door/Label".hide()

func _on_button_body_entered(body):
	if body is CharacterBody2D:
		$"Level 10/Button/Sprite2D".hide()
		$"Level 10/Button/CollisionShape2D".set_deferred("disabled",true)
		$"Level 10/Button/AudioStreamPlayer2D".play()
		$"Level 10/Button/Label".show()

func _on_checkpoint_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl10Checkpoint = true
