extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	passMob


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start() # Replace with function body.


func _on_ScoreTimer_timeout():
	score += 1 # Replace with function body.


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
	mob.rotation =  3 * PI / 2
	# Set the velocity (speed & direction).
	mob.linear_velocity = Vector2(300, 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
