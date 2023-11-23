extends Area2D

const Speed =600
var velocity = Vector2()
var direction = 1

	
func set_arrow_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true
	
	
func _physics_process(delta):
	velocity.x = Speed * delta * direction
	translate(velocity)
	$AnimatedSprite.play("Shoot")
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Arrow_body_entered(body):
	if "Mushroom" in body.name:
			body.dead()
	if "HellHound" in body.name:
		body.dead()
	if "Gato" in body.name:
		body.dead()
	if "Skeleton" in body.name:
		body.dead()
	if "Boss" in body.name:
		body.dead()
	if "Bug" in body.name:
		body.dead()
	if "Flying Eye" in body.name:
		body.dead()
	if "Goblin" in body.name:
		body.dead()
	if "Ghost" in body.name:
		body.dead()
	if "Spider" in body.name:
		body.dead()
	queue_free()
