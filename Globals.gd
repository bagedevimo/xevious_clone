extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var p2_playing : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_stage_node():
	var root = get_tree().get_root()
	return root.get_child(root.get_child_count()-1)
	
func enable_p2():
	p2_playing = true
	
func is_p2_playing():
	return p2_playing
	
func get_closest_player(point : Vector2):
	var player1 = get_stage_node().find_node("Player1", false, false)
	var player2 = get_stage_node().find_node("Player2", false, false)
	
	var distanceToPlayer1 = INF
	var distanceToPlayer2 = INF
	
	if player1:
		distanceToPlayer1 = player1.global_position.distance_to(point)
	
	if player2:
		distanceToPlayer2 = player2.global_position.distance_to(point)

	if distanceToPlayer1 > distanceToPlayer2:
		return player2
	else:
		return player1