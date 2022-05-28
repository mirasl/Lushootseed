extends PanelContainer


func _physics_process(delta):
	rect_size = get_viewport().size
	

func _on_Back_pressed():
	get_tree().change_scene("res://scenes/home.tscn")
