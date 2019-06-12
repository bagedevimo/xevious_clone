extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	lives_changed(1)
	score_changed(0)
	$Lives/AnimationPlayer.play("Blinking");
	

func lives_changed(lives):
	$Lives.text = "%sUP" % [lives]
	
func score_changed(score):
	$Score.text = "Score: %s" % [score]
