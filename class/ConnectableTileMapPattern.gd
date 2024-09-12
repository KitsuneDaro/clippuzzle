class_name ConnectableTileMapPattern

var actual_tile_map_pattern: TileMapPattern
var visual_tile_map_pattern: TileMapPattern
const visual_atlas_coords_array: Array[Vector2i] = [
	Vector2i(0, 0), Vector2i(0, 3), Vector2i(1, 0), Vector2i(3, 3),
	Vector2i(3, 0), Vector2i(3, 1), Vector2i(0, 2), Vector2i(2, 3),
	Vector2i(0, 1), Vector2i(2, 0), Vector2i(1, 3), Vector2i(1, 2),
	Vector2i(1, 1), Vector2i(3, 2), Vector2i(2, 1), Vector2i(2, 2)
]
# Vector2i(0, 0)はタイル紹介場所

func _init(actual_tile_map_pattern: TileMapPattern = TileMapPattern.new()):
	self.actual_tile_map_pattern = actual_tile_map_pattern
	self.visual_tile_map_pattern = TileMapPattern.new()
	
	var size = self.actual_tile_map_pattern.get_size()
	
	for coords in self.actual_tile_map_pattern.get_used_cells():
		var source_id = self.get_actual().get_cell_source_id(coords)
		self.set_actual_source_id(coords, source_id)

func set_actual_source_flag(coords: Vector2i, source_id: int=-1, source_flag: bool=false):
	if not source_flag:
		source_id = -1
	
	self.set_actual_source_id(coords, source_id)

func set_actual_source_id(coords: Vector2i, source_id: int=-1):
	self.actual_tile_map_pattern.set_cell(coords, source_id)
	
	for visual_x in range(2):
		for visual_y in range(2):
			var visual_coords = coords + Vector2i(visual_x, visual_y)
			var visual_code = self.get_visual_code(visual_coords)
			
			print(visual_code, source_id)
			
			if visual_code > 0:
				var visual_atlas_coords = visual_atlas_coords_array[visual_code]
				print(visual_atlas_coords)
				self.get_visual().set_cell(visual_coords, source_id, visual_atlas_coords, 0)
			else:
				self.get_visual().set_cell(visual_coords)

func get_actual_source_flag(actual_coords: Vector2i) -> bool:
	return self.get_actual().get_cell_source_id(actual_coords) > -1

func get_visual_atlas_coords(visual_coords: Vector2i) -> Vector2i:
	var visual_code = self.get_visual_code(visual_coords)
	
	return self.visual_atlas_coords_array[visual_code]

func get_visual_code(visual_coords: Vector2i) -> int:
	var visual_code: int = 0
	
	for actual_x in range(2):
		for actual_y in range(2):
			var actual_coords = visual_coords + Vector2i(actual_x - 1, actual_y - 1)
			var actual_flag = self.actual_tile_map_pattern.get_cell_source_id(actual_coords) > -1
			
			visual_code += int(actual_flag) * (2 ** (actual_x + actual_y * 2))
	
	return visual_code

func get_actual() -> TileMapPattern:
	return self.actual_tile_map_pattern

func get_visual() -> TileMapPattern:
	return self.visual_tile_map_pattern
