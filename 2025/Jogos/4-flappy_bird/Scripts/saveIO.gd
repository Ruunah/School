extends Node

func save(save_list, save_file):
	var savefile = FileAccess.open(save_file, FileAccess.WRITE)
	var save_string = JSON.stringify(save_list)
	savefile.store_line(save_string)
	savefile.close()

func load(save_file):
	if not FileAccess.file_exists(save_file) or FileAccess.open(save_file, FileAccess.READ).get_as_text().strip_edges() != "":
		save([false, 0, 0], save_file)
		return [false, 0, 0]
	
	else:
		var save_text = FileAccess.open(save_file, FileAccess.READ)
		
		var json = JSON.new()
		var parse_result = json.parse(save_text)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", save_text, " at line ", json.get_error_line())
			return [false, 0, 0]
		
		else:
			return save_text
