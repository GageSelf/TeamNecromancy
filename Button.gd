extends Button

func _on_Button_button_down():
	$Click.play()
	get_tree().change_scene("res://Main.tscn")
