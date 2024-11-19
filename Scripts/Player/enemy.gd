extends CharacterBody2D

var speed = 200

func _process(delta):
	var velocity = Vector2()
	velocity.x = speed
	move_and_slide()
