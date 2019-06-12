extends KinematicBody2D

export (int) var player_index : int

var player1_texture = preload("res://assets/missiles/player1.png")
var player2_texture = preload("res://assets/missiles/player2.png")

var sprite : Sprite
var speed : int = 650

func _ready():
	sprite = get_node("Sprite")
	
	if player_index == 0:
		sprite.set_texture(player1_texture)
	elif player_index == 1:
		sprite.set_texture(player2_texture)
		
#warning-ignore:unused_argument
func _process(delta):
	pass
	
func _physics_process(delta):
	var move = Vector2(0, -speed * delta)
	var collision : KinematicCollision2D = move_and_collide(move)
	
	if collision:
		print("Collided with: %s", collision.collider)
		var enemy : Enemy = collision.collider.owner
		enemy.hit()