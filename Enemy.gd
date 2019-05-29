class_name Enemy

extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var start_attack = false
var path_node

export(Array) var targets = []
export(int) var health = 100
export(bool) var repeats = false

var Bullet = preload("res://Bullet.tscn")

var direction = 1
var speed = 300

signal shoot

# Called when the node enters the scene tree for the first time.
func _ready():
	path_node = get_node("PathFollow2D")
	self.connect("shoot", Globals.get_stage_node(), "_do_shoot")
	path_node.unit_offset = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_node.offset += (speed * direction) * delta
	
	if path_node.unit_offset > 1 && start_attack:
		direction = -1	
		path_node.unit_offset = 1.0
	elif path_node.unit_offset < 0 && start_attack:
		direction = 1
		path_node.unit_offset = 0

	if health <= 0:
		queue_free()
	pass


func _on_VisibilityNotifier2D_screen_entered():
	start_attack = true
	get_node("ShootTimer").start()

func hit():
	health -= 100


func _on_ShootTimer_timeout():
	var player1 = Globals.get_stage_node().find_node("Player1")
	if player1:
		var direction = player1.global_position - find_node("Sprite").global_position
		emit_signal("shoot", Bullet, get_node("PathFollow2D").get_global_transform_with_canvas().get_origin(), direction)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
