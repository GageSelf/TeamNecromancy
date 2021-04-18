extends Area2D
#signal hit

export var speed = 400
var screen_size
var score = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	

func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		velocity.x += 1
		$AnimatedSprite.animation = "Right"
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		velocity.x -= 1
		$AnimatedSprite.animation = "Right"
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$AnimatedSprite.animation = "Down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$AnimatedSprite.animation = "Up"
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 30, 450)
	position.y = clamp(position.y, 50, 200)
	
	


func _on_Player_body_entered(body):
	if body.is_in_group("Bad"):
		hide()
	if body.is_in_group("Good"):
		score += 1
	#score += 1
	#print(score)
	#emit_signal("hit")
	#$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
