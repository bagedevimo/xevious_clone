extends KinematicBody2D

export (int) var player_index : int

var player1_texture = preload("res://assets/ships/player1.png")
var player2_texture = preload("res://assets/ships/player2.png")

const MISSILE = preload("res://Missile.tscn")

var sprite : Sprite
var sprite_size : Vector2
var shot_ready : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite 	= get_node("Sprite")
	sprite_size = sprite.texture.get_size()
	
	if player_index == 0:
		sprite.set_texture(player1_texture)
	elif player_index == 1:
		sprite.set_texture(player2_texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var move = Vector2()
	if Input.is_action_pressed("p%d_down" % (player_index + 1)):
		move.y += 5
		
	if Input.is_action_pressed("p%d_right" % (player_index + 1)):
		move.x += 5
		
	if Input.is_action_pressed("p%d_left" % (player_index + 1)):
		move.x -= 5
		
	if Input.is_action_pressed("p%d_up" % (player_index + 1)):
		move.y -= 5
		
	if Input.is_action_pressed("p%d_fire" % (player_index + 1)) && shot_ready:
		var new_missile = MISSILE.instance()
		new_missile.player_index = player_index
		new_missile.position = position + get_node("MissileSpawnLocation").position
		Globals.get_stage_node().add_child(new_missile)
		shot_ready = false
		get_node("ShotTimer").start()
		
	var collision = move_and_collide(move)
	if collision:
		print("Collding with %s", collision.collider.name)
		queue_free()

func _on_ShotTimer_timeout():
	shot_ready = true
