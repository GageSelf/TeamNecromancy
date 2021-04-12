extends Node

export (PackedScene) var Obstacles
var score

func _ready():
	randomize()
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_StartTimer_timeout():
	$ObstacleTimer.start()
	$ScoreTimer.start() # Replace with function body.


func _on_ScoreTimer_timeout():
	score += 1 # Replace with function body.


func _on_ObstacleTimer_timeout():
	$ObstaclePath/MobSpawnLocation.offset = randi()
	# Create a Mob instance and add it to the scene.
	var obstacle = preload("Obstacles.gd").instance()
	add_child(obstacle)
	# Set the mob's direction perpendicular to the path direction.
	var direction = $ObstaclePath/MobSpawnLocation.rotation + PI / 2
	# Set the mob's position to a random location.
	obstacle.position = $ObstaclePath/MobSpawnLocation.position
	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	obstacle.rotation = direction
	# Set the velocity (speed & direction).
	obstacle.linear_velocity = Vector2(rand_range(obstacle.min_speed, obstacle.max_speed), 0)
	obstacle.linear_velocity = obstacle.linear_velocity.rotated(direction) # Replace with function body.
