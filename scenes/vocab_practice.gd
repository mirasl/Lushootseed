extends PanelContainer

export var category : String
var term_list : Array
var temp : Array
var overall : Array
var term_number : int = 0

onready var flashcard = $VBoxContainer/Flashcard

func _ready():
	$AllDoneScreen.hide()
	term_list = Global.term_list
	if term_list.size() == 0:
		all_done()
		return
	overall = [] + term_list
	
	randomize()
	overall.shuffle()
	temp = [] + overall
	
	term_number = overall.size() - 1
	
	flashcard.show_term(overall[term_number]["Term"], overall[term_number]["Definition"])
	


func _on_Again_pressed():
	temp.remove(term_number)
	
	term_number -= 1
	if term_number < 0:
		if overall.size() == 0:
			all_done()
			return
		term_number = overall.size() - 1
		randomize()
		overall.shuffle()
	flashcard.show_term(overall[term_number]["Term"], overall[term_number]["Definition"])


func _on_Good_pressed():
	overall.remove(term_number)
	_on_Again_pressed()


func all_done():
	$VBoxContainer.hide()
	$VBoxContainer/MarginContainer/HBoxContainer/Good.disabled = true
	$VBoxContainer/MarginContainer/HBoxContainer/Again.disabled = true
	
	$AllDoneScreen.show()
	$AllDoneScreen/PanelContainer/MarginContainer/VBoxContainer/Restudy.disabled = false
	$AllDoneScreen/PanelContainer/MarginContainer/VBoxContainer/Return.disabled = false


func _on_Restudy_pressed():
	$VBoxContainer.show()
	$VBoxContainer/MarginContainer/HBoxContainer/Good.disabled = false
	$VBoxContainer/MarginContainer/HBoxContainer/Again.disabled = false
	
	$AllDoneScreen/PanelContainer/MarginContainer/VBoxContainer/Restudy.disabled = true
	$AllDoneScreen/PanelContainer/MarginContainer/VBoxContainer/Return.disabled = true
	
	$AllDoneScreen.hide()
	_ready()


func _on_Return_pressed():
	get_tree().change_scene("res://scenes/flashcard_menu.tscn")


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/flashcard_menu.tscn")
