extends PanelContainer

export var category : String
var term_list : Array
var temp : Array
var overall : Array
var term_number : int = 0

onready var flashcard = $VBoxContainer/Flashcard

func _ready():
	term_list = Global.term_list
	if term_list.size() == 0:
		print("All done!") # replace with visible indicator
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
			print("All done!") # replace with visible indicator
			return
		term_number = overall.size() - 1
	flashcard.show_term(overall[term_number]["Term"], overall[term_number]["Definition"])


func _on_Good_pressed():
	overall.remove(term_number)
	_on_Again_pressed()




