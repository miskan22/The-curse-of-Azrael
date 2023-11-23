extends Area2D


func _ready():
	pass


func _on_Merchant_body_entered(body):
	if body.name == "Player":
		get_tree().paused = true
		get_node("Shop/Anim").play("TransIn")
		
 
