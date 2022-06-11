extends WindowDialog

signal filter_selected

class_name SearchBox

var exit_flag = true

func _ready():
	var x_button = get_close_button()
	x_button.hide()


func add_mini_card(card):
	var term = card["Term"]
	var definition = card["Definition"]
	var mini_card = preload("res://scenes/mini_card.tscn")
	mini_card = mini_card.instance()
	mini_card.term = term
	mini_card.definition = definition
	$PanelContainer/MarginContainer/ScrollContainer/VBoxContainer.add_child(mini_card)


func _on_SearchBox_popup_hide():
	var panel_container = $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer
	for child in panel_container.get_children():
		if child is MiniCard:
			child.queue_free()
	if get_tree().current_scene.get_filename() == "res://scenes/vocab_category_list.tscn" and exit_flag:
		get_parent().hide_gray_overlay()
	exit_flag = true


func _on_CategoryButton_item_selected(index):
	emit_signal("filter_selected", index)


func clear():
	_on_SearchBox_popup_hide()


func set_categories(c):
	$PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/CategoryButton.categories = c


func get_categories():
	return $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/CategoryButton.categories


func _on_Button_pressed():
	queue_free()


#func popup(r = Rect2(0,0,0,0)):
#	.popup()
#	get_parent().add_child()
