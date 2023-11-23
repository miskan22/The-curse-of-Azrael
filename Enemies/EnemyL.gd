extends KinematicBody2D

const GRAVITY = 10
export(int) var SPEED = 80
const FLOOR = Vector2(0,-1)

var velocity = Vector2()
var direction = -1

var is_dead = false

export(int) var hp = 1

func _ready():
	pass

func dead():
	hp -= 1
	if hp <= 0:
		is_dead = true
		velocity = Vector2(0,0)
		$AnimatedSprite.play("Death")
		$CollisionShape2D.disabled = true
		get_node("/root/MainHud").score += 10
		$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		if direction == -1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *=-1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *=-1
		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_node("/root/MainHud").lives -= 1

func _on_Timer_timeout():
	queue_free()
