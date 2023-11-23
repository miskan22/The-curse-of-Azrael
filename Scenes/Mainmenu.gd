extends Control





func _on_START_pressed():
	get_tree().change_scene("res://World Scenes/World1.tscn")





func _on_Optionsbtn_pressed():
	get_tree().change_scene("res://Scenes/Optionsmenu.tscn")






func _on_Quitbtn_pressed():
	get_tree().quit()
