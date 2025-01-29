extends CharacterBody2D

var player
var health = 2
signal enemy_die

func _ready():
	player = get_node("/root/main_game/Player1")
	%Slime.play_walk()
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200 
	move_and_slide()
	
func take_damage():
	const SMOKE =preload("res://smoke_explosion/smoke_explosion.tscn")
	var dead = SMOKE.instantiate()
	
	
	health -= 1
	%Slime.play_hurt()
	if health == 0:
		enemy_die.emit()
		queue_free()
		get_parent().add_child(dead)
		dead.global_position = global_position
		
