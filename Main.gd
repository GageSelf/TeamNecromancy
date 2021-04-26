extends Node

export (PackedScene) var Mob
export (PackedScene) var Obstacle
export (PackedScene) var Obstacle2
export var score = 0

func _ready():
	randomize()
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	passMob



func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$ObstacleTimer.stop()


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start() 
	$ObstacleTimer.start()
	
	
	
	
	


func _on_ScoreTimer_timeout():
	score += 1
	
	#print($MobPath/MobSpawnLocation.position.x, " ", $ObstaclePath/ObstacleSpawnLocation.position.x)
	
	if(abs($MobPath/MobSpawnLocation.position.x - $ObstaclePath/ObstacleSpawnLocation.position.x) <= 100):
		if($MobPath/MobSpawnLocation.position.x >= 100):
			$MobPath/MobSpawnLocation.position.x = $MobPath/MobSpawnLocation.position.x*2
			if($MobPath/MobSpawnLocation.position.x > 480):
				$MobPath/MobSpawnLocation.position.x = ($MobPath/MobSpawnLocation.position.x - 480) / 2
		else:
			$MobPath/MobSpawnLocation.position.x += 75



func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.offset = randi()
	# Create a Mob instance and add it to the scene.
	var mob = Mob.instance()
	add_child(mob)
	# Set the mob's direction perpendicular to the path direction.
	var direction = 3 * PI / 2 #$MobPath/MobSpawnLocation.rotation + PI / 2
	# Set the mob's position to a random location.
	mob.position = $MobPath/MobSpawnLocation.position
	# Add some randomness to the direction.
	mob.rotation =  0
	# Set the velocity (speed & direction).
	mob.linear_velocity = Vector2(500, 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
	
	
	
func _on_ObstacleTimer_timeout():
	$ObstaclePath/ObstacleSpawnLocation.offset = randi()
	var obstacle = Obstacle.instance()
	
	add_child(obstacle)
	
	var direction = 3*PI/2
	
	obstacle.position = $ObstaclePath/ObstacleSpawnLocation.position
	
	obstacle.rotation = 0
	
	obstacle.linear_velocity = Vector2(500,0)
	obstacle.linear_velocity = obstacle.linear_velocity.rotated(direction)


func _on_Player_EndGame():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$ObstacleTimer.stop()
	$Player.hide()
