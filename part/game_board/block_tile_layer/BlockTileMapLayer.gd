extends TileMapLayer
class_name BlockTileMapLayer

const BlockTileSet = preload("res://part/game_board/block_tile_layer/tile_set/BlockTileSet.tres")

var block_pattern = ConnectableTileMapPattern.new()
var update_flag: bool = false
@export var block_source_id: int = 0

# Called when the node enters the scene tree for the first time.
func _init():
	self.tile_set = BlockTileSet
	self.update_visual()
	
	pass # Replace with function body.

func update_visual():
	self.set_pattern(Vector2i(0, 0), block_pattern.get_visual())

func set_block(hex_coords: Vector2i, source_flag: bool=false):
	var visual_coords_array = self.get_visual_coords_array(hex_coords)
	
	for visual_coords in visual_coords_array:
		self.block_pattern.set_actual_source_flag(visual_coords, self.block_source_id, source_flag)
	
	self.update_flag = true

func get_block(hex_coords: Vector2i) -> bool:
	return self.block_pattern.get_visual().get_cell_source_id(hex_coords) > -1

func get_visual_coords_array(hex_coords: Vector2i) -> Array[Vector2i]:
	var visual_coords_array: Array[Vector2i] = []
	var origin_visual_coords = hex_coords * 2
	origin_visual_coords.y += hex_coords.x % 2
	
	for offset_x in range(2):
		for offset_y in range(2):
			var visual_coords = origin_visual_coords + Vector2i(offset_x, offset_y)
			
			visual_coords_array.append(visual_coords)
	
	return visual_coords_array

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.update_flag:
		self.update_visual()
		update_flag = false
