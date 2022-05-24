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


func create_search_box(results : Array):
	for card in results:
		$MarginContainer/SearchBox.add_mini_card(card)
	$MarginContainer/SearchBox.popup()


func _on_LineEdit_text_entered(new_text):
	var results : Array = search_cards(new_text)
	create_search_box(results)


func _on_ViewTerms_pressed():
	create_search_box(data) # Create search box of all cards


func _on_OptionButton_item_selected(index):
	var category : String = categories[index]
	print(categories)
	print(category)
	var results : Array = []
	for card in data:
		if card["Category"].nocasecmp_to(category) == 0:
			results.append(card)
	create_search_box(results)
