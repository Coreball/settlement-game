class_name Util


# The JSON result from parsing file at [path]
static func json_result(path: String):
	var file: File = File.new()
	file.open(path, file.READ)
	var json = JSON.parse(file.get_as_text())
	file.close()
	if json.error == OK:
		return json.result
	else:
		print(json.error_string)
		return null
