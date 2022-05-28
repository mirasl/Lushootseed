extends Node2D


func _ready():
	for child in get_children():
		if child is TextureButton:
			child.connect("location_pressed", self, "_on_Button_location_pressed")


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/home.tscn")


func _on_Button_location_pressed(LName : String, EName : String):
	var window = preload("res://scenes/place_window.tscn")
	window = window.instance()
	window.LName = LName
	window.EName = EName
	$CanvasLayer.add_child(window)
	window.popup()
