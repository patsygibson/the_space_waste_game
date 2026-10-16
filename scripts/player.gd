class_name Player
extends CharacterBody2D

signal laser_shot(laser_scene, location)

@export var speed = 300

@onready var muzzle = $Muzzle

var laser_scene = preload("res://scenes/laser.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	
	#print(direction)
	#Input.get_axis returns in the output dock -1 (for example)  when then the first argument is pressed (example: "move_left" or "move_up" [up in Godot is negative]) 
	#we can now use this vector2 (direction) to set the velocity of the character body (line 9)
	
	velocity = direction * speed
	move_and_slide() #calling this method so that the character body can move
	#However direction on its own direction isn't enough for the player to move at a considerable speed so we add speed to velocity after declaring it at the top.
	
func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)

func die():
	queue_free()
