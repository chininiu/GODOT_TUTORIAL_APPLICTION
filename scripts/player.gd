extends CharacterBody2D

signal health_depleted
var health := 100.0
const DAMAGE_RATE := 100

func _physics_process(delta):
	var direction = Input.get_vector("move_left" , "move_right" , "move_up" , "move_down")
	velocity = direction * 600
	move_and_slide()

	print(velocity.length())
	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
		
	elif velocity.length() == 0.0:
		get_node("HappyBoo").play_idle_animation()
	
	var hurt = %hitbox.get_overlapping_bodies()
	
	if hurt.size() > 0:
		health -= DAMAGE_RATE * hurt.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
	
	
	
	
	
