extends Label

var score = 0

func _ready():
	score = 0
	pass


func _process(_delta):
	text = String(score)


func _on_Player_score():
	score += 1
	pass 
