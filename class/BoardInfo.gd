extends Resource
class_name BoardInfo

@export var board_size: Vector2i = Vector2i(9, 16)
@export var block_kind_n: int = 3
var board_array2d: Array2D = Array2D.new(self.board_size, -1)
