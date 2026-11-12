extends Node2D
class_name Battle_scene
@onready var player_spawn_pos = $PlayerSpawnPos2
@onready var laser_container = $LaserContainer2
@onready var laser_sound = $SFX/LaserSound
@onready var hit_sound = $SFX/HitSound
var high_score = 0 
var player = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("Fade_in")
	$Fade_transition/AnimationPlayer.play("Fade_out")
	
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
	laser_sound.play()

func _on_player_killed():
	hit_sound.play()
	if player.score > high_score:  #If the player score is greater than the high score then the score becomes the high score.
		high_score = player.score
		
	
