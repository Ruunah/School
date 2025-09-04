func save(save_list):
	var save_file = FileAccess.open("res://save.txt", FileAccess.WRITE)
	var save_string = JSON.stringify(save_list)
	save_file.store_line(save_string)

func load(save_file):
	if not FileAccess.file_exists(save_file) or FileAccess.open(save_file, FileAccess.READ).get_len() == 0:
		return [false, 0, 0]
	
	else:
		var save = FileAccess.open(save_file, FileAccess.READ)
		
		var json = JSON.new()
		var parse_result = json.parse(save)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", save, " at line ", json.get_error_line())
			return [false, 0, 0]
		
		else:
			print(save)
			return save
