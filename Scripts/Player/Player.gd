extends CharacterBody2D

@onready var countdown = 500
var speed = 150.0

const JUMP_VELOCITY = -300.0

# take the gravity on the gravity parameter on the godot editor
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	if GlobalSystem.Solder == true:
		$solder_animated_sprite2D.show()
		$orc_animated_spriteD2.hide()
	if GlobalSystem.Orc == true:
		$orc_animated_spriteD2.show()
		$solder_animated_sprite2D.hide()
		
	$count_down.start()
	$name.text = str(GlobalSystem.PlayerName)
	
func _process(_delta) -> void:
	$TimerLabel.text = str(countdown)
	
	if countdown <= 0:
		$DeadLayer.show()
		$CountDown.stop()
		if GlobalSystem.Solder == true:
			$DeadLayer/solder_animated_sprite2D.play("Dead")
		elif GlobalSystem.Orc == true:
			$DeadLayer/orc_animated_sprite2D.play("Dead")

func _physics_process(delta) -> void:
	if not is_on_floor():
		if GlobalSystem.Solder == true:
			$solder_animated_sprite2D.stop()
		elif GlobalSystem.Orc == true:
			$orc_animated_spriteD2.stop()
			
		$Timer.start()
		velocity.y += gravity * delta
	
	# check if the player is on the ground and if the spacebar is pressed
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() :
		velocity.y = JUMP_VELOCITY

	var Direction = Input.get_axis("gauche", "droite")
	if Direction :
		velocity.x = Direction * speed 
	else :
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if  velocity.x != 0 : #check if the player move
		if GlobalSystem.Solder == true:
			$solder_animated_sprite2D.play("walk")
			$solder_animated_sprite2D.flip_h = velocity.x < 0 # return the sprite animator
		elif GlobalSystem.Orc == true:
			$orc_animated_spriteD2.play("walk")
			$orc_animated_spriteD2.flip_h = velocity.x < 0 # return the sprite animator
	else :
		if GlobalSystem.Solder == true:
			$solder_animated_sprite2D.play("idle")
		elif GlobalSystem.Orc == true:
			$orc_animated_spriteD2.play("idle")
			
	move_and_slide()

func _on_count_down_timeout() -> void:
	countdown -= 1
