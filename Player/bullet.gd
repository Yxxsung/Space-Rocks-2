extends Area2D
@export var speed = 1000
var velocity = Vector2.ZERO

#when we fire the bullet we can use the start function below to fire
func start(_transform):
	transform = _transform
	velocity = transform.x * speed
#we wont use the physics system for this, we will just use the process to change
#the position of the bullet

func _process(delta):
	position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

#we have to destroy the object that our bullet hits starting with rocks

func _on_body_entered(body):
	if body.is_in_group("rocks"):
		body.explode() #we will put this function in our rocks scene
		queue_free()
		

func _on_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage()




#place holder so the current code is in the middle of the screen not at the bottom
