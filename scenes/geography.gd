extends Node2D


func _ready():
	for child in get_children():
		if child is TextureButton:
			child.connect("location_pressed", self, "_on_Button_location_pressed")
	$CanvasLayer/GrayPanel.hide()


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/home.tscn")


func _on_Button_location_pressed(LName : String, EName : String, type : int):
	var window = preload("res://scenes/place_window.tscn")
	window = window.instance()
	window.LName = LName
	window.EName = EName
	window.type = type
	$CanvasLayer.add_child(window)
	window.popup()
	$CanvasLayer/GrayPanel.show()


func hide_gray_overlay():
	$CanvasLayer/GrayPanel.hide()
