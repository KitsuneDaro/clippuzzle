extends Node2D
class_name GameBoard

@export var board_info: BoardInfo
var block_layer_array: Array[TileMapLayer] = []

func _init(board_info: BoardInfo):
	self.board_info = board_info

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func init_block_layer_array():
	for block_kind in range(self.board_info.block_kind_n):
		self.add_block_layer(block_kind)

func add_block_layer(block_kind: int=0):
	var block_layer = BlockTileMapLayer.new()
	block_layer.block_source_id = block_kind
	
	self.block_layer_array.append(block_layer)
	self.add_child(block_layer)

func set_block(hex_coords: Vector2i, setting_block_kind: int):
	if not self.board_info.board_array2d.set_value(hex_coords, setting_block_kind):
		return
	
	var existent_block_kind = -1
	
	for block_kind in range(self.board_info.block_kind_n):
		if self.block_layer.get_block(hex_coords):
			existent_block_kind = block_kind
			break
	
	if existent_block_kind == setting_block_kind:
		return
	
	var setting_block_layer = self.block_layer_array[setting_block_kind]
	setting_block_layer.set_block(hex_coords, true)
	
	if existent_block_kind == -1:
		return
	
	var existent_block_layer = self.block_layer_array[existent_block_kind]
	existent_block_layer.set_block(hex_coords, false)
	
	return

func apply_board():
	for block_kind in range(self.board_info.block_kind_n):
		var block_layer = block_layer_array[block_kind]
		block_layer.get_visual().clear()
	
	for hex_x in range(self.board_info.board_size.x):
		for hex_y in range(self.board_info.board_size.y):
			var hex_coords = Vector2i(hex_x, hex_y)
			var block_kind = self.board_info.board_array2d.get_value(hex_coords)
			
			if block_kind == -1:
				continue
			
			var block_layer = block_layer_array[block_kind]
			
			block_layer.set_cell(hex_coords, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
