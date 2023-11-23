extends Node2D
var score = 0 setget set_score
var lives = 5 setget set_lives
var max_score = 9999

func _process(delta):
	get_node("/root/MainHud/HUD/Score").show()
	get_node("/root/MainHud/HUD/Lives").show()
	
	if get_tree().current_scene.name == "Splashscreen":
		get_node("/root/MainHud/HUD/Score").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "Mainmenu":
		get_node("/root/MainHud/HUD/Score").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
	
	if get_tree().current_scene.name == "Dead":
		get_node("/root/MainHud/HUD/Score").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "Credits":
		get_node("/root/MainHud/HUD/Score").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "Optionsmenu":
		get_node("/root/MainHud/HUD/Score").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
		
	if get_tree().current_scene.name == "Sounds":
		get_node("/root/MainHud/HUD/Score").hide()
		get_node("/root/MainHud/HUD/Lives").hide()
	
	pass
	
func set_score(value):
	score = value
	get_node("/root/MainHud/HUD/Score").set_text("SCORE: "+str(score))
	if score >= max_score:
		get_tree().change_scene("res://scene/")
		
		score = 0
		lives = 5
		get_node("/root/MainHud/HUD/Score").set_text("SCORE: "+str(score))
		get_node("/root/MainHud/HUD/Lives").set_text("LIVES: "+str(lives))
	pass

func set_lives(value):
	lives = value
	get_node("/root/MainHud/HUD/Lives").set_text("LIVES: "+str(lives))
	if lives <= 0:
		get_tree().change_scene("res://Scenes/Dead.tscn")
		
		get_node("/root/MainHud/HUD/Lives").set_text("LIVES: "+str(lives))
	pass
