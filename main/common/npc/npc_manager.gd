class_name NpcManager extends Resource

var active_npcs = {}

const npc_path = "res://resources/data/npc/"

func load_predefined_npcs():
	var npc_dir = DirAccess.open(npc_path)
	if npc_dir:
		npc_dir.list_dir_begin()
		var npc_file = npc_dir.get_next()
		while not npc_file.is_empty():
			if not npc_dir.current_is_dir():
				print(npc_file)
				var npc = load(npc_path + npc_file)
				print(npc.resource_name)
				print(npc.displayName)
			npc_file = npc_dir.get_next()
	
	
	

func get_npc(id: String):
	pass
