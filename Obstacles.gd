extends RigidBody2D

export var min_speed = 150
export var max_speed = 250

func _ready():
	var ObstacleTypes = $AnimatedSprite.frames.get_animation_names()
	var currentObstical = ObstacleTypes[randi() % ObstacleTypes.size()]
	$AnimatedSprite.animation = currentObstical
	if currentObstical == "Stump":
		$AnimatedSprite/AnimationPlayer.play("Stump")
	else:
		$AnimatedSprite/AnimationPlayer.play("Default")
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

