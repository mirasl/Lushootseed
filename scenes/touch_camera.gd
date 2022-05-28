# http://kidscancode.org/godot_recipes/2d/touchscreen_camera/#:~:text=A%20%E2%80
# %9Cpinch%E2%80%9D%20gesture%20will%20trigger,%2C%20we'll%20zoom%20out.
extends Camera2D 

const EPSILON = 0.1

var min_zoom = 0.5
var max_zoom = 4
var zoom_sensitivity = 10
var zoom_speed = 0.05
var border = Rect2(-1000, -2000, 3200, 5800)

var events = {}
var last_drag_distance = 0

var last_center = Vector2()
var last_position = Vector2()

var position_limits : Rect2 = Rect2(-100000000, -100000000, 100000000, 100000000)
var within_left_limit = true
var within_right_limit = true
var within_top_limit = true
var within_bottom_limit = true


func _ready():
	last_center = get_camera_screen_center()
	last_position = position


func _process(delta):
#	if not equivalent(position.x, last_position.x) and equivalent(get_camera_screen_center().x, last_center.x):
#		if position.x < last_position.x and within_left_limit: # left limit reached
#			print("LEFT limit reached")
#			position_limits.position.x = position.x - 10
#			within_left_limit = false
#		elif position.x > last_position.x and within_right_limit: # right limit reached
#			print("RIGHT limit reached")
#			position_limits.size.x = position.x + 10
#			within_right_limit = false
#		position = last_position
#
#	if not equivalent(position.y, last_position.y) and equivalent(get_camera_screen_center().y, last_center.y):
#		if position.y < last_position.y and within_top_limit: # top limit reached
#			print("TOP limit reached")
#			position_limits.position.y = position.y - 10
#			within_top_limit = false
#		elif position.y > last_position.y and within_bottom_limit:# bottom limit reached
#			print("BOTTOM limit reached")
#			position_limits.size.y = position.y + 10
#			within_bottom_limit = false
#		position = last_position
	
	last_center = get_camera_screen_center()
	last_position = position


func equivalent(a : float, b : float, epsilon = EPSILON) -> bool:
	return abs(a - b) <= epsilon


func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			events[event.index] = event
		else:
			events.erase(event.index)
	
	if event is InputEventScreenDrag:
		events[event.index] = event
		if events.size() == 1: # one touch
			var nextpos = position + event.relative*zoom.x*-1
			if -1000 < nextpos.x and nextpos.x < 2000 and -2000 < nextpos.y and nextpos.y < 5800:
				position.x = clamp(position.x - event.relative.rotated(rotation).x * zoom.x, position_limits.position.x, position_limits.size.x)
				position.y = clamp(position.y - event.relative.rotated(rotation).y * zoom.x, position_limits.position.y, position_limits.size.y)
		
		elif events.size() == 2: # two touches at once
			var drag_distance = events.values()[0].position.distance_to(events.values()[1].position)
			if abs(drag_distance - last_drag_distance) > zoom_sensitivity:
				var new_zoom = (1 + zoom_speed) if drag_distance < last_drag_distance else (1 - zoom_speed)
				new_zoom = clamp(zoom.x * new_zoom, min_zoom, max_zoom)
				zoom = Vector2.ONE * new_zoom
				last_drag_distance = drag_distance
	
