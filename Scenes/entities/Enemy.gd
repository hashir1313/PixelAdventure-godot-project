extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var level = $".."
var speed = 80
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_right = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if $left.is_colliding():
		var collider = $left.get_collider()
		if collider.name.begins_with("Enemy"):
			flip()
	
	if $right.is_colliding():
		var collider = $right.get_collider()
		if collider.name.begins_with("Enemy"):
			flip()
	
	if !$"left down".is_colliding() && is_on_floor():
		flip()
	
	if !$"right down".is_colliding() && is_on_floor():
		flip()
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else :
		speed = abs(speed) * -1

func _on_area_2d_body_entered(body):
	if body.name == "Player": 
		get_tree().reload_current_scene()
		Engine.time_scale = 1


func _on_death_hitbox_body_entered(body):
	if body.name == "Player" : 
		queue_free()


