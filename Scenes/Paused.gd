extends Control

func _physics_process(delta):
	if Input.is_action_pressed("Pause"):
		visible = true
		get_tree().paused = true
		
func _on_Resumebtn_pressed():
	hide()
	get_tree().paused = false


func _on_Quitbtn_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Mainmenu.tscn")
