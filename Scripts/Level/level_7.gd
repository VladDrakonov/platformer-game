extends Node2D

func _ready():
	$Musique.play()
	if CheckpointSys.Lvl7Checkpoint1 == true:
		$Level7/Player.position = Vector2(3106, 24)
	if CheckpointSys.Lvl7Checkpoint2 == true:
		$Level7/Player.position = Vector2(6560, 320)

func _on_mur_letal_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")

func _on_locked_door_body_entered(body):
	if body is CharacterBody2D:
		$Level7/DoorLabel.show()

func _on_locked_door_body_exited(body):
	if body is CharacterBody2D:
		$Level7/DoorLabel.hide()

func _on_checkpoint_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl7Checkpoint1 = true

func _on_checkpoint_2_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl7Checkpoint2 = true

func _on_win_body_entered(body):
	if body is CharacterBody2D:
		$WinLayer.show()
		SystemLevel.Level = 8
		CheckpointSys.Lvl7Checkpoint1 = false
		CheckpointSys.Lvl7Checkpoint2 = false
