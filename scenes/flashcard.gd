extends Node

const FILE_PATH = "res://vocab.json"

export var term_number : int = 0

var data : Array
var revealed = false setget set_revealed


func _ready():
	set_revealed(false)
	data = Global.get_file_data(FILE_PATH)
	print_to_screen()


func print_to_screen():
	var term = data[term_number]["Term"]
	$MarginContainer/VBoxContainer/Term.bbcode_text = "[center]%s[/center]" % term
	
	var definition = data[term_number]["Definition"]
	$MarginContainer/VBoxContainer/MarginContainer/Definition.bbcode_text = "[center]%s[/center]" % definition


func set_revealed(state : bool):
	if state:
		$MarginContainer/VBoxContainer/MarginContainer/Definition.show()
		$MarginContainer/VBoxContainer/MarginContainer/Button.hide()
	else:
		$MarginContainer/VBoxContainer/MarginContainer/Definition.hide()
		$MarginContainer/VBoxContainer/MarginContainer/Button.show()


func _on_Button_pressed():
	set_revealed(true)
