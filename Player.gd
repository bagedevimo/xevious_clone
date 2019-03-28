extends Node2D

export (int) var player_index : int

var player1_texture = preload("res://assets/ships/player1.png")
var player2_texture = preload("res://assets/ships/player2.png")

const MISSILE = preload("res://Missile.tscn")

var screensize = OS.window_size
var sprite : Sprite
var sprite_size : Vector2
var shot_timer : Timer
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
	if Input.is_action_pressed("p%d_down" % (player_index + 1)):
		position.y += 5
		
	if Input.is_action_pressed("p%d_right" % (player_index + 1)):
		position.x += 5
		
	if Input.is_action_pressed("p%d_left" % (player_index + 1)):
		position.x -= 5
		
	if Input.is_action_pressed("p%d_up" % (player_index + 1)):
		position.y -= 5
		
	if Input.is_action_pressed("p%d_fire" % (player_index + 1)) && shot_ready:
		var new_missile = MISSILE.instance()
		new_missile.player_index = player_index
		new_missile.position = position + get_node("MissileSpawnLocation").position
		get_parent().add_child(new_missile)
		shot_ready = false
		get_node("ShotTimer").start()
		
	
		
	position.x = clamp(position.x, sprite_size.x / 2, screensize.x - (sprite_size.x / 2))
	position.y = clamp(position.y, sprite_size.y / 2, screensize.y - (sprite_size.y / 2))

func _on_ShotTimer_timeout():
	shot_ready = true
