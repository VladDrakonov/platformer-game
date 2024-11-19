extends Node2D

func _ready():
	$Musique.play()
	if CheckpointSys.Lvl9Checkpoint1_1 == true:
		$Player.position = Vector2(1429,623)
	if CheckpointSys.Lvl9Checkpoint1_2 == true:
		$Player.position = Vector2(1954,623)
		
func _on_ladder_body_entered(body):
	if body is CharacterBody2D:
		$"Level 9/LadderButton".show()

func _on_ladder_body_exited(body):
	if body is CharacterBody2D:
		$"Level 9/LadderButton".hide()

func _on_roof_killer_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")
			
func _on_mur_letal_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")
			
func _on_ladder_button_pressed():
	$Player.position = Vector2(482,-272)

func _on_collapse_body_entered(body):
	if body is CharacterBody2D:
		$"Level 9/COLLAPSE/CollisionShape2D".set_deferred("disabled",true)
		$"Level 9/SupportRigid/CollisionShape2D10".set_deferred("disabled",true)
		$"Level 9/Collapse Manager/TimeBeforeCollapse".start()
		$"Level 9/Collapse Manager/Earthquake".play()
		$"Level 9/Collapse Manager/FloorCollapse".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse2".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse3".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse4".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse5".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse6".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse7".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse8".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse9".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse10".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/FloorCollapse11".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/RoofCollapse".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/RoofCollapse2".set_deferred("sleeping",false)
		$"Level 9/Collapse Manager/RoofCollapse".set_deferred("freeze",false)
		$"Level 9/Collapse Manager/RoofCollapse2".set_deferred("freeze",false)
		
func _on_time_before_collapse_timeout():
	$"Level 9/Collapse Manager/Collapse".start()
	$"Level 9/Collapse Manager/Roof".start()

func _on_collapse_timeout():
	$"Level 9/Collapse Manager/Collapse2".start()
	$"Level 9/SupportRigid/CollisionShape2D6".disabled= true

func _on_collapse_2_timeout():
	$"Level 9/Collapse Manager/Collapse3".start()
	$"Level 9/SupportRigid/CollisionShape2D5".disabled= true
	$"Level 9/SupportRigid/CollisionShape2D7".disabled= true

func _on_collapse_3_timeout():
	$"Level 9/Collapse Manager/Collapse4".start()
	$"Level 9/SupportRigid/CollisionShape2D4".disabled= true
	$"Level 9/SupportRigid/CollisionShape2D8".disabled= true

func _on_collapse_4_timeout():
	$"Level 9/Collapse Manager/Collapse5".start()
	$"Level 9/SupportRigid/CollisionShape2D3".disabled= true
	$"Level 9/SupportRigid/CollisionShape2D9".disabled= true
	
func _on_collapse_5_timeout():
	$"Level 9/Collapse Manager/Collapse6".start()
	$"Level 9/SupportRigid/CollisionShape2D2".disabled= true
	$"Level 9/SupportRigid/CollisionShape2D11".disabled= true

func _on_collapse_6_timeout():
	$"Level 9/SupportRigid/CollisionShape2D".disabled= true
	$"Level 9/SupportRigid/CollisionShape2D12".disabled= true

func _on_roof_timeout():
	$"Level 9/SupportRigid/Roof".set_deferred("disabled",true)
	$"Level 9/SupportRigid/Roof2".set_deferred("disabled",true)

func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		$"Level 9/Mur2/CollisionShape2D7".set_deferred("disabled",true)
		$"Level 9/RigidTimer".start()

func _on_rigid_timer_timeout():
		$"Level 9/Mur2/CollisionShape2D7".set_deferred("disabled",false)

func _on_checkpoint_1_1_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl9Checkpoint1_1 = true
		
func _on_checkpoint_1_2_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl9Checkpoint1_2 = true
		
func _on_checkpoint_2_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl9Checkpoint3 = true
	
func _on_win_body_entered(body):
	if body is CharacterBody2D:
		$Win_Layer.show()
		SystemLevel.Level = 10
		CheckpointSys.Lvl9Checkpoint1_1 = false
		CheckpointSys.Lvl9Checkpoint1_2 = false
		CheckpointSys.Lvl9Checkpoint3 = false
