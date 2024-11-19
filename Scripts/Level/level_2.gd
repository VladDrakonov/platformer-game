extends Node2D

func _ready():
	SystemLevel.Level = 2
	$Musique.play()
	if CheckpointSys.Lvl2Checkpoint1 == true :
		print("checkpoint activé")
		$"Level 2/Player".position = Vector2(2936, 703)

func _on_mur_letal_body_entered(body) :
	if body is CharacterBody2D :
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")

func _on_zone_fragile_body_entered(body) :
	if body is CharacterBody2D :
		print("zone fragile activé level 2")
		$"Level 2/ZoneFragile/TileZoneFragile".hide()
		$"Level 2/ZoneFragile/Break".play()

func _on_checkpoint_body_entered(body):
	if body is CharacterBody2D :
		print("checkpoint activé")
		CheckpointSys.Lvl2Checkpoint1  = true

func _on_win_body_entered(body) :
	if body is CharacterBody2D :
		print("winBody level 2 activé")
		SystemLevel.Level = 3
		$WinLayer.show()
		CheckpointSys.Lvl2Checkpoint1  = false

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D :
		$"Level 2/Bridge/AudioStreamPlayer2D".play()
		$"Level 2/Bridge".set_deferred("can_sleep", false)
		$"Level 2/Bridge".set_deferred("freeze", false)

func _on_rigid_del_body_entered(body):
	if body is RigidBody2D :
		$"Level 2/Bridge/Sprite2D".set_deferred("visible", false)
		$"Level 2/Bridge/CollisionShape2D".set_deferred("disabled", true)

func _on_panneau_text_body_entered(body):
	if body is CharacterBody2D :
		$"Level 2/WarningLabel".show()
func _on_panneau_text_body_exited(body):
	if body is CharacterBody2D :
		$"Level 2/WarningLabel".hide()
