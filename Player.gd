extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var player : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed(player + "_down"):
		position.y += 5
		
	if Input.is_action_pressed(player + "_right"):
		position.x += 5
		
	if Input.is_action_pressed(player + "_left"):
		position.x -= 5
		
	if Input.is_action_pressed(player + "_up"):
		position.y -= 5