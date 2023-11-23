extends Node2D


func _ready():
	get_node("/root/MainHud").lives -= 0
	get_node("/root/MainHud").score -= 0
	pass #
