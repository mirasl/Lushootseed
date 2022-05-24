extends PanelContainer

class_name MiniCard

export var term : String
export var definition : String


func _ready():
	$VBoxContainer/Term.bbcode_text = "[center]%s[/center]" % term
	$VBoxContainer/Definition.bbcode_text = "[center]%s[/center]" % definition
