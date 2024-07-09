extends CharacterBody2D


const SPEED = 400.0
const BOOST = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	# Add the gravity.
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.x = BOOST

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left","right","up","down")

	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()
