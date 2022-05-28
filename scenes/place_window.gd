extends WindowDialog


var LName : String
var EName : String
var type


func _ready():
	# Set text:
	($PanelContainer/MarginContainer/VBoxContainer/LName.bbcode_text = 
			"[center]%s[/center]" % LName)
	($PanelContainer/MarginContainer/VBoxContainer/EName.bbcode_text = 
			"[center]%s[/center]" % EName)
	
	# Set color:
	if type == 0:
		$PanelContainer["custom_styles/panel"].bg_color = Color("4d2525")
	elif type == 1:
		$PanelContainer["custom_styles/panel"].bg_color = Color("35465f")


func _on_Button_pressed():
	queue_free()
