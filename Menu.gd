extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_playing():
	if get_tree().change_scene("res://Stage.tscn") != OK:
		print("Failed to load the scene")

func _on_SinglePlayerButton_pressed():
	start_playing()

func _on_TwoPlayerButton_pressed():
	Globals.enable_p2()
	start_playing()
