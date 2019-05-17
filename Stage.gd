extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const Bullet = preload("res://Bullet.tscn")

export(int) var bullet_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _do_shoot(type, position, direction):
	print("Shooting", position, direction)
	var new_bullet = Bullet.instance()
	add_child(new_bullet)
	
	var normalised_direction = direction.normalized() * bullet_speed
	
	print("Norm", normalised_direction)

	new_bullet.position = position
	new_bullet.velocity = normalised_direction
	
	