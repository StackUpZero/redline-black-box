extends Area2D

# a godot function that runs once black_box appears in the game
func _ready():
	# this connects a godot signal
	# when a body enters this area, call the function "on_body_entered"
	# basically "oh shit something happened" in godot lang
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	# body.name - get the name of the thing that touched the black box
	# != - invers equals to, is not basically
	if body.name != "Player":
		# stop this function here
		return
	print ("Black Box touched by:", body.name)
	
	# get_node - find this node in the scene tree
	# .collect_black_box - run this from that previous fetchsd
	get_node("/root/Main/GameManager").collect_black_box();
	
	# delte this node safley
	queue_free()
