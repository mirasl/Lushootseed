extends PanelContainer

signal pressed

class_name RichButton

var text : String
var format = true # if true, format with top and bottom spaces and centered
onready var pressed = $Button.pressed


func _ready():
	if format:
		$RichTextLabel.bbcode_text = "[center]\n%s\n[/center]" % text


func _process(delta):
	pressed = $Button.pressed


func _on_Button_pressed():
	emit_signal("pressed")

