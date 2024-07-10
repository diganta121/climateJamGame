extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var fishes = %Area2D.get_overlapping_bodies()
	if fishes.size() >0:

		var body = fishes.front()
		if body.has_method('hit_plastic'):
			if body.alive:
				body.hit_plastic()
				
