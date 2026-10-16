extends Node2D

@onready var player_spawn_pos = $PlayerSpawnPos
@onready var laser_container = $LaserContainer

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	assert(player!= null) 
	player.global_position = player_spawn_pos.global_position
	#this is so that even if you move the player object within the 2D workspace, if you run the game the player will still spawn in the spawn position
	player.laser_shot.connect(_on_player_laser_shot)


#If press input "esc" it calls the method quit that is inside get_tree.
func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
#If press input "R" it calls the method reload_current_scene which is inside get_tree.
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	
func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)
