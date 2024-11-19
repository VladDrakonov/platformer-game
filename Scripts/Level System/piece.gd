extends Node2D

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		SystemLevel.piece += 1
		$Area2D.disable_mode = true
		$Sprite2D.visible = false
