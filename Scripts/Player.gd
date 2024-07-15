extends CharacterBody2D

const SPEED = 400.0
const BOOST = 500.0
const LAYERS = [6,16,5,32,24]
const DAMAGES =[0.1,0.1,0.3,0.3,0.5]
var health = 100
var alive = true

signal player_dead

func _physics_process(delta):
	if not alive:
		return
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("left","right","up","down")
	water_damage()
	
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


func water_damage():
	var areas = %Area2D.get_overlapping_areas()
	var layer = []
	for i in areas:
		layer.append(i.get_collision_layer())
	for j in range(len(layer)):
		for i in range(len(LAYERS)):
			if LAYERS[i] == layer[j]:
				take_damage(DAMAGES[i])

func take_damage(x):
	health -= x
	%healthbar.value = health
	if health < 0:
		health = 0
		alive = false
		player_dead.emit()

func hit_plastic():
	health = 0
	alive = false
	%healthbar.value = health
	player_dead.emit()
