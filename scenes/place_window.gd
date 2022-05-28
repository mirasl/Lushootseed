extends WindowDialog


export var LName : String
export var EName : String


func _ready():
	($PanelContainer/MarginContainer/VBoxContainer/LName.bbcode_text = 
			"[center]%s[/center]" % LName)
	($PanelContainer/MarginContainer/VBoxContainer/EName.bbcode_text = 
			"[center]%s[/center]" % EName)


func _on_Button_pressed():
	queue_free()
