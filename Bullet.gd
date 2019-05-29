extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Vector2) var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var _collision = move_and_collide(velocity * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
