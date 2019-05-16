class_name Enemy

extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var start_attack = false
var path_node

export(Array) var targets = []
export(int) var health = 100

var Bullet = preload("res://Bullet.tscn")

signal shoot

func find_parent_most_parent():
	var best = get_parent()
	while best.get_parent().name != "root":
		best = best.get_parent()
		
	return best

# Called when the node enters the scene tree for the first time.
func _ready():
	path_node = get_node("PathFollow2D")
	
	var target = find_parent_most_parent()
	print("Target: %s", target.name)
	self.connect("shoot", target, "_do_shoot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if path_node.unit_offset < 1 && start_attack:
		path_node.unit_offset += (0.1 * delta)
		
	if health <= 0:
		queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	start_attack = true
	get_node("ShootTimer").start()
	print("Starting the attack run!")

func hit():
	print("Hit!")
	health -= 100


func _on_ShootTimer_timeout():
	
	emit_signal("shoot", Bullet, get_node("PathFollow2D").get_global_transform_with_canvas().get_origin(), rotation)