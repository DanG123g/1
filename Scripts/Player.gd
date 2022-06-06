extends KinematicBody2D

const moveSpeed = 25
const maxSpeed = 100

const jumpHeigth = -300
const gravity = 15
const up = Vector2(0, -1)
onready var sprite =$Sprite 
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(_delta):
	
	motion.y += gravity
	var friccion = false 
	
	if Input.is_action_pressed("ui_right"):
	   sprite.flip_h = true
	   animationPlayer.play("Walk")  
	   motion.x = min(motion.x + moveSpeed,maxSpeed)
	
	elif Input.is_action_pressed("ui_left"):
	   sprite.flip_h = false
	   animationPlayer.play("Walk")  
	   motion.x = max(motion.x - moveSpeed,-maxSpeed)
	
	else:
		animationPlayer.play("Idle")
		friccion = true 
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumpHeigth
		if friccion == true:
			motion.x = lerp(motion.x ,0,0.5)
	else:
		if friccion==true:
			motion.x = lerp(motion.x ,0,0.01)
			
			
	motion = move_and_slide(motion, up)
