extends Node


func get_file_data(file_path : String) -> Array:
	var f = File.new()
	assert(f.file_exists(file_path), "File does not exist")
	
	f.open(file_path, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
