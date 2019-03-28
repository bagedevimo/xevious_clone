extends Node2D

export (int) var player_index : int

var player1_texture = preload("res://assets/missiles/player1.png")
var player2_texture = preload("res://assets/missiles/player2.png")

var sprite : Sprite
var speed : int = 500

func _ready():
	sprite = get_node("Sprite")
	
	if player_index == 0:
		sprite.set_texture(player1_texture)
	elif player_index == 1:
		sprite.set_texture(player2_texture)
		
func _process(delta):
	position.y -= (speed * delta)