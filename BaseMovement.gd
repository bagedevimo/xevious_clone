class_name BaseMovement

extends Node

var parent = false

export var running = false

func _ready():
	parent = get_parent()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	run_movement()
	pass

func run_movement():
	pass