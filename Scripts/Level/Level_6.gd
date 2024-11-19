extends Node2D

func _ready():
	if CheckpointSys.Lvl6Checkpoint1 == true:
		$TileMap/Player.position = Vector2(4838,392)
	if CheckpointSys.Lvl6Checkpoint2 == true:
		$TileMap/Player.position = Vector2(7176,912)

func _on_mur_letal_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		$DeadLayer/AnimatedSprite2D.play("Dead")
	
func _on_text_body_entered(body):
	if body is CharacterBody2D:
		$Text/Start.show()

func _on_text_body_exited(body):
	if body is CharacterBody2D:
		$Text/Start.hide()
		$Text/Bridge.hide()
	
func _on_pancarte_body_entered(body):
	if body is CharacterBody2D:
		$Text/Bridge.show()

func _on_pancarte_body_exited(body):
	if body is CharacterBody2D:
		$Text/Bridge.hide()

func _on_checkpoint_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl6Checkpoint1 = true

func _on_trou_bridge_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/TrouBridge/Casse.play()
		$TileMap/TrouBridge/Sprite2D.hide()
		$TileMap/TrouBridge/CollisionShape2D.disabled = true

func _on_trou_bridge_2_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/TrouBridge2/Sprite2D.hide()
		$TileMap/TrouBridge2/CollisionShape2D.disabled = true
		$TileMap/TrouBridge2/Casse.play()

func _on_trou_bridge_3_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/TrouBridge3/Sprite2D.hide()
		$TileMap/TrouBridge3/CollisionShape2D.disabled = true
		$TileMap/TrouBridge3/Casse.play()

func _on_trou_bridge_4_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/TrouBridge4/Sprite2D.hide()
		$TileMap/TrouBridge4/CollisionShape2D.disabled = true
		$TileMap/TrouBridge4/Casse.play()

func _on_pancarte_bridge_body_entered(body):
	if body is CharacterBody2D:
		$Text/PancarteWarning.show()

func _on_pancarte_bridge_body_exited(body):
	if body is CharacterBody2D:
		$Text/PancarteWarning.hide()

func _on_dead_end_body_entered(body):
	if body is CharacterBody2D:
		$Text/DeadEndLabel.show()
func _on_dead_end_body_exited(body):
	if body is CharacterBody2D:
		$Text/DeadEndLabel.hide()

func _on_grostrou_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/Grostrou/Sprite2D.hide()
		$TileMap/Grostrou/Sprite2D2.hide()
		$TileMap/Grostrou/Sprite2D3.hide()
		$TileMap/Grostrou/Sprite2D4.hide()
		$TileMap/Grostrou/Sprite2D5.hide()
		$TileMap/Grostrou/CollisionShape2D.disabled = true
		$TileMap/Grostrou/Casse.play()

func _on_checkpoint_2_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl6Checkpoint2 = true

func _on_win_body_entered(body):
	if body is CharacterBody2D:
		$Win.show()
