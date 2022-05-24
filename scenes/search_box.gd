extends WindowDialog

signal filter_selected

class_name SearchBox

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


func _on_CategoryButton_item_selected(index):
	emit_signal("filter_selected", index)


func clear():
	_on_SearchBox_popup_hide()


func set_categories(c):
	$PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/CategoryButton.categories = c
