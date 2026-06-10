extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name != "Player":
		return
	
	var game_manager = get_node("/root/Main/GameManager")
	
	if game_manager.has_black_box == false:
		print("Need the black box before extracting")
		return
	
	print("Mission complete")
