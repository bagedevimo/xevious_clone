extends BaseMovement

var chasing = true
var target = false

export var min_distance = 100
export var speed = 2

func run_movement():
	if chasing:
		run_chasing()
	else:
		run_fleeing()
		
func run_chasing():
	if !has_target():
		choose_target()
	else:
		ensure_target_still_alive()
	
	if is_close_to_target():
		chasing = false
		return
	
	var direction_to_target = target.global_position - parent.global_position
	var movement_vector = direction_to_target.normalized()
	var scaled_movement_vector = movement_vector * speed
	
	print("DD ", direction_to_target, " ", movement_vector)
	
	parent.position += scaled_movement_vector
		
func run_fleeing():
	var direction_to_target = target.global_position - parent.global_position
	var movement_vector = direction_to_target.normalized()
	var scaled_movement_vector = movement_vector * speed
	
	parent.position -= scaled_movement_vector
		
func has_target():
	return (target != null)
	
func is_close_to_target():
	var distance = target.global_position.distance_to(parent.global_position)
	
	return distance <= min_distance

func choose_target():
	target = Globals.get_closest_player(parent.global_position)
	
func ensure_target_still_alive():
	if !target:
		choose_target()