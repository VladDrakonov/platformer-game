extends Node2D

func _ready():
	SystemLevel.Level = 4
	$Musique.play()
	if CheckpointSys.Lvl4Checkpoint1 == true:
		$"Level 4/Player".position = Vector2(2685, 799)
	if CheckpointSys.Lvl4Checkpoint2 == true:
		$"Level 4/Player".position = Vector2(1735, 1383)

func _on_mur_letal_body_entered(body):
	if body is CharacterBody2D:
		$"Level 4/DeadLayer".show()
		if GlobalSystem.Solder == true:
			$"Level 4/DeadLayer/SolderAnimatedSprite2D".play("Dead")
		if GlobalSystem.Orc == true:
			$"Level 4/DeadLayer/OrcAnimatedSprite2D".play("Dead")
			
func _on_mur_letal_2_body_entered(body):
	if body is CharacterBody2D:
		$"Level 4/DeadLayer/".show()
		$"Level 4/DeadLayer/AnimatedSprite2D".play("Dead")
		
func _on_checkpoint_1_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl4Checkpoint1 = true

func _on_checkpoint_2_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl4Checkpoint2 = true

func _on_win_2_body_entered(body):
	if body is CharacterBody2D:
		$"Level 4/Win".show()
		$TileMap/Player/MobileControle.hide()
		CheckpointSys.Lvl4Checkpoint1 = false
		CheckpointSys.Lvl4Checkpoint2 = false
		SystemLevel.Level = 5
