extends TextureButton

signal location_pressed

export var LName : String
export var EName : String
export(int, "Village", "Water") var type


func _ready():
	if type == 0: # Village
		set_modulate(Color.lightcoral)
	elif type == 1:
		set_modulate(Color.skyblue)


func _on__pressed():
		emit_signal("location_pressed", LName, EName)
