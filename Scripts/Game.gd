extends Node2D

var num_fishes = 24

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_dead_fish():
	num_fishes -=1
	print("dead_fish")
