extends Node

signal new_log(words)

var _logs: Array = []


# Add a new log to the list and emit a signal
func write(words: String) -> void:
	_logs.append(words)
	emit_signal("new_log", words)
