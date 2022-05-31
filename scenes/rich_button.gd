extends PanelContainer

signal pressed

class_name RichButton

var text : String
var format = true # if true, format with top and bottom spaces and centered
onready var pressed = $Button.pressed
var disabled = false


func _ready():
	if format:
		$RichTextLabel.bbcode_text = "[center]\n%s\n[/center]" % text


func _process(delta):
#	pressed = $Button.pressed
	$Button.disabled = disabled


func _on_Button_pressed():
	pressed = true
	emit_signal("pressed")

