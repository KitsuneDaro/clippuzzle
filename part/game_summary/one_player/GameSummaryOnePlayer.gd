extends Node2D

@export var game_info: GameInfo
var game_controller: GameController
var game_board: GameBoard

# Called when the node enters the scene tree for the first time.
func _ready():
	self.game_info = GameInfo.new()
	self.game_info.mode = GameInfo.GameMode.ONE_PLAYER
	
	var player_info: PlayerInfo = PlayerInfo.new()
	self.game_info.player_info_array.append(player_info)
	
	self.game_controller = GameController.new(game_info)
	self.game_board = GameBoard.new(player_info.board_info)
	
	add_child(self.game_board)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
