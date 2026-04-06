extends CharacterBody2D
class_name human_male

const speed : float = 100

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_axis("left" , "right"), 
		Input.get_axis("up" , "down")
		)
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * speed
		animation(input_vector)
	else:
		velocity = velocity.move_toward(Vector2.ZERO , speed * delta * 10)
		animated_sprite.play("idle")
	
	move_and_slide()

func animation(direction : Vector2):
	if abs(direction.x) > abs(direction.y):
		animated_sprite.play("side")
		animated_sprite.flip_h = direction.x < 0
	else:
		if direction.y < 0:
			animated_sprite.play("back")
		else:
			animated_sprite.play("front")
