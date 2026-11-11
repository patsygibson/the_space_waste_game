extends Node2D
class_name Battle_scene
@onready var player_spawn_pos = $PlayerSpawnPos2
@onready var laser_container = $LaserContainer
var high_score = 0 
var player = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Fade_transition.show()
	#$Fade_transition/AnimationPlayer.play("Fade_out")
	
	player = get_tree().get_first_node_in_group("player")
	assert(player!= null) 
	player.global_position = player_spawn_pos.global_position
	#this is so that even if you move the player object within the 2D workspace, if you run the game the player will still spawn in the spawn position
	player.laser_shot.connect(_on_player_laser_shot)
	player.killed.connect(_on_player_killed)

func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)
	#laser_sound.play()

func _on_player_killed():
	#hit_sound.play()
	if player.score > high_score:  #If the player score is greater than the high score then the score becomes the high score.
		high_score = player.score
		
	#gos.set_score(player.score)   #setting the score in the gos 
	#gos.set_HighScore(high_score)
	#save_game()
	#
	#await get_tree().create_timer(1).timeout  #So the Game Over Screen doesn't pop up too quickly when the player dies. 
	#gos.visible = true
