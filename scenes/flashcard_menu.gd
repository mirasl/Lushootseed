extends PanelContainer

const FILE_PATH = "res://vocab.json"

var data : Array
var categories : Array = ["All terms"]

func _ready():
	data = Global.get_file_data(FILE_PATH)
	
	for term in data:
		var category : String = term["Category"]
		if not categories.has(category):
			categories.append(category)
	
	var v_box_container = $MarginContainer/VBoxContainer/PanelContainer/MarginContainer/ScrollContainer/VBoxContainer
	var button = preload("res://scenes/button.tscn")
	for category in categories:
		var category_button = button.instance()
		category_button.text = str(" \n" + str(category) + "\n ")
		v_box_container.add_child(category_button)
	
	for child in v_box_container.get_children():
		child.size_flags_horizontal = SIZE_EXPAND_FILL # 3
		child.size_flags_vertical = SIZE_EXPAND_FILL # 3, maybe change to just fill to make scrolling if there's lots of categories
		
