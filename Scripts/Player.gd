extends CharacterBody2D

const SPEED = 400.0
const BOOST = 500.0

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("left","right","up","down")
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
		rotation = 0
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x > 0 
		rotation = direction.angle()
		if velocity.x < 0:
			rotation -=3.2
	else:
		if velocity.y !=0:
			$AnimatedSprite2D.flip_h = false
			if velocity.y >0:
				rotation = -1.57
			elif velocity.y <0:
				rotation = 1.57
	move_and_slide()
