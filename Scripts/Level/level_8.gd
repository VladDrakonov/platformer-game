extends Node2D

func _ready():
	$Musique.play()
	$"Level 8/RUN".hide()
	$"Level 8/IndexLabel".hide()
	if CheckpointSys.Lvl8Checkpoint1 == true:
		$Player.position = Vector2(-5336,3567)

func _on_rigid_body_2d_body_entered(body):
	if body is CharacterBody2D:
		print("le joueur est entré dans le piège")
		$"Level 8/RigidBody2D".freeze = false

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		print("le joueur est entré dans le piège")
		$"Level 8/Mur/Piege".set_deferred("disabled", true)
		$"Level 8/Pont/AudioStreamPlayer2D".play()

func _on_Gros_Pierre_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")
			
func _on_rock_piege_body_entered(body):
	if body is CharacterBody2D:
		$"Level 8/RUN".show()
		$"Level 8/RUN/Timer".start()
		$"Level 8/Mur/BlockPiere".set_deferred("disabled", true)

func _on_timer_timeout():
	$"Level 8/RUN".hide()

func _on_break_bridge_body_entered(body):
	if body is RigidBody2D:
		$BrokenBridgeManager/AudioStreamPlayer2D.play()
		$BrokenBridgeManager/RigidBody2D.set_deferred("sleeping", false)
		$BrokenBridgeManager/RigidBody2D2.set_deferred("sleeping", false)
		$BrokenBridgeManager/RigidBody2D3.set_deferred("sleeping", false)
		$BrokenBridgeManager/RigidBody2D.set_deferred("freeze", false)
		$BrokenBridgeManager/RigidBody2D2.set_deferred("freeze", false)
		$BrokenBridgeManager/RigidBody2D3.set_deferred("freeze", false)

func _on_player_area_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		$DeadLayer/AnimatedSprite2D.play("Dead")

func _on_rigid_body_entered(body):
	if body is RigidBody2D:
		$"Level 8/GrosBlock".set_deferred("freeze", false)
		$"Level 8/GrosBlock".set_deferred("sleeping", false)
		$"Level 8/GrosBlock/PlayerArea/CollisionShape2D".call_deferred("set_disabled", true)

func _on_text_area_body_entered(body):
	if body is RigidBody2D:
		$"Level 8/IndexLabel".show()
		$"Level 8/AnimationPlayer".play("TextTransparant")

func _on_Sol_Piege_2d_body_entered(body):
	if body is CharacterBody2D:
		$"Level 8/RigidBody2D".set_deferred("freeze", false)
		$"Level 8/RigidBody2D".set_deferred("sleeping", false)
		$"Level 8/RigidBody2D/AudioStreamPlayer2D".play()

func _on_suite_body_entered(body):
	if body is CharacterBody2D:
		$"Level 8/RigidBody2D2".set_deferred("freeze", false)
		$"Level 8/RigidBody2D2".set_deferred("sleeping", false)
		$"Level 8/RigidBody2D3".set_deferred("freeze", false)
		$"Level 8/RigidBody2D3".set_deferred("sleeping", false)
		$"Level 8/RigidBody2D4".set_deferred("freeze", false)
		$"Level 8/RigidBody2D4".set_deferred("sleeping", false)
		$"Level 8/RigidBody2D5".set_deferred("freeze", false)
		$"Level 8/RigidBody2D5".set_deferred("sleeping", false)
		$"Level 8/RigidBody2D3/AudioStreamPlayer2D".set_deferred("playing", true)
		$"Level 8/RigidBody2D2/CollisionShape2D".set_deferred("disabled", true)
		$"Level 8/RigidBody2D3/CollisionShape2D".set_deferred("disabled", true)
		$"Level 8/RigidBody2D4/CollisionShape2D".set_deferred("disabled", true)
		$"Level 8/RigidBody2D5/CollisionShape2D".set_deferred("disabled", true)

func _on_checkpoint_1_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl8Checkpoint1 = true

func _on_win_body_entered(body):
	if body is CharacterBody2D:
		$WinLayer.show()
		SystemLevel.Level = 9
		CheckpointSys.Lvl8Checkpoint1 = false

func _on_mur_letal_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")
