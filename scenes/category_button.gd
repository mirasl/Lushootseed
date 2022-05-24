extends OptionButton


export var categories : Array setget set_categories


func set_categories(value):
	categories.clear()
	categories = value
	for category in categories:
		add_item(category)
