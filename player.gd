# what node type does the script belong to?
extends CharacterBody2D

# var - is a variable (kinda like a named storage box)
# speed - is the named variable
# 200 - is the stored value 
var speed = 200

func _ready():
		print("Player script is running")
# func is a piece of code you can call later to do a job
# better than writing everything inline
# _physics_process - is a Godot function that runs at the physics update rate
# we use it for movemnt because movement should constantly update
# delta - means the amount of time since last update
# : - means the lines underneath it belong to the func
func _physics_process(delta):
	# Vector2.ZERO - means X is 0, Y is 0
	# player isnt moving yet
	var direction = Vector2.ZERO
	
	# if - checks if something is true
	# Input... - is input action "move_right" being held down?
	# : - if true, run the indented lines below
	if Input.is_key_pressed(KEY_D):
		# direction.x - left/right movement
		# =...+ - means take current x value and add 1
		# positive x means right
		# negative x means left
		# postive y means down
		# negative y means up
		direction.x = direction.x + 1
		
	if Input.is_action_pressed("move_left"):
		direction.x = direction.x - 1
		
	if Input.is_action_pressed("move_down"):
		direction.y = direction.y + 1
		
	if Input.is_action_pressed("move_up"):
		direction.y = direction.y - 1
	
	# velocity - what direction and how fast
	# normalised - clean direction so diagonal movment isnt faster
	# * speed - multipy direction by player speed
	velocity = direction.normalized() * speed
	# move_and_slide() is a builtin CharacterBody2D function that handles the actual movement
	# it uses the velocity set on line 44
	move_and_slide()
	
	# get_tree() - means get running games scene tree
	# .quit() - means close running game
	if Input.is_action_pressed("quit_game"):
		get_tree().quit()
