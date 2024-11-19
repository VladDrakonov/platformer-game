extends Node

var Level_Max = 1 #nombre de level débloquer
var Level = 1 #level actuellement jouable

#si le nombre de level jouable est plus grand que le nombre
#de level débloquer
func _process(_delta):
	if Level > Level_Max : 
		Level_Max = Level 

func _input(_event):
	if Input.is_action_pressed("ui_cancel"):
		pass
