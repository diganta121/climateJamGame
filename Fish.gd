extends CharacterBody2D

var  SPEED = 400

var health = 100
var alive = true

@onready var player = get_node("/root/Game/Player")
@onready var Game = get_node("/root/Game")
# Called when the node enters the scene tree for the first time.
func _ready():
	# variation in health for each fish
	health -= randi_range(-10,40)


func _physics_process(delta):
	velocity = Vector2.ZERO
	if alive:
		var distance_to_player = global_position.distance_to(player.global_position)
		var rand_velocity = randi_range(-1,1)
		if distance_to_player < 2000:
			if distance_to_player > 100+(rand_velocity*20):
				var direction = global_position.direction_to(player.global_position)
				var other_fish = $fishArea.has_overlapping_areas()
				
				if other_fish:
					velocity = direction * (SPEED -40 + rand_velocity*30)
					velocity.y -= rand_velocity * 40
					velocity.x += rand_velocity * 30
				else:
					velocity = direction * SPEED
			else:
				velocity = Vector2.ZERO
		move_and_slide()
	else:
		%CollisionShape2D.disabled = true
		#put dead animation


func take_damage(x):
	health -= x
	if health < 0:
		health = 0
		alive = false

func hit_plastic():
	health = 0
	alive = false
	Game.on_dead_fish()
	
