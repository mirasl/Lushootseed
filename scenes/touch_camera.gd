# http://kidscancode.org/godot_recipes/2d/touchscreen_camera/#:~:text=A%20%E2%80
# %9Cpinch%E2%80%9D%20gesture%20will%20trigger,%2C%20we'll%20zoom%20out.
#
# https://godotengine.org/qa/66634/how-to-check-if-a-camera2d-reached-its-limits
extends Camera2D 

const LIMITS = Rect2(-1000, 1000, 3500, 5000)

var min_zoom = 0.5
var max_zoom = 4
var zoom_sensitivity = 10
var zoom_speed = 0.05

var events = {}
var last_drag_distance = 0


func _unhandled_input(event):
	if event is InputEventScreenTouch:
		for e in events:
			events.erase(e)
		if event.pressed:
			events[event.index] = event
	
	
	if event is InputEventScreenDrag:
		events[event.index] = event
		if events.size() == 1: # one touch
			var nextpos = position - event.relative*zoom.x
			if (LIMITS.position.x < nextpos.x and 
					nextpos.x < LIMITS.size.x and
					LIMITS.position.y < nextpos.y and
					nextpos.y < LIMITS.size.y):
				position = position - event.relative.rotated(rotation) * zoom.x
		
		elif events.size() == 2: # two touches at once
			var drag_distance = events.values()[0].position.distance_to(events.values()[1].position)
			if abs(drag_distance - last_drag_distance) > zoom_sensitivity:
				var new_zoom = (1 + zoom_speed) if drag_distance < last_drag_distance else (1 - zoom_speed)
				new_zoom = clamp(zoom.x * new_zoom, min_zoom, max_zoom)
				zoom = Vector2.ONE * new_zoom
				last_drag_distance = drag_distance
	
