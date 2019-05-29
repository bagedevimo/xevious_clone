extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var p2_playing : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_stage_node():
	var root = get_tree().get_root()
	return root.get_child(root.get_child_count()-1)
	
func enable_p2():
	p2_playing = true
	
func is_p2_playing():
	return p2_playing