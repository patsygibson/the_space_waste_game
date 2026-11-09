#extends Node2D
#class_name Battle_scene
#@onready var player_spawn_pos = $PlayerSpawnPos2
#var player = null
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	
	#$Fade_transition.show()
	#$Fade_transition/AnimationPlayer.play("Fade_out")
	
	#player = get_tree().get_first_node_in_group("player")
	#assert(player!= null) 
	#player.global_position = player_spawn_pos.global_position
	#this is so that even if you move the player object within the 2D workspace, if you run the game the player will still spawn in the spawn position
