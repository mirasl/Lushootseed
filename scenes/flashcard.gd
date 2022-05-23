extends Node

const FILE_PATH = "res://vocab.json"

var data : Array
var term_number : int = 0


func _ready():
	data = get_data()
	print_to_screen()


func get_data() -> Array:
	var f = File.new()
	assert(f.file_exists(FILE_PATH), "File does not exist")
	
	f.open(FILE_PATH, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []


func print_to_screen():
	$Term.bbcode_text = data[term_number]["Term"]
	$Definition.bbcode_text = data[term_number]["Definition"]
	
	
	
	
	
	
