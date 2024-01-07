@tool
class_name DialogueMenu extends Node

var option_1: String = ""
var option_2: String = ""
var option_3: String = ""

func _get_property_list():
	var entry_count = self.get_child_count()
	
	var properties:Array[Dictionary] = []
	
	for i in range(max(entry_count,3)):
		properties.append({
			"name": "option_" + str(i+1),
			"type": TYPE_STRING,
			"usage": PROPERTY_USAGE_DEFAULT,
			"hint": PROPERTY_HINT_PLACEHOLDER_TEXT,
			"hint_string": "Menu entry text...",
		})
	return properties
