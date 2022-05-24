extends PanelContainer


func _physics_process(delta):
	rect_size = get_viewport().size


func _on_Button_pressed():
	pass


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/vocab_category_list.tscn")
