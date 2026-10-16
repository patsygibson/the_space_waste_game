extends Area2D

@export var speed = 600

func _physics_process(delta):
	global_position.y += -speed * delta #delta because we want to add to each frame independent 
	#-speed and not speed because up is negative
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()   #Once the laser is out of the screen visibility 


func _on_area_entered(area):
	if area is Bigbrown:
		area.die()
		queue_free()
