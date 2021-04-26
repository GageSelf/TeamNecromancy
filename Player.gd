extends Area2D
signal EndGame
#signal hit
signal score
#score signal

var target = Vector2()
var velocity = Vector2()


export var speed = 600
var screen_size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	

func _process(delta):

	target = get_global_mouse_position() #This is for mouse

	var distance = target.distance_to(position)
	
	if distance < 100:
		velocity = position.direction_to(target) * sqrt(distance) * 100	
	else:
		velocity = position.direction_to(target) * speed
	
	if velocity.x > 100:
		$AnimatedSprite.animation = "Right"	
	elif velocity.x < -100:
		$AnimatedSprite.animation = "Left"
	else:
		$AnimatedSprite.animation = "Down"


	velocity.y = clamp(velocity.y, -250, 400)	

		
	position += velocity * delta
	position.x = clamp(position.x, 30, 450)
	position.y = clamp(position.y, 50, 200)
	
	


func _on_Player_body_entered(body):
	if body.is_in_group("Bad"):
		emit_signal("EndGame")
		$CollisionShape2D.set_deferred("disabled", true)
	if body.is_in_group("Good"):
		emit_signal("score")
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

