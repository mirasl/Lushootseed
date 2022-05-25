extends Node

export var term_number : int = 0

var data : Array
var revealed = false setget set_revealed


func show_term(term : String, definition : String):
	set_revealed(false)
	print_to_screen(term, definition)


func print_card_number_to_screen(term_number : int): # this is what happens when you dont have overloading
	var term = data[term_number]["Term"]
	$MarginContainer/VBoxContainer/Term.bbcode_text = "[center]%s[/center]" % term
	
	var definition = data[term_number]["Definition"]
	$MarginContainer/VBoxContainer/MarginContainer/Definition.bbcode_text = "[center]%s[/center]" % definition


func print_to_screen(term : String, definition : String):
	$MarginContainer/VBoxContainer/Term.bbcode_text = "[center]%s[/center]" % term
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
