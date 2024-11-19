extends Node2D

func _ready():
	SystemLevel.Level = 5
	$Musique.play()


func _on_win_body_entered(body):
	if body is CharacterBody2D:
		$"Level 5/WinLayer".show()
		$TileMap/Player/MobileControle.hide()
		SystemLevel.Level = 6
