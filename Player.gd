extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var PlayerIndex : int

var player1_texture = preload("res://assets/ships/player1.png")
var player2_texture = preload("res://assets/ships/player2.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = get_node("Sprite")
	
	if PlayerIndex == 0:
		sprite.set_texture(player1_texture)
	elif PlayerIndex == 1:
		sprite.set_texture(player2_texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("p%d_down" % (PlayerIndex + 1)):
		position.y += 5
		
	if Input.is_action_pressed("p%d_right" % (PlayerIndex + 1)):
		position.x += 5
		
	if Input.is_action_pressed("p%d_left" % (PlayerIndex + 1)):
		position.x -= 5
		
	if Input.is_action_pressed("p%d_up" % (PlayerIndex + 1)):
		position.y -= 5