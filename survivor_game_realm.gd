extends Node2D
var kills  :=  0

	


func spawn_mob():
	const MOB := preload("res://slime_enemy.tscn")
	var new_mob = MOB.instantiate()
	new_mob.enemy_die.connect(enemy_die)
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	
	


func _on_player_1_health_depleted():
	%gameover.visible = true
	get_tree().paused = true


func enemy_die():
	kills += 1
	%score_display.text = str(kills)
