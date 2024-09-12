extends Node2D

const BlockTileMapLayer = preload("res://part/game_board/block_tile_layer/block_tile_map_layer.tscn")

@export var block_kind_n = 3
var block_layer_array: Array[TileMapLayer] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	self.init_block_layer_array()
	
	var block_layer = self.block_layer_array[0]
	block_layer.set_block(Vector2i(0, 1), true)
	block_layer.set_block(Vector2i(1, 0), true)
	
	block_layer = self.block_layer_array[1]
	block_layer.set_block(Vector2i(2, 1), true)
	block_layer.set_block(Vector2i(2, 2), true)
	block_layer.set_block(Vector2i(1, 2), true)
	block_layer.set_block(Vector2i(0, 2), true)
	block_layer.set_block(Vector2i(3, 3), true)
	
	block_layer = self.block_layer_array[2]
	block_layer.set_block(Vector2i(1, 1), true)

func init_block_layer_array():
	for block_kind_index in range(self.block_kind_n):
		self.add_block_layer(block_kind_index)

func add_block_layer(source_id: int=0):
	var block_layer = BlockTileMapLayer.instantiate()
	block_layer.block_source_id = source_id
	
	self.block_layer_array.append(block_layer)
	self.add_child(block_layer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
