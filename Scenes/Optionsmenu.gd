extends Control




func _on_Controlsbtn_pressed():
	get_tree().change_scene("res://Scenes/Gamecontrols.tscn")


func _on_Soundbtn_pressed():
	get_tree().change_scene("res://Scenes/Sounds.tscn")
	

func _on_Creditsbtn_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")


func _on_Backbtn_pressed():
	get_tree().change_scene("res://Scenes/Mainmenu.tscn")

