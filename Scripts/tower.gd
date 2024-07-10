extends Node2D

@onready var Game = get_node("/root/Game")

var state = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_area_entered(area):
	if not state:
		state = true
		%screen1.set_animation('green')
		%screen2.set_animation('green')
		print("greeeen")
