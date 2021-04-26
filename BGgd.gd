extends Sprite


var defaultX = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	defaultX = position.y
	pass # Replace with function body.

func _process(delta):
	if position.y < -81:
		position.y = 0
	position.y -= 3; #Speed
