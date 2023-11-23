extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)
	$AnimationPlayer.play("fadein")
	yield(get_tree().create_timer(4), "timeout")
	$AnimationPlayer.play("fadeout")
	yield(get_tree().create_timer(4.5), "timeout")
	get_tree().change_scene("res://Scenes/Mainmenu.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
