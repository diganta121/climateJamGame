extends CharacterBody2D
@onready var player = get_node("/root/Scene/Player")
const  SPEED = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var distance_to_player = global_position.distance_to(player.global_position)
	var rand_velocity = randi_range(-1,1)
	if distance_to_player < 2000:
		if distance_to_player > 100+rand_velocity:
			var direction = global_position.direction_to(player.global_position)
			var other_fish = $area.has_overlapping_areas()
			
			if other_fish:
				velocity = direction * (SPEED -40 + rand_velocity*30)
				velocity.y -= rand_velocity * 40
				velocity.x += rand_velocity * 30
			else:
				velocity = direction * SPEED
		else:
			velocity = Vector2.ZERO
	else:
			velocity = Vector2.ZERO
	move_and_slide()
