extends Button

func _on_RestartButton_button_down():
		$Click.play()
		get_tree().change_scene("res://Main.tscn")
