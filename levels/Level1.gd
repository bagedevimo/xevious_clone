extends Node2D

signal enemy_died

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for node in $MovingPart.get_children():
		if node.is_in_group("enemies"):
			node.connect("enemy_died", self, "_on_enemy_died")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var map = get_node("MovingPart")
	map.position.y += 100 * delta


func _on_enemy_died(point_value):
	print("Emitting enemy_died in Level1.gd")
	emit_signal("enemy_died", point_value)