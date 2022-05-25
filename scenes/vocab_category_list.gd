extends "res://scenes/menu.gd"

const FILE_PATH = "res://vocab.json"

var data : Array
var categories : Array = ["All terms"]

func _ready():
	data = Global.get_file_data(FILE_PATH)
	
	for term in data:
		var category : String = term["Category"]
		if not categories.has(category):
			categories.append(category)
	
	$MarginContainer/SearchBox/PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/CategoryButton.categories = categories


func _on_LineEdit_text_changed(new_text):
	$MarginContainer/VBoxContainer/VBoxContainer/PanelContainer/VBoxContainer/LineEdit/Label.hide()


func search_cards(text : String) -> Array:
	var results : Array = []
	for card in data:
		if (card["Term"].nocasecmp_to(text) == 0 or 
				card["Definition"].nocasecmp_to(text) == 0):
			results.append(card)
	return results


func create_search_box(results : Array) -> SearchBox:
	for child in $MarginContainer.get_children():
		if child is SearchBox:
			child.queue_free()
	var search_box = preload("res://scenes/search_box.tscn")
	search_box = search_box.instance()
	search_box.set_categories(categories)
	$MarginContainer.add_child(search_box)
	for card in results:
		search_box.add_mini_card(card)
	search_box.popup()
	search_box.connect("filter_selected", self, "_on_SearchBox_filter_selected")
	return search_box


func _on_LineEdit_text_entered(new_text):
	var results : Array = search_cards(new_text)
	create_search_box(results)


func _on_ViewTerms_pressed():
	create_search_box(data) # Create search box of all cards


func _on_SearchBox_filter_selected(index):
	print("hi")
	if index == 0: # All terms selected
		print("hi")
		_on_ViewTerms_pressed()
		return
	var results : Array = []
	var category : String = categories[index]
	for card in data:
		if card["Category"].nocasecmp_to(category) == 0:
			results.append(card)
	var search_box = create_search_box(results)
	var category_button = search_box.get_node_or_null("PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/CategoryButton")
	if category_button:
		category_button.selected = index


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/vocabulary.tscn")


