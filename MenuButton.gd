extends Button

func _on_MenuButton_button_down():
	$Click.play()
	get_tree().change_scene("res://StartScreen.tscn")
