extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const Bullet = preload("res://Bullet.tscn")
const Player = preload("res://Player.tscn")

export(int) var bullet_speed = 100

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var player1 = Player.instance()
	player1.position = $Player1SpawnPosition.position
	player1.player_index = 0
	player1.set_name("Player1")
	add_child(player1)
		
	if Globals.is_p2_playing():
		var player2 = Player.instance()
		player2.position = $Player2SpawnPosition.position
		player2.player_index = 1
		player2.set_name("Player2")
		add_child(player2)
	
func _do_shoot(position, direction):
	var new_bullet = Bullet.instance()
	add_child(new_bullet)
	
	var normalised_direction = direction.normalized() * bullet_speed

	new_bullet.position = position
	new_bullet.velocity = normalised_direction

func _on_enemy_died(point_value):
	score += point_value
	print("Score is: %d", score)
	$CurrentLevel/UI.score_changed(score)