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

# Called when the node enters the scene tree for the first time.
func _ready():
	path_node = get_node("PathFollow2D")
	print("Stage is: ", Globals.get_stage_node().name)
	self.connect("shoot", Globals.get_stage_node(), "_do_shoot")

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
	var player1 = Globals.get_stage_node().find_node("Player1")
	var direction = player1.global_position - find_node("Sprite").global_position
	
	print("Direction is", direction)
	
#	var player2 = Globals.get_stage_node().find_node("Player2")
	emit_signal("shoot", Bullet, get_node("PathFollow2D").get_global_transform_with_canvas().get_origin(), direction)