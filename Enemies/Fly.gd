extends KinematicBody2D

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO
var is_dead = false

export(int) var hp = 1
export(int) var SPEED = 80

onready var sprite = $AnimatedSprite
	
func dead():
	hp -= 1
	if hp <= 0:
		is_dead = true
		velocity = Vector2.ZERO
		$AnimatedSprite.play("Death")
		get_node("/root/MainHud").score += 20
		$CollisionShape2D.disabled = true
		$Timer.start()
	

func _physics_process(delta):
	if is_dead == false:
		var found_wall = is_on_wall()
		if found_wall:
			direction *= -1
		$AnimatedSprite.play("Idle")
		sprite.flip_h = - direction.x > 0
		velocity = direction * 140
		move_and_slide(velocity, Vector2.UP)

	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_node("/root/MainHud").lives -= 1
				get_slide_collision(i).collider.dead()



func _on_Timer_timeout():
	queue_free()
