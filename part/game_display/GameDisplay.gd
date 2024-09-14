extends Node2D
class_name GameDisplay

const This = preload("res://part/game_display/GameDisplay.tscn")
var player_info: BoardInfo
var game_board: GameBoard

func init(player_info: PlayerInfo):
	var this = This.initialize()
	this.player_info = player_info
	
	return this

# Called when the node enters the scene tree for the first time.
func _ready():
	self.game_board = GameBoard.new(self.player_info.board_info)
	self.game_board.position = $GameBoardGuide.position
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
