extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const Bullet = preload("res://Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _do_shoot(type, position, rotation):
	print("Shooting", position, rotation)
	var new_bullet = Bullet.instance()
	add_child(new_bullet)
	new_bullet.position = position
	new_bullet.rotation = rotation
	new_bullet.velocity = Vector2(10, 10)
	
	